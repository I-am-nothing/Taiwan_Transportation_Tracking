import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/bar_item_page.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/overview_page.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/my_page.dart';
import 'package:taiwan_transportation_tracking/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = const [
    OverviewPage(),
    SearchPage(),
    BarItemPage(),
    MyPage(),
  ];

  int currentIndex = 0;
  String currentLocation = '台中市烏日區溪南路一段460巷486號';

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClickableAppBar(
        onTap: () {},
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 24,
          title: RichText(
            text: TextSpan(
              text: "你的位置：\n",
              style: const TextStyle(fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: currentLocation,
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            margin: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.05),
                  Colors.white.withOpacity(0.05)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(Icons.location_pin),
              //iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
      ),
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
      ),
    );
  }
}

class ClickableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final AppBar appBar;

  const ClickableAppBar({Key? key, required this.onTap, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: appBar);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
