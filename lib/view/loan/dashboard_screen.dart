import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/loan_agreement_screen.dart';
import 'package:flutter09/view/loan/loan_amount_screen.dart';
import 'package:flutter09/view/loan/loan_details_screen.dart';
import 'package:flutter09/view/loan/loan_purpose_screen.dart';
import 'package:flutter09/view/loan/personal_information_screen.dart';
import 'package:flutter09/view/widgets/custom_button.dart';

CreditScoringData creditScoringData = CreditScoringData();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final pageItem = <StepIndicatorModel>[];

  int _pageIndex = 0;
  final PageController _pageController = PageController();
  late LoanPurposeScreen _loanPurposeScreen;

  @override
  void initState() {
    _loanPurposeScreen = LoanPurposeScreen();
    pageItem
        .add(StepIndicatorModel(PersonalInformationScreen(), statusFlag: 1));
    pageItem.add(StepIndicatorModel(
      _loanPurposeScreen,
    ));
    pageItem.add(StepIndicatorModel(
      LoanAmountScreen(),
    ));
    pageItem.add(StepIndicatorModel(
      LoanDetailsScreen(),
    ));
    _loanPurposeScreen.onPurposeSelected = (value) {
      _moveToAnotherPage();
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _pageIndex--;
        _pageController.previousPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildHeader(0),
                      _buildHeader(1),
                      _buildHeader(2),
                      _buildHeader(3),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("${_pageIndex + 1}/${pageItem.length}"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: pageItem.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final steps = pageItem[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: steps.statusFlag == 0
                                          ? Colors.grey
                                          : steps.statusFlag == 1
                                              ? Colors.blue
                                              : Colors.green,
                                      border: Border.all(
                                          color: steps.statusFlag == 0
                                              ? Colors.grey
                                              : steps.statusFlag == 1
                                                  ? Colors.blue
                                                  : Colors.green),
                                      borderRadius: BorderRadius.circular(100)),
                                  height: 35,
                                  width: 35,
                                ),
                                if (index != pageItem.length - 1)
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    color: Colors.black87,
                                    height: 2,
                                  ),
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: pageItem.length,
                    onPageChanged: (value) =>
                        setState(() => currentPage = value),
                    itemBuilder: (context, index) {
                      final page = pageItem[_pageIndex];
                      return PageStorage(
                          bucket: PageStorageBucket(), child: page.widget);
                    }),
              ),
              if (_pageIndex != 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    onPressed: () {
                      if (_pageIndex == 0) {
                        if (_checkForFormValidation()) {
                          _moveToAnotherPage();
                        }
                      } else if (_pageIndex == 2) {
                        _hitCreditScoringServer();
                      } else {
                        if (creditScoringData.isApproved) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LoanAgreementScreen()));
                        } else {
                          _moveToAnotherPage();
                        }
                      }
                    },
                  ),
                ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  int currentPage = 0;

  Widget _buildHeader(int headerIndex) {
    return _pageIndex == headerIndex
        ? Row(
            children: [
              Text(
                _getHeaderName(headerIndex),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )
        : Container(
            width: MediaQuery.of(context).size.width * 0.23,
          );
  }

  String _getHeaderName(int headerIndex) {
    if (headerIndex == 0) {
      return "Personal\nInformation";
    } else if (headerIndex == 1) {
      return "Loan Purpose";
    } else if (headerIndex == 2) {
      return "Loan Amount";
    }
    return "Loan Status";
  }

  void _moveToAnotherPage() {
    pageItem[_pageIndex].statusFlag = 2;
    _pageIndex++;
    pageItem[_pageIndex].statusFlag = 1;
    _pageController.animateToPage(_pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    setState(() {});
  }

  bool _checkForFormValidation() {
    return creditScoringData.fullName != null &&
        creditScoringData.occupation != null &&
        creditScoringData.company != null &&
        creditScoringData.industry != null &&
        creditScoringData.companyAddress != null &&
        creditScoringData.annualIncome != null;
  }

  void _hitCreditScoringServer() async {
    final response = await Dio().post("http://192.168.0.7:8081/loans", data: {
      "loan_purpose": creditScoringData.loanPurpose,
      "debt_to_income": 18,
      "annual_income": creditScoringData.annualIncome,
      "total_debit_limit": 11100,
      "total_credit_utilized": 38767,
      "current_installment_accounts": 2,
      "total_credit_limit": 28800,
      "accounts_opened_24m": 5,
      "earliest_credit_line": 2001,
      "months_since_last_credit_inquiry": 5
    });
    if (response.statusCode == 200) {
      final prediction = response.data["prediction"] as double;
      creditScoringData.predictedLoanAmount = prediction.toInt();
      if ((creditScoringData.requestedLoanAmount ?? 0) > prediction) {
        creditScoringData.isApproved = false;
      } else {
        creditScoringData.isApproved = true;
      }
      _moveToAnotherPage();
    }
  }
}

class StepIndicatorModel {
  Widget widget;
  int? statusFlag;

  // 0 -> Nothing
  // 1 -> Selected
  // 2 -> Completed

  StepIndicatorModel(this.widget, {this.statusFlag = 0});
}

class CreditScoringData {
  String? fullName;
  String? occupation;
  String? company;
  bool isApproved;
  String? industry;
  String? companyAddress;
  int? annualIncome;
  int? requestedLoanAmount;
  int? predictedLoanAmount;
  String? loanPurpose;

  CreditScoringData(
      {this.fullName,
      this.occupation,
      this.company,
      this.industry,
      this.isApproved = false,
      this.companyAddress,
      this.predictedLoanAmount,
      this.annualIncome,
      this.requestedLoanAmount,
      this.loanPurpose});
}
