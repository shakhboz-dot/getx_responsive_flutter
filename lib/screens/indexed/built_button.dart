import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/constant/clothe_list.dart';
import 'package:getx_final/screens/cart/cart_page.dart';

class BuiltButton extends StatelessWidget {
  Map<String, dynamic> selected;
  BuiltButton({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.03),
      child: ElevatedButton(
        onPressed: () {
          added.add(selected);
          Get.to(CartPage());
        },
        style: ElevatedButton.styleFrom(
            elevation: 8.0,
            shadowColor: Colors.blue,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.width * 0.018))),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.width * 0.018),
            gradient: LinearGradient(
              colors: [Colors.blue.shade300, Colors.blue.shade800],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            width: context.width,
            height: context.height * 0.05,
            child: Text(
              'Add to cart',
              style: TextStyle(
                fontSize: context.width * 0.038,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
