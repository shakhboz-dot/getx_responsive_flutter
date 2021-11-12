import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class TotalPricePage extends StatelessWidget {
  const TotalPricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.008),
      child: Container(
        height: context.height * 0.16,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: context.width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  Text(
                    '\$127.60',
                    style: TextStyle(
                        fontSize: context.width * 0.05,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 8.0,
                  shadowColor: Colors.blue,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(context.width * 0.018))),
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
                    'Check out',
                    style: TextStyle(
                      fontSize: context.width * 0.038,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
