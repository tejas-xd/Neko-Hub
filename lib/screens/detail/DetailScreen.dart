import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:weeb_hub/api/api_requests.dart';
import 'package:weeb_hub/api/model/infomodel.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<AnimeInfo> info;
  @override
  void initState() {
    super.initState();
    info = APIService().getinfo(widget.id);
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: Colors.black,
          textTheme: TextTheme(
            bodyText2: GoogleFonts.poppins(),
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          extendBody: true,
          body: FutureBuilder(
              future: APIService().getinfo(widget.id),
              builder: ((context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: size.height * 0.45,
                        width: size.width,
                        child: Stack(
                          children: [
                            Container(
                              width: size.width,
                              height: size.height * 0.45,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(
                                    snapshot.data.image,
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
                                      Color(0x99111015),
                                      Color(0xFF111015),
                                      Colors.black
                                    ]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.05),
                              padding: const EdgeInsets.only(left: 5),
                              width: size.width,
                              alignment: const Alignment(-1, -1),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.green,
                                shadows: [
                                  Shadow(blurRadius: 3,color: Colors.black)
                                ],
                                size: 30,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height * 0.40),
                              width: size.width * 0.90,
                              child: Text(
                                " " + snapshot.data.title.romaji,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.green,
                          ),
                          Text(
                            " " + snapshot.data.rating.toString() + " ",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            size: 16,
                            color: Colors.green,
                          ),
                          Text(
                            " " + snapshot.data.releaseDate.toString() + " ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.bookmarks_outlined,
                            size: 18,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width*0.45,
                            margin: EdgeInsets.only(top:10),
                            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.play_circle,color: Colors.white,size: 18,),
                                Text("PLAY",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2),)
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,

                            ),
                          ),
                          Container(
                            width: size.width*0.48,
                            margin: EdgeInsets.only(top:10),
                            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.add_box_outlined,color: Colors.green,size: 18,),
                                Text("ADD TO LIST",style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2),)
                              ],
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReadMoreText(
                        snapshot.data.description,
                        trimLines: 4,
                        colorClickableText: Colors.lightBlue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Show less',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " Episodes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                          height: 150,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.episodes.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  height: 100,
                                  width: 200,
                                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(snapshot
                                            .data.episodes[index].image)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Icon(
                                          Icons.play_circle_outlined,
                                          size: 50,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 3)
                                          ],
                                        ),
                                      ),
                                      Align(
                                        child: Text(
                                          "  Episode-" +
                                              snapshot
                                                  .data.episodes[index].number
                                                  .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black,
                                                    blurRadius: 3)
                                              ]),
                                          textAlign: TextAlign.start,
                                        ),
                                        alignment: Alignment.bottomLeft,
                                      )
                                    ],
                                  ),
                                );
                              }))),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        " More Like This",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.recommendations.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 150,
                                  width: 100,
                                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(snapshot.data
                                            .recommendations[index].image)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: Text(
                                    snapshot.data.recommendations[index].title
                                        .romaji,
                                    style: TextStyle(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              }))),
    );
  }
}
