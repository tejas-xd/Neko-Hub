import 'package:flutter/material.dart';
import 'package:weeb_hub/api/api_requests.dart';
import 'package:weeb_hub/api/model/model.dart';
import 'package:weeb_hub/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          'https://pa1.narvii.com/5672/a9cec839170732f7e72e26b983e25325d9dfacb8_hq.gif',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Color(0x99111015),
                            Color(0xFF111015),
                            Colors.black
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              child: Container(
                padding: const EdgeInsets.only(top: 40, right: 15),
                alignment: Alignment.topRight,
                child: const Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            )
          ]),
          SectionText("TRENDING", "ANIME"),
          CustomListAnime(APIService().getTrendingAnime()),
          SectionText("POPULAR", "ANIME"),
          CustomListAnime(APIService().getPopularAnime()),
          SectionText("RECENT", "ANIME"),
          CustomListAnime(APIService().getRecentAnime()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}

class CustomListAnime extends StatelessWidget {
  CustomListAnime(this.future, {super.key});
  Future<List<Results>> future;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: FutureBuilder(
        future: future,
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) {
                var url = snapshot.data![index].image.toString();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(id: snapshot.data[index].id)));
                      },
                      child: Container(
                        height: 150,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage('$url')),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        snapshot.data![index].title.romaji.toString(),
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                );
              }),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ((context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 150,
                        width: 100,
                        margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/loadingimg.jpg"),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        "Loading",
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                );
              }),
            );
          }
        }),
      ),
    );
  }
}

Widget SectionText(String ktitle, String ntitle) {
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              ktitle.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 5),
            ),
          ),
          Text(
            ntitle.toUpperCase(),
            style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 5),
          ),
        ],
      ));
}
