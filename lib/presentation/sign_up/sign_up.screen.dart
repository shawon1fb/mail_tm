import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../domain/core/exceptions/unprocessable.entity.exception.dart';
import '../../infrastructure/dal/services/accounts/dto/account.dto.dart';
import '../../values/values.dart';
import '../shared/buttons/animated_button_widget.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import '../shared/widgets/custom_text_form_field.dart';
import '../shared/widgets/spaces.dart';
import 'cards/domain_name_card.dart';
import 'controllers/doman.controller.dart';
import 'controllers/sign_up.controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);
  final RxBool onCheck = false.obs;

  final TextEditingController domainNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode userNameNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

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
        SizedBox(
          height: 25,
          child: GetX<DomainController>(
            builder: (logic) {
              if (logic.domainNames.isEmpty) {
                return const Text('loading domain names . . .');
              }
              return Container(
                width: 1.sw,
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: logic.domainNames.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    var name = logic.domainNames[i];
                    return DomainNameCard(
                      name: name,
                      isSelected: logic.selectedIndex.value == i,
                      onTap: () {
                        print('Click');
                        logic.selectedIndex.value = i;
                        domainNameController.text = logic.domainNames[i];
                        userNameNode.requestFocus();
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
        20.verticalSpace,
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                focusNode: userNameNode,
                nextNode: passwordNode,
                hasTitle: true,
                title: 'Username',

                titleStyle: theme.textTheme.subtitle1?.copyWith(
                  color: AppColors.deepDarkGreen,
                  fontSize: Sizes.TEXT_SIZE_14,
                ),
                controller: userNameController,
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
                hintText: 'name',
                // validator: (v) =>
                //     (v?.isEmpty ?? true) ? 'username can not be empty' : null,
              ),
              const SpaceH16(),
              CustomTextFormField(
                hasTitle: true,
                focusNode: passwordNode,
                title: StringConst.PASSWORD,
                controller: passwordController,
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
                obscured: false,
                validator: (v) =>
                    (((v?.length ?? 0) < 6)) ? 'password too small' : null,
              ),
            ],
          ),
        ),
        const SpaceH16(),
        SizedBox(
          width: widthOfScreen * 0.6,
          child: Center(
            child: AnimatedButton(
              text: StringConst.SIGN_UP_2,
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
                if (domainNameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('please select a domain name')),
                  );
                  return;
                }

                  try {

                    if (_formKey.currentState!.validate()) {
                      print('validate alll result');
                      AccountDto dto = AccountDto(
                        address: '${userNameController.text.trim()}@${domainNameController.text.trim()}',
                        password: passwordController.text,
                      );

                      await controller.signUpMethod(dto: dto);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Signup Successful')),
                      );
                      Get.back<String>(result: dto.toString());
                    }
                  } on UbProcessAbleEntityException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.message),
                      ),
                    );
                  } catch (e, t) {
                    debugPrint(e.toString());
                    debugPrint(t.toString());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }



              },
            ),
          ),
        ),
      ],
    );
  }
}
