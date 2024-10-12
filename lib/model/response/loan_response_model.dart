/// loan_purpose : "credit_card"
/// debt_to_income : 18
/// annual_income : 40000
/// total_debit_limit : 11100
/// total_credit_utilized : 38767
/// current_installment_accounts : 2
/// total_credit_limit : 28800
/// accounts_opened_24m : 5
/// earliest_credit_line : 2001
/// months_since_last_credit_inquiry : 5

class LoanResponseModel {
  LoanResponseModel({
    String? loanPurpose,
    int? debtToIncome,
    int? annualIncome,
    int? totalDebitLimit,
    int? totalCreditUtilized,
    int? currentInstallmentAccounts,
    int? totalCreditLimit,
    int? accountsOpened24m,
    int? earliestCreditLine,
    int? monthsSinceLastCreditInquiry,
  }) {
    _loanPurpose = loanPurpose;
    _debtToIncome = debtToIncome;
    _annualIncome = annualIncome;
    _totalDebitLimit = totalDebitLimit;
    _totalCreditUtilized = totalCreditUtilized;
    _currentInstallmentAccounts = currentInstallmentAccounts;
    _totalCreditLimit = totalCreditLimit;
    _accountsOpened24m = accountsOpened24m;
    _earliestCreditLine = earliestCreditLine;
    _monthsSinceLastCreditInquiry = monthsSinceLastCreditInquiry;
  }

  LoanResponseModel.fromJson(dynamic json) {
    _loanPurpose = json['loan_purpose'];
    _debtToIncome = json['debt_to_income'];
    _annualIncome = json['annual_income'];
    _totalDebitLimit = json['total_debit_limit'];
    _totalCreditUtilized = json['total_credit_utilized'];
    _currentInstallmentAccounts = json['current_installment_accounts'];
    _totalCreditLimit = json['total_credit_limit'];
    _accountsOpened24m = json['accounts_opened_24m'];
    _earliestCreditLine = json['earliest_credit_line'];
    _monthsSinceLastCreditInquiry = json['months_since_last_credit_inquiry'];
  }

  String? _loanPurpose;
  int? _debtToIncome;
  int? _annualIncome;
  int? _totalDebitLimit;
  int? _totalCreditUtilized;
  int? _currentInstallmentAccounts;
  int? _totalCreditLimit;
  int? _accountsOpened24m;
  int? _earliestCreditLine;
  int? _monthsSinceLastCreditInquiry;

  LoanResponseModel copyWith({
    String? loanPurpose,
    int? debtToIncome,
    int? annualIncome,
    int? totalDebitLimit,
    int? totalCreditUtilized,
    int? currentInstallmentAccounts,
    int? totalCreditLimit,
    int? accountsOpened24m,
    int? earliestCreditLine,
    int? monthsSinceLastCreditInquiry,
  }) =>
      LoanResponseModel(
        loanPurpose: loanPurpose ?? _loanPurpose,
        debtToIncome: debtToIncome ?? _debtToIncome,
        annualIncome: annualIncome ?? _annualIncome,
        totalDebitLimit: totalDebitLimit ?? _totalDebitLimit,
        totalCreditUtilized: totalCreditUtilized ?? _totalCreditUtilized,
        currentInstallmentAccounts:
            currentInstallmentAccounts ?? _currentInstallmentAccounts,
        totalCreditLimit: totalCreditLimit ?? _totalCreditLimit,
        accountsOpened24m: accountsOpened24m ?? _accountsOpened24m,
        earliestCreditLine: earliestCreditLine ?? _earliestCreditLine,
        monthsSinceLastCreditInquiry:
            monthsSinceLastCreditInquiry ?? _monthsSinceLastCreditInquiry,
      );

  String? get loanPurpose => _loanPurpose;

  int? get debtToIncome => _debtToIncome;

  int? get annualIncome => _annualIncome;

  int? get totalDebitLimit => _totalDebitLimit;

  int? get totalCreditUtilized => _totalCreditUtilized;

  int? get currentInstallmentAccounts => _currentInstallmentAccounts;

  int? get totalCreditLimit => _totalCreditLimit;

  int? get accountsOpened24m => _accountsOpened24m;

  int? get earliestCreditLine => _earliestCreditLine;

  int? get monthsSinceLastCreditInquiry => _monthsSinceLastCreditInquiry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loan_purpose'] = _loanPurpose;
    map['debt_to_income'] = _debtToIncome;
    map['annual_income'] = _annualIncome;
    map['total_debit_limit'] = _totalDebitLimit;
    map['total_credit_utilized'] = _totalCreditUtilized;
    map['current_installment_accounts'] = _currentInstallmentAccounts;
    map['total_credit_limit'] = _totalCreditLimit;
    map['accounts_opened_24m'] = _accountsOpened24m;
    map['earliest_credit_line'] = _earliestCreditLine;
    map['months_since_last_credit_inquiry'] = _monthsSinceLastCreditInquiry;
    return map;
  }
}
