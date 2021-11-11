import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:getx_final/screens/indexed/built_button.dart';
import 'package:getx_final/screens/indexed/color_page.dart';
import 'package:getx_final/screens/indexed/selected_text.dart';
import 'package:getx_final/screens/indexed/selected_view.dart';
import 'package:getx_final/screens/indexed/size_page.dart';

class IndexedPage extends StatelessWidget {
  Map<String, dynamic> selected;
  IndexedPage({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectedView(indexed: selected),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectedText(indexed: selected),
                ColorPage(),
                SizePage(),
                BuiltButton(selected: selected),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
