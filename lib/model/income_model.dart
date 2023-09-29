import 'dart:convert';

class IncomeModel {
  int? idIncome, nominal;
  String? date, desc;

  IncomeModel({
    this.idIncome,
    this.date,
    this.desc,
    this.nominal,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      idIncome: json['idIncome'],
      date: json['date'],
      desc: json['desc'],
      nominal: json['nominal'],
    );
  }
}
