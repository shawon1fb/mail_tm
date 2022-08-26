import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/sign_up.controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SignUpScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
