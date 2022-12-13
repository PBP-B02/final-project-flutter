// To parse this JSON data, do
//
//     final myIncome = myIncomeFromJson(jsonString);

import 'dart:convert';

List<MyIncome> myIncomeFromJson(String str) =>
    List<MyIncome>.from(json.decode(str).map((x) => MyIncome.fromJson(x)));

String myIncomeToJson(List<MyIncome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyIncome {
  MyIncome({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model model;
  int pk;
  Fields fields;

  factory MyIncome.fromJson(Map<String, dynamic> json) => MyIncome(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );


  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.date,
    required this.name,
    required this.amount,
    required this.incomeType,
  });

  DateTime date;
  String name;
  int amount;
  IncomeType incomeType;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        date: DateTime.parse(json["date"]),
        name: json["name"],
        amount: json["amount"],
        incomeType: incomeTypeValues.map[json["income_type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "amount": amount,
        "income_type": incomeTypeValues.reverse[incomeType],
      };
}

enum IncomeType { SALARY, PASSIVE }

final incomeTypeValues =
    EnumValues({"Passive": IncomeType.PASSIVE, "Salary": IncomeType.SALARY});

enum Model { CASHFLOW_INCOME }

final modelValues = EnumValues({"cashflow.income": Model.CASHFLOW_INCOME});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
