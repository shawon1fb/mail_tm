class TokenResponse {
  String? token;
  String? id;
  String? message;

  TokenResponse({this.token, this.id, this.message});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['message'] = message;
    return data;
  }
}
