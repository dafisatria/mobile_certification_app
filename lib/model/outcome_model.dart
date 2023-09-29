class OutcomeModel {
  int? idOutcome, nominal;
  String? date, desc;
  OutcomeModel({
    this.idOutcome,
    this.date,
    this.desc,
    this.nominal,
  });
  factory OutcomeModel.fromJson(Map<String, dynamic> json) {
    return OutcomeModel(
      idOutcome: json['idOutcome'],
      date: json['date'],
      desc: json['desc'],
      nominal: json['nominal'],
    );
  }
}
