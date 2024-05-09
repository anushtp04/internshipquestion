// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  String? message;
  Data? data;

  DataModel({
    this.message,
    this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<ListElement> list;
  int totalCount;

  Data({
    required this.list,
    required this.totalCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "totalCount": totalCount,
  };
}

class ListElement {
  String id;
  String name;
  dynamic globalGalleryCategoryId;
  int docType;
  int uid;
  int type;
  String url;
  String createdUserId;
  int createdAt;
  dynamic updatedUserId;
  int updatedAt;
  int status;
  int v;

  ListElement({
    required this.id,
    required this.name,
    required this.globalGalleryCategoryId,
    required this.docType,
    required this.uid,
    required this.type,
    required this.url,
    required this.createdUserId,
    required this.createdAt,
    required this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["_id"],
    name: json["_name"],
    globalGalleryCategoryId: json["_globalGalleryCategoryId"],
    docType: json["_docType"],
    uid: json["_uid"],
    type: json["_type"],
    url: json["_url"],
    createdUserId: json["_createdUserId"],
    createdAt: json["_createdAt"],
    updatedUserId: json["_updatedUserId"],
    updatedAt: json["_updatedAt"],
    status: json["_status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "_name": name,
    "_globalGalleryCategoryId": globalGalleryCategoryId,
    "_docType": docType,
    "_uid": uid,
    "_type": type,
    "_url": url,
    "_createdUserId": createdUserId,
    "_createdAt": createdAt,
    "_updatedUserId": updatedUserId,
    "_updatedAt": updatedAt,
    "_status": status,
    "__v": v,
  };
}
