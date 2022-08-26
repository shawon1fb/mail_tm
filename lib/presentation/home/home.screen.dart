import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../values/values.dart';
import '../shared/scroll/refress_scroll.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
   HomeScreen({Key? key}) : super(key: key);

  // bool onCheck = false;

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.homeAppBar,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xff256D85),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          id: 'messages_list',
          builder: (logic) {
            return RefreshScroll(
              scrollController: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: logic.messages.length,
                itemBuilder: (context, i) {
                  return Text('$i');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
