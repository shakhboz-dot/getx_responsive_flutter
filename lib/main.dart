import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_final/examine.dart';
import 'package:getx_final/screens/cart/cart_page.dart';
import 'package:getx_final/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}
