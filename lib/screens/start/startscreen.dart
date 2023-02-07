import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weeb_hub/screens/screens.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  PageController _pageController = PageController(initialPage: 0);
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
      bottomNavigationBar: Align(
          alignment: FractionalOffset.bottomCenter,
          //this is very important, without it the whole screen will be blurred
          child: ClipRect(
              //I'm using BackdropFilter for the blurring effect
              child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Opacity(
                    //you can change the opacity to whatever suits you best
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
                          icon: Icon(Icons.file_download_outlined),
                          label: "Download",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle_outlined),
                          label: "Profile",
                        ),
                      ],
                    ),
                  )))),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
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
