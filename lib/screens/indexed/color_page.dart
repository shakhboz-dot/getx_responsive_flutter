import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_final/constant/color_list.dart';

class ColorPage extends StatelessWidget {
  ColorPage({Key? key}) : super(key: key);

  Rx<int> choose = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: context.height * 0.034, bottom: context.height * 0.017),
          child: Text(
            'Colour',
            style: TextStyle(
              fontSize: context.width * 0.04,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Row(
          children: [
            ...List.generate(
              colors.length,
              (index) => GestureDetector(
                  onTap: () {
                    choose.value = index;
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(context.height * 0.003),
                      height: context.height * 0.035,
                      width: context.width * 0.07,
                      margin: EdgeInsets.only(right: context.width * 0.055),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: choose.value == index
                                ? Colors.blue
                                : Colors.transparent),
                        borderRadius:
                            BorderRadius.circular(context.height * 0.03),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius:
                              BorderRadius.circular(context.height * 0.02),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
