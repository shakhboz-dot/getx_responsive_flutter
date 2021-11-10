import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_final/getx/getx.dart';

class SelectedView extends StatelessWidget {
  Map<String, dynamic> indexed;
  SelectedView({Key? key, required this.indexed}) : super(key: key);

  final DotChange _change = Get.put(DotChange());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(context.width * 0.05),
              bottomRight: Radius.circular(context.width * 0.05),
            ),
          ),
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.width * 0.1),
                  bottomRight: Radius.circular(context.width * 0.1),
                ),
                child: Image.asset(
                  indexed['image'][index],
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              );
            },
            onPageChanged: (value) {
              _change.indexedDot.value = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.width * 0.06, horizontal: context.width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: context.width * 0.065,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: context.width * 0.065,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: context.height * 0.56,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                3,
                (index) => Obx(
                  () => Container(
                    margin: const EdgeInsets.all(5.0),
                    height: _change.indexedDot.value == index
                        ? context.height * 0.025
                        : context.height * 0.016,
                    width: _change.indexedDot.value == index
                        ? context.width * 0.025
                        : context.width * 0.016,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
