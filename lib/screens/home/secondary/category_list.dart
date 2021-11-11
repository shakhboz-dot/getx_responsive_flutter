import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/constant/categories_list.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          2,
          (index) => Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.04,
                vertical: context.height * 0.006),
            height: context.height * 0.065,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.height * 0.01)),
            child: ListTile(
              leading: Image.asset(
                category[index]['image'],
                height: context.height * 0.04,
              ),
              title: Text(category[index]['gender'],
                  style: TextStyle(fontSize: context.width * 0.037)),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: context.width * 0.04,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
