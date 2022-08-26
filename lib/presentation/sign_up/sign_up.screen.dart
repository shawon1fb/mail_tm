import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../values/values.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import '../shared/widgets/custom_text_form_field.dart';
import '../shared/widgets/spaces.dart';
import 'controllers/sign_up.controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);
  final RxBool onCheck = false.obs;

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
        child: Stack(
          children: <Widget>[
            Positioned(
              child: ClipPath(
                clipper: WaveShapeClipper(),
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
                  height: heightOfScreen * 0.5 * 0.6,
                ),
                Container(
                  margin: EdgeInsets.only(left: widthOfScreen * 0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        StringConst.SIGN,
                        style: theme.textTheme.headline3?.copyWith(
                          color: AppColors.deepBrown,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Sig',
                              style: theme.textTheme.headline3?.copyWith(
                                color: Colors.transparent,
                                height: 0.7,
                              ),
                            ),
                            TextSpan(
                              text: StringConst.UP,
                              style: theme.textTheme.headline3?.copyWith(
                                color: AppColors.deepBrown,
                                height: 0.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
    );
  }

  Widget _buildForm(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var widthOfScreen = MediaQuery.of(context).size.width;
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
        const SpaceH16(),
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
        const SpaceH16(),
        CustomTextFormField(
          hasTitle: true,
          title: StringConst.CONFIRM_PASSWORD,
          titleStyle: theme.textTheme.subtitle1?.copyWith(
            color: AppColors.deepDarkGreen,
            fontSize: Sizes.TEXT_SIZE_14,
          ),
          textInputType: TextInputType.text,
          hintTextStyle: Styles.customTextStyle(color: AppColors.greyShade7),
          enabledBorder: Borders.customUnderlineInputBorder(
            color: AppColors.lighterBlue2,
          ),
          focusedBorder: Borders.customUnderlineInputBorder(
            color: AppColors.lightGreenShade1,
          ),
          textStyle: Styles.customTextStyle(color: AppColors.blackShade10),
          hintText: StringConst.PASSWORD_HINT_TEXT,
          obscured: true,
        ),
        Row(
          children: <Widget>[
            Obx(() {
              return Checkbox(
                value: onCheck.value,
                activeColor: AppColors.deepLimeGreen,
                onChanged: (value) {
                  onCheck.value = !onCheck.value;
                },
              );
            }),
            const Text(StringConst.ACCEPT_CONDITIONS)
          ],
        ),
        SizedBox(
          width: widthOfScreen * 0.6,
          child: CustomButton(
            title: StringConst.SIGN_UP_2,
            color: AppColors.deepLimeGreen,
            textStyle: theme.textTheme.button?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: Sizes.TEXT_SIZE_16,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
