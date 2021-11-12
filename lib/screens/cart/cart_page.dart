import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/screens/cart/products_page.dart';
import 'package:getx_final/screens/cart/total_price_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builtAppBar(context),
      body: Container(
        height: context.height,
        color: Colors.black12.withOpacity(0.02),
        child: Column(
          children: [
            ProductsPage(),
            const TotalPricePage(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget builtAppBar(BuildContext context) => AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            size: context.width * 0.06,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My cart',
          style: TextStyle(
              fontSize: context.width * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      );
}
