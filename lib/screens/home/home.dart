import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_final/getx/getx.dart';
import 'package:getx_final/screens/built/build_row.dart';
import 'package:getx_final/screens/home/secondary/category_list.dart';
import 'package:getx_final/screens/home/secondary/clothes_list.dart';
import 'package:getx_final/screens/home/secondary/recommendations/recommendations.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final PageController _controller = PageController(initialPage: 0);

  final DotChange _change = Get.put(DotChange());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Recommendation(firstController: _controller),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  3,
                  (index) => Obx(
                    () => Container(
                      margin: const EdgeInsets.all(5.0),
                      height: _change.dot.value == index
                          ? context.height * 0.025
                          : context.height * 0.016,
                      width: _change.dot.value == index
                          ? context.width * 0.025
                          : context.width * 0.016,
                      decoration: BoxDecoration(
                        color: _change.dot.value == index
                            ? Colors.blue[300]
                            : Colors.black26,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
              ],
            ),
            BuildRow(
                title: 'Trending',
                leading: 'Show all',
                horizontal: 0.04,
                vertical: 0.015),
            SizedBox(
              height: context.height * 0.22,
              child: const ClothesList(),
            ),
            BuildRow(
                title: 'Categories',
                leading: 'Show all',
                horizontal: 0.04,
                vertical: 0.03),
            const CategoryList()
          ],
        ),
      ),
    );
  }
}
