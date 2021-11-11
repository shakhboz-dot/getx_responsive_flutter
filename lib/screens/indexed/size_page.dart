import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/constant/size_list.dart';

class SizePage extends StatelessWidget {
  RxInt choosen = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: context.height * 0.034, bottom: context.height * 0.017),
          child: Text(
            'Size',
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
              sizes.length,
              (index) => GestureDetector(
                  onTap: () {
                    choosen.value = index;
                  },
                  child: Obx(
                    () => Container(
                      alignment: Alignment.center,
                      height: context.height * 0.045,
                      width: context.width * 0.188,
                      decoration: BoxDecoration(
                        color: choosen.value == index
                            ? Colors.blue
                            : Colors.transparent,
                        gradient: LinearGradient(
                            colors: [Colors.blue.shade300, Colors.blue.shade800],
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                          ),
                        borderRadius:
                            BorderRadius.circular(context.width * 0.01),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: context.width,
                        height: context.height * 0.035,
                        child: Text(
                          sizes[index],
                          style: TextStyle(
                            color: choosen.value == index
                                ? Colors.white
                                : Colors.black26,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: choosen.value == index
                              ? Colors.blue
                              : Colors.black12.withOpacity(0.05),
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade300, Colors.blue.shade800],
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                          ),
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
