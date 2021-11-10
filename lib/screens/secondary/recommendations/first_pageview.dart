import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/getx/getx.dart';

class FirstPageView extends StatelessWidget {
  PageController secondController;
  PageController firstController;
  FirstPageView(
      {Key? key, required this.secondController, required this.firstController})
      : super(key: key);

  final DotChange _change = Get.put(DotChange());

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      controller: firstController,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          ),
          child: Image.asset(
            'assets/images/home.jpg',
            width: context.width,
            fit: BoxFit.cover,
          ),
        );
      },
      onPageChanged: (value) {
        getPage(value);
        _change.dot.value = value;
      },
    );
  }

  getPage(int page) {
    firstController.animateToPage(page,
        duration: const Duration(milliseconds: 1000), curve: Curves.decelerate);
    secondController.animateToPage(page,
        duration: const Duration(milliseconds: 1000), curve: Curves.decelerate);
  }
}
