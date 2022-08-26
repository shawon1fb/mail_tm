import 'dart:convert';

class MessageDataModel {
  FromUser from;
  List<FromUser> to;
  String subject;
  String intro;
  bool seen;
  String id;

  String createdAt;

  MessageDataModel({
    required this.from,
    required this.to,
    required this.subject,
    required this.intro,
    required this.seen,
    required this.createdAt,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['from'] = from.toJson();
    data['to'] = to.map((v) => v.toJson()).toList();
    data['subject'] = subject;
    data['intro'] = intro;
    data['seen'] = seen;
    data['createdAt'] = createdAt;
    data['id'] = id;

    return data;
  }

  @override
  String toString() {
    return const JsonEncoder.withIndent(' ').convert(toJson());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageDataModel &&
          runtimeType == other.runtimeType &&
          hashCode == other.hashCode;

  @override
  int get hashCode => id.hashCode;
}

class FromUser {
  String address;
  String name;

  FromUser({
    required this.address,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}
