import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/screens/home/secondary/recommendations/first_pageview.dart';
import 'package:getx_final/screens/home/secondary/recommendations/second_pageview.dart';

class Recommendation extends StatelessWidget {
  PageController firstController;
  Recommendation({Key? key, required this.firstController}) : super(key: key);

  final PageController _textcontroller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          child: FirstPageView(
              firstController: firstController,
              secondController: _textcontroller),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 30.0, horizontal: context.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.055,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0)),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'What are you looking for?',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: context.width * 0.04,
          top: context.height * 0.35,
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: SecondPageView(textcontroller: _textcontroller),
          ),
        ),
      ],
    );
  }
}
