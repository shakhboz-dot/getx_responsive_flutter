import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SelectedText extends StatelessWidget {
  Map<String, dynamic> indexed;
  SelectedText({Key? key, required this.indexed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.width * 0.03,
          ),
          child: Text(
            indexed['name'],
            style: TextStyle(
                fontSize: context.width * 0.087,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
        Row(
          children: [
            Text(
              '\$' + indexed['newPrice'].toString() + '\t\t',
              style: TextStyle(
                fontSize: context.width * 0.055,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '\$' + indexed['oldPrice'].toString(),
              style: TextStyle(
                fontSize: context.width * 0.035,
                decoration: TextDecoration.lineThrough,
                color: Colors.black26,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
