import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../values/values.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import '../shared/widgets/custom_text_form_field.dart';
import '../shared/widgets/spaces.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
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
                    margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_20),
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
    return Column(
      children: <Widget>[
        CustomTextFormField(
          hasTitle: true,
          title: StringConst.EMAIL_2,
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
        SpaceH16(),
        CustomTextFormField(
          hasTitle: true,
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
        SpaceH20(),
        Container(
          width: widthOfScreen * 0.6,
          child: CustomButton(
            title: StringConst.LOG_IN_4,
            color: AppColors.deepLimeGreen,
            textStyle: theme.textTheme.button?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: Sizes.TEXT_SIZE_16,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: heightOfScreen * 0.04,
        ),
        InkWell(
       //   onTap: () => ExtendedNavigator.root.push(Routes.signUpScreen6),
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
        SpaceH16(),
      ],
    );
  }
}
