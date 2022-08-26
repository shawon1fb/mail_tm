import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../domain/core/models/messages.data.model.dart';
import '../../values/values.dart';
import '../shared/scroll/refress_scroll.dart';
import '../shared/widgets/custom_shape_clippers.dart';
import 'cards/message_card.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

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
      ),
      backgroundColor: const Color(0xff256D85),
      body: SafeArea(
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
    );
  }
}
