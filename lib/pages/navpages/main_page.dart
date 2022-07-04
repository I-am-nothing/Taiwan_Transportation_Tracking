import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/bar_item_page.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/home_page.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/my_page.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    HomePage(),
    SearchPage(),
    BarItemPage(),
    MyPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          height: 65,
          margin: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              onTap: onTap,
              currentIndex: currentIndex,
              selectedItemColor: Colors.white70,
              unselectedItemColor: Colors.white30,
              showUnselectedLabels: false,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.apps_rounded),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: Icon(Icons.search_rounded),
                ),
                BottomNavigationBarItem(
                  label: "Map",
                  icon: Icon(Icons.map_rounded),
                ),
                BottomNavigationBarItem(
                  label: "My",
                  icon: Icon(Icons.person_rounded),
                )
              ],
            ),
          ),
        ));
  }
}


// BottomNavigationBar(
//         type: BottomNavigationBarType.shifting,
//         backgroundColor: Colors.white,
//         onTap: onTap,
//         currentIndex: currentIndex,
//         selectedItemColor: Colors.black54,
//         unselectedItemColor: Colors.grey.withOpacity(0.5),
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//         elevation: 0,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             label: "Home",
//             icon: Icon(Icons.apps),
//           ),
//           BottomNavigationBarItem(
//             label: "Bar",
//             icon: Icon(Icons.bar_chart),
//           ),
//           BottomNavigationBarItem(
//             label: "Search",
//             icon: Icon(Icons.search),
//           ),
//           BottomNavigationBarItem(label: "My", icon: Icon(Icons.person))
//         ],
//       ),