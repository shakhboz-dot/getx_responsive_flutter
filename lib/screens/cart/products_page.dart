import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/constant/clothe_list.dart';
import 'package:getx_final/getx/getx.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.75,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: context.height * 0.01,
          left: context.width * 0.035,
          right: context.width * 0.035,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: context.height * 0.015),
            height: context.height * 0.14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                image(context, index),
                Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: context.width * 0.045,
                        top: context.height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        productName(context, index),
                        prices(context, index),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget image(BuildContext context, int index) => Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.width * 0.01),
            image: DecorationImage(
                image: AssetImage(clothes[index]['image'][0]),
                fit: BoxFit.cover),
          ),
        ),
      );

  Widget productName(BuildContext context, int index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: context.width * 0.02),
            child: Text(
              clothes[index]['name'],
              style: TextStyle(
                  fontSize: context.width * 0.04, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            'Black - L',
            style: TextStyle(
              fontSize: context.width * 0.03,
              color: Colors.grey,
            ),
          ),
        ],
      );

  Widget prices(BuildContext context, int index) {

    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            clothes[index]['newPrice'],
            style: TextStyle(
              fontSize: context.width * 0.04,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    clothes[index]['count'] -= 1;
                  });
                },
                child: Icon(
                  Icons.remove,
                  size: context.width * 0.035,
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.04),
                  child: Container(
                    alignment: Alignment.center,
                    width: context.width * 0.045,
                    height: context.height * 0.02,
                    color: Colors.black12.withOpacity(0.05),
                    child: Text(clothes[index]['count'].toString()),
                  )),
              InkWell(
                onTap: () {
                  setState(() {
                    clothes[index]['count'] += 1;
                  });
                },
                child: Icon(
                  Icons.add,
                  size: context.width * 0.035,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
