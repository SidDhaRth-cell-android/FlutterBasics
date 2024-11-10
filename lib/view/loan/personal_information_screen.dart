import 'package:flutter/material.dart';
import 'package:flutter09/view/loan/dashboard_screen.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _industryController = TextEditingController();
  TextEditingController _companyAddressController = TextEditingController();
  TextEditingController _annualIncomeController = TextEditingController();

  @override
  void initState() {
    _fullNameController.text = creditScoringData.fullName ?? "";
    _occupationController.text = creditScoringData.occupation ?? "";
    _companyController.text = creditScoringData.companyAddress ?? "";
    _industryController.text = creditScoringData.industry ?? "";
    _companyAddressController.text = creditScoringData.companyAddress ?? "";
    if (creditScoringData.annualIncome != null)
      _annualIncomeController.text = creditScoringData.annualIncome.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _userIdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter User Id",
                  labelText: "User Id"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "UserId is mandatory";
                }
                return null;
              },
              onChanged: (value) {
                creditScoringData.userId = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Full Name",
                  labelText: "Full Name"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Name is mandatory";
                }
                return null;
              },
              onChanged: (value) {
                creditScoringData.fullName = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _occupationController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Occupation",
                  labelText: "Occupation"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Occupation is mandatory";
                }
                return null;
              },
              onChanged: (value) {
                creditScoringData.occupation = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _companyController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Company",
                  labelText: "Company"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Company is mandatory";
                }
                return null;
              },
              onChanged: (value) {
                creditScoringData.company = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _industryController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Industry",
                  labelText: "Industry"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Industry is mandatory";
                }
                return null;
              },
              onChanged: (value) {
                creditScoringData.industry = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _companyAddressController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Company Address",
                  labelText: "Company Address"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Company Address is mandatory";
                }
                return null;
              },
              onChanged: (value) {
                creditScoringData.companyAddress = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _annualIncomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Annual Income",
                  labelText: "Annual Income"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Annual Income is mandatory";
                }
                return null;
              },
              onChanged: (value) {
                creditScoringData.annualIncome = int.parse(value);
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
