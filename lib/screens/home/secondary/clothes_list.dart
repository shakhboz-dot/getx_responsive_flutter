import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/constant/clothe_list.dart';
import 'package:getx_final/getx/getx.dart';
import 'package:getx_final/screens/indexed/indexed_page.dart';

class ClothesList extends StatelessWidget {
  ClothesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.018),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.all(context.width * 0.016),
            width: context.width * 0.36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 3.0,
                  offset: const Offset(0, 3.0),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.height * 0.135,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(clothes[index]['image'][0]),
                        fit: BoxFit.cover),
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(context.height * 0.01),
                      topRight: Radius.circular(context.height * 0.01),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(context.width * 0.02),
                  child: Text(
                    clothes[index]['name'],
                    style: TextStyle(
                        fontSize: context.width * 0.037,
                        color: Colors.black26,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.02),
                  child: RichText(
                    text: TextSpan(
                      text: clothes[index]['newPrice'] + '\t\t',
                      style: TextStyle(
                        fontSize: context.width * 0.039,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      children: [
                        TextSpan(
                          text: clothes[index]['oldPrice'],
                          style: TextStyle(
                            fontSize: context.width * 0.03,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () => Get.to(IndexedPage(selected: clothes[index])),
        );
      },
      itemCount: clothes.length,
    );
  }
}
