import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_final/constant/categories_list.dart';
import 'package:getx_final/constant/clothe_list.dart';
import 'package:getx_final/screens/built/build_row.dart';
import 'package:getx_final/screens/secondary/category_list.dart';
import 'package:getx_final/screens/secondary/clothes_list.dart';
import 'package:getx_final/screens/secondary/recommendations.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Recommendation(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.all(5.0),
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.02,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
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
