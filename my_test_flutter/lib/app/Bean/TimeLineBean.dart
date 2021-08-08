// To parse this JSON data, do
//
//     final timeLine = timeLineFromJson(jsonString);

import 'dart:convert';

TimeLine timeLineFromJson(String str) => TimeLine.fromJson(json.decode(str));

String timeLineToJson(TimeLine data) => json.encode(data.toJson());

class TimeLine {
  TimeLine({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  List<Datum> data;
  int errorCode;
  String errorMsg;

  factory TimeLine.fromJson(Map<String, dynamic> json) => TimeLine(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class Datum {
  Datum({
    required this.children,
    required this.courseId,
    required this.id,
    required this.name,
    required this.order,
    required this.parentChapterId,
    required this.userControlSetTop,
    required this.visible,
  });

  List<dynamic> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    children: List<dynamic>.from(json["children"].map((x) => x)),
    courseId: json["courseId"],
    id: json["id"],
    name: json["name"],
    order: json["order"],
    parentChapterId: json["parentChapterId"],
    userControlSetTop: json["userControlSetTop"],
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "children": List<dynamic>.from(children.map((x) => x)),
    "courseId": courseId,
    "id": id,
    "name": name,
    "order": order,
    "parentChapterId": parentChapterId,
    "userControlSetTop": userControlSetTop,
    "visible": visible,
  };
}
