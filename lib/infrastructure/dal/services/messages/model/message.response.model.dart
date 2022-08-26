class MessagesResponseModel {
  String? context;
  String? type;
  List<HydraMember>? hydraMember;
  int? hydraTotalItems;
  String? message;

  MessagesResponseModel(
      {this.context,
        this.type,
        this.hydraMember,
        this.hydraTotalItems,
        this.message});

  MessagesResponseModel.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    type = json['@type'];
    if (json['hydra:member'] != null) {
      hydraMember = <HydraMember>[];
      json['hydra:member'].forEach((v) {
        hydraMember?.add(HydraMember.fromJson(v));
      });
    }
    hydraTotalItems = json['hydra:totalItems'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@context'] = context;
    data['@type'] = type;
    if (hydraMember != null) {
      data['hydra:member'] = hydraMember?.map((v) => v.toJson()).toList();
    }
    data['hydra:totalItems'] = hydraTotalItems;
    data['message'] = message;
    return data;
  }
}

class HydraMember {
  String? type;
  String? id;
  String? accountId;
  String? msgid;
  From? from;
  List<From>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? createdAt;
  String? updatedAt;

  HydraMember(
      {this.type,
        this.id,
        this.accountId,
        this.msgid,
        this.from,
        this.to,
        this.subject,
        this.intro,
        this.seen,
        this.isDeleted,
        this.hasAttachments,
        this.size,
        this.downloadUrl,
        this.createdAt,
        this.updatedAt});

  HydraMember.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    id = json['id'];
    accountId = json['accountId'];
    msgid = json['msgid'];
    from = json['from'] != null ? From?.fromJson(json['from']) : null;
    if (json['to'] != null) {
      to = <From>[];
      json['to'].forEach((v) {
        to?.add(From.fromJson(v));
      });
    }
    subject = json['subject'];
    intro = json['intro'];
    seen = json['seen'];
    isDeleted = json['isDeleted'];
    hasAttachments = json['hasAttachments'];
    size = json['size'];
    downloadUrl = json['downloadUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@type'] = type;
    data['id'] = id;
    data['accountId'] = accountId;
    data['msgid'] = msgid;
    if (from != null) {
      data['from'] = from?.toJson();
    }
    if (to != null) {
      data['to'] = to?.map((v) => v.toJson()).toList();
    }
    data['subject'] = subject;
    data['intro'] = intro;
    data['seen'] = seen;
    data['isDeleted'] = isDeleted;
    data['hasAttachments'] = hasAttachments;
    data['size'] = size;
    data['downloadUrl'] = downloadUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class From {
  String? address;
  String? name;

  From({this.address, this.name});

  From.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}
