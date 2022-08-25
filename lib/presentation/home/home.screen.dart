import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../values/values.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
   HomeScreen({Key? key}) : super(key: key);
  bool onCheck = false;



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
                  margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_20),
                //  child: _buildForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
