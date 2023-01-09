import 'package:flutter/material.dart';
import 'package:weeb_hub/api/api_requests.dart';
import 'package:weeb_hub/screens/shared/custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomCarouselSlider(APIService().getTrendingAnime()),
              SectionText("TRENDING", "ANIME"),
              CustomListAnime(APIService().getTrendingAnime()),
              SectionText("POPULAR", "ANIME"),
              CustomListAnime(APIService().getPopularAnime()),
              SectionText("RECENT", "ANIME"),
              CustomListAnime(APIService().getRecentAnime()),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,)
            ],
          ),
    );
  }
}
