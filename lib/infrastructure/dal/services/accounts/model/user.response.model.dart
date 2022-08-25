class UserResponse {
  String? context;
  String? type;
  String? id;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? error;

  UserResponse({
    this.context,
    this.type,
    this.id,
    this.address,
    this.quota,
    this.used,
    this.isDisabled,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.error,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    type = json['@type'];
    id = json['id'];
    address = json['address'];
    quota = json['quota'];
    used = json['used'];
    isDisabled = json['isDisabled'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    error = json['hydra:description'];
  }

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
    data['hydra:description'] = error;
    return data;
  }
}
