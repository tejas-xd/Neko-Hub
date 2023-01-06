import 'package:flutter/material.dart';
import 'package:weeb_hub/screens/screens.dart';


class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final PageController _pageController = PageController(initialPage: 0,);
  int currentIndex = 0;


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[500],
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );

          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Releases",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "My list",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_sharp),
            label: "Download",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",

          ),

        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget> [
          HomeScreen(),
          CalenderScreen(),
          ListScreen(),
          DownloadScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}


