import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../domain/core/exceptions/forbidden.exception.dart';
import '../../infrastructure/dal/services/accounts/dto/account.dto.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../values/values.dart';
import '../shared/buttons/animated_button_widget.dart';
import '../shared/no_internet_widget/no_internet_widget.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import '../shared/widgets/custom_text_form_field.dart';
import '../shared/widgets/spaces.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  final FocusNode addressNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final TextEditingController addressController =
      TextEditingController(text: 'shawon@arxxwalls.com');
  final TextEditingController passwordController =
      TextEditingController(text: '123456');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: NoInternetWidget(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                child: ClipPath(
                  clipper: ReverseWaveShapeClipper(),
                  child: Container(
                    height: heightOfScreen * 0.5,
                    width: widthOfScreen,
                    decoration: const BoxDecoration(
                      gradient: Gradients.curvesGradient3,
                    ),
                  ),
                ),
              ),
              ListView(
                padding: const EdgeInsets.all(Sizes.PADDING_0),
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: heightOfScreen * 0.5 * 0.90,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: widthOfScreen * 0.15),
                    child: Text(
                      StringConst.LOG_IN,
                      style: theme.textTheme.headline3?.copyWith(
                        color: AppColors.deepBrown,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightOfScreen * 0.05,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_20),
                    child: _buildForm(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            hasTitle: true,
            focusNode: addressNode,
            nextNode: passwordNode,
            controller: addressController,
            title: StringConst.ADDRESS,
            titleStyle: theme.textTheme.subtitle1?.copyWith(
              color: AppColors.deepDarkGreen,
              fontSize: Sizes.TEXT_SIZE_14,
            ),
            textInputType: TextInputType.text,
            hintTextStyle: Styles.customTextStyle(
              color: AppColors.greyShade7,
            ),
            enabledBorder: Borders.customUnderlineInputBorder(
              color: AppColors.lighterBlue2,
            ),
            focusedBorder: Borders.customUnderlineInputBorder(
              color: AppColors.lightGreenShade1,
            ),
            textStyle: Styles.customTextStyle(
              color: AppColors.blackShade10,
            ),
            hintText: StringConst.EMAIL_HINT_TEXT,
          ),
          const SpaceH16(),
          CustomTextFormField(
            hasTitle: true,
            focusNode: passwordNode,
            controller: passwordController,
            title: StringConst.PASSWORD,
            titleStyle: theme.textTheme.subtitle1?.copyWith(
              color: AppColors.deepDarkGreen,
              fontSize: Sizes.TEXT_SIZE_14,
            ),
            textInputType: TextInputType.text,
            hintTextStyle: Styles.customTextStyle(
              color: AppColors.greyShade7,
            ),
            enabledBorder: Borders.customUnderlineInputBorder(
              color: AppColors.lighterBlue2,
            ),
            focusedBorder: Borders.customUnderlineInputBorder(
              color: AppColors.lightGreenShade1,
            ),
            textStyle: Styles.customTextStyle(
              color: AppColors.blackShade10,
            ),
            hintText: StringConst.PASSWORD_HINT_TEXT,
            obscured: true,
          ),
          const SpaceH20(),
          SizedBox(
            width: widthOfScreen * 0.6,
            child: Center(
              child: AnimatedButton(
                text: StringConst.LOG_IN_4,
                backgroundColor: AppColors.deepLimeGreen,
                textStyle: theme.textTheme.button?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.TEXT_SIZE_16,
                ),
                preAnimationCallback: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                },
                onTap: () async {
                  try {
                    if (_formKey.currentState!.validate()) {
                      await controller.loginMethod(
                        address: addressController.text.trim(),
                        password: passwordController.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login Success')),
                      );
                      Get.offAllNamed(Routes.HOME);
                    }
                  } on ForbiddenException catch (e) {
                    // Get.snackbar('Invalid', e.message);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message)),
                    );
                  } catch (e, t) {
                    debugPrint(e.toString());
                    debugPrint(t.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('something went wrong')),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: heightOfScreen * 0.04,
          ),
          InkWell(
            onTap: () async {
              var content = await Get.toNamed(Routes.SIGN_UP);
              if (content != null) {
                Map dto = json.decode(content);
                addressController.text = dto['address'];
                passwordController.text = dto['password'];
              }
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: StringConst.DONT_HAVE_AN_ACCOUNT,
                    style: theme.textTheme.bodyText1?.copyWith(
                      color: AppColors.black,
                      fontSize: Sizes.TEXT_SIZE_16,
                    ),
                  ),
                  TextSpan(
                    text: StringConst.SIGN_UP,
                    style: theme.textTheme.subtitle2?.copyWith(
                      color: AppColors.deepDarkGreen,
                      fontSize: Sizes.TEXT_SIZE_16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpaceH16(),
        ],
      ),
    );
  }
}
