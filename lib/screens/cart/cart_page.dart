import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/constant/clothe_list.dart';
import 'package:getx_final/screens/cart/products_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
      ),
      body: Container(
        height: context.height,
        color: Colors.black12,
        child: Column(
          children: [
            ProductsPage(),
          ],
        ),
      ),
    );
  }
}
