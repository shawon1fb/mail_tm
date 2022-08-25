import 'dart:convert';

class UserData {
  String context;
  String type;
  String id;
  String address;
  int quota;
  int used;
  bool isDisabled;
  bool isDeleted;
  String createdAt;
  String updatedAt;

  UserData({
    required this.context,
    required this.type,
    required this.id,
    required this.address,
    required this.quota,
    required this.used,
    required this.isDisabled,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@context'] = context;
    data['@type'] = type;
    data['id'] = id;
    data['address'] = address;
    data['quota'] = quota;
    data['used'] = used;
    data['isDisabled'] = isDisabled;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  @override
  String toString() {
    return const JsonEncoder.withIndent(' ').convert(toJson());
  }
}
