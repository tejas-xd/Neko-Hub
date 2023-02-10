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
            SizedBox(
              height: size.height * 0.25,
              width: size.width,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://64.media.tumblr.com/ef54d660ef19b41539113af32810aade/tumblr_ptr93kR27V1xkr0iao1_540.gif',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.25),
                            Colors.black.withOpacity(0.5),
                            Colors.black
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40, right: 15,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Neko-Hub",
                    style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(color: Colors.white,width: 0.75),
                              borderRadius: BorderRadius.circular(18)
                          ),
                          child: const Icon(
                            Icons.search_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              image: const DecorationImage(image: NetworkImage('https://i.pinimg.com/236x/7f/c7/ac/7fc7ac4a0a065ab32e8554396111898d.jpg')),
                              border: Border.all(color: Colors.white,width: 0.75),
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20)

                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
  const CustomListAnime(this.future, {super.key});
  final Future<List<Results>> future;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(url)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        snapshot.data![index].title.romaji.toString(),
                        style: const TextStyle(color: Colors.white),
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
                        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/loadingimg.jpg"),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
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
            style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 5),
          ),
        ],
      ));
}
