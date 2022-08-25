import 'dart:convert';

class AccountDto {
  String address;
  String password;

  AccountDto({required this.address, required this.password});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'password': password,
      };

  @override
  String toString() {
    return const JsonEncoder.withIndent(' ').convert(toJson());
  }
}
