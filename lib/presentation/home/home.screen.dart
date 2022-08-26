import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../domain/core/models/messages.data.model.dart';
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

class MessagesCard extends StatelessWidget {
  const MessagesCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MessageDataModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xff607EAA),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'ID: ${item.id}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          5.verticalSpace,
          Text(
            'From'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          5.verticalSpace,
          Text('email: ${item.from.address}',
              style: const TextStyle(color: Color(0xffF9F5EB))),
          Text('name: ${item.from.name}',
              style: const TextStyle(color: Color(0xffF9F5EB))),
          10.verticalSpace,
          Text(
            'TO'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          5.verticalSpace,
          for (int i = 0; i < item.to.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('email: ${item.to[i].address}',
                    style: const TextStyle(color: Color(0xffF9F5EB))),
                Text('name: ${item.to[i].name}',
                    style: const TextStyle(color: Color(0xffF9F5EB))),
                5.verticalSpace,
              ],
            ),
          Text('subject: ${item.subject}',
              style: const TextStyle(color: Color(0xffF9F5EB))),
          Text('intro: ${item.intro}',
              style: const TextStyle(color: Color(0xffF9F5EB))),
        ],
      ),
    );
  }
}
