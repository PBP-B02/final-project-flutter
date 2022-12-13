// To parse this JSON data, do
//
//     final mySpending = mySpendingFromJson(jsonString);

import 'dart:convert';

List<MySpending> mySpendingFromJson(String str) =>
    List<MySpending>.from(json.decode(str).map((x) => MySpending.fromJson(x)));

String mySpendingToJson(List<MySpending> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MySpending {
  MySpending({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model model;
  int pk;
  Fields fields;

  factory MySpending.fromJson(Map<String, dynamic> json) => MySpending(
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
    required this.spendingType,
  });

  DateTime date;
  String name;
  int amount;
  String spendingType;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        date: DateTime.parse(json["date"]),
        name: json["name"],
        amount: json["amount"],
        spendingType: json["spending_type"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "amount": amount,
        "spending_type": spendingType,
      };
}

enum Model { CASHFLOW_SPENDING }

final modelValues = EnumValues({"cashflow.spending": Model.CASHFLOW_SPENDING});

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
