import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weeb_hub/screens/screens.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
                tileMode: TileMode.mirror
            ),
            child: Opacity(
              opacity: 0.8,
              child: BottomNavigationBar(
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
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
                items:  [
                  BottomNavigationBarItem(
                    icon: Icon((currentIndex == 0)?Icons.home:Icons.home_outlined),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon((currentIndex == 1)?Icons.calendar_month:Icons.calendar_month_outlined),
                    label: "Releases",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon((currentIndex == 2)?Icons.bookmark:Icons.bookmark_outline),
                    label: "My list",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon((currentIndex == 3)?Icons.file_download:Icons.file_download_outlined),
                    label: "Download",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon((currentIndex == 4)?Icons.account_circle:Icons.account_circle_outlined),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          )),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          const HomeScreen(),
          CalenderScreen(),
          const ListScreen(),
          const DownloadScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
