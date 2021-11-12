
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FakeDB {
  List<int> viewedPages = [0];

  void insertViewedPage(int page) {
    viewedPages.add(page);
  }
}

/// BottomNavigationBar page converted to GetX. Original StatefulWidget version:
/// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
class TabX extends GetxController {

  TabX({required this.db});

  final FakeDB db;
  int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget>? tabPages;

  @override
  void onInit() {
    super.onInit();
    tabPages = <Widget>[
      ListViewTab(db),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];
  }

  /// INTERESTING PART HERE ↓ ************************************
  void onItemTapped(int index) {
    selectedIndex = index;
    db.insertViewedPage(index); // simulate database update while tabs change
    update(); // ← rebuilds any GetBuilder<TabX> widget
    // ↑ update() is like setState() to anything inside a GetBuilder using *this*
    // controller, i.e. GetBuilder<TabX>
    // Other GetX controllers are not affected. e.g. GetBuilder<BlahX>, not affected
    // by this update()
    // Use async/await above if data writes are slow & must complete before updating widget. 
    // This example does not.
  }
}

/// REBUILT when Tab Page changes, rebuilt by GetBuilder in MyTabHomePage
class ListViewTab extends StatelessWidget {
  final FakeDB db;

  ListViewTab(this.db);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: db.viewedPages.length,
      itemBuilder: (context, index) =>
          ListTile(
            title: Text('Page Viewed: ${db.viewedPages[index]}'),
          ),
    );
  }
}


class MyTabHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(TabX(db: FakeDB()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        /// ↓ Tab Page currently visible - rebuilt by GetBuilder when 
        /// ↓ TabX.onItemTapped() called
        child: GetBuilder<TabX>(
            builder: (tx) => tx.tabPages!.elementAt(tx.selectedIndex)
        ),
      ),
      /// ↓ BottomNavBar's highlighted/active item, rebuilt by GetBuilder when
      /// ↓ TabX.onItemTapped() called
      bottomNavigationBar: GetBuilder<TabX>(
        builder: (tx) => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: tx.selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (inde) => tx.onItemTapped(inde),
        ),
      ),
    );
  }
}
