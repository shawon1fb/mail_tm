import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../domain/core/models/messages.data.model.dart';
import '../../values/values.dart';
import '../shared/buttons/animated_next_button.dart';
import '../shared/no_internet_widget/no_internet_widget.dart';
import '../shared/scroll/refress_scroll.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import 'cards/message_card.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();
  final NextButtonController buttonController = NextButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.homeAppBar,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                controller.logoutMethod();
              },
              child: Text(
                'logout'.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          20.horizontalSpace,
        ],
      ),
      backgroundColor: const Color(0xff256D85),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: Center(
          child: AnimatedNextButton(
           iconData: Icons.refresh,
            color: AppColors.lightBlueShade2,
            onTap: () async {
              buttonController.startAnimation();
              await 1.seconds.delay();
              await controller.refreshMessages();

              buttonController.stopAnimation();
              // Get.toNamed(Routes.BIRTH_DAY_SCREEN);
            },
            controller: buttonController,
          ),
        ),
      ),
      body: NoInternetWidget(
        connectionCallback: () {
          controller.refreshMessages();
        },
        child: SafeArea(
          child: GetBuilder<HomeController>(
            id: 'messages_list',
            builder: (logic) {
              return RefreshScroll(
                scrollController: scrollController,
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  controller: scrollController,
                  itemCount: logic.messages.length,
                  itemBuilder: (context, i) {
                    return MessagesCard(item: logic.messages[i]);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
