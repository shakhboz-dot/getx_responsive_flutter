import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class BuildRow extends StatelessWidget {
  String? title;
  String? leading;
  double horizontal;
  double vertical;
  BuildRow({
    Key? key,
    this.title,
    this.leading,
    required this.horizontal,
    required this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * horizontal,
          vertical: context.width * vertical),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              leading!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
