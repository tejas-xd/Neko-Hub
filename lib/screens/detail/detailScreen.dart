import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:weeb_hub/api/api_requests.dart';
import 'package:weeb_hub/api/model/infomodel.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<AnimeInfo> info;

  void showBookmarkDialogbox(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 300,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey),
                color: Colors.black87),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('movies')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      'movies': FieldValue.arrayUnion([
                        {"moviename": ''}
                      ])
                    }).then((value) => {Navigator.pop(context)});
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey)),
                    child: const Center(
                      child: Text(
                        "WATCHED",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 4),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey)),
                  child: const Center(
                    child: Text(
                      "WATCHING",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey)),
                  child: const Center(
                    child: Text(
                      "PLAN TO WATCH",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey)),
                  child: const Center(
                    child: Text(
                      "ON HOLD",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: FutureBuilder(
        future: APIService().getinfo(widget.id),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            String html = snapshot.data.description;
            RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
            String overview = html.replaceAll(exp, '');
            return ListView(
              padding: const EdgeInsets.only(bottom: 20),
              children: [
                SizedBox(
                  height: size.height * 0.65,
                  width: size.width,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.5,
                        width: size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              snapshot.data.image,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.5,
                        width: size.width,
                        decoration:  BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.3),
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.9),
                                Colors.black
                              ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.35),
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "${snapshot.data.title.romaji}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                              width: size.width,
                              height: 30,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: snapshot.data.genres.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.4),
                                          border: Border.all(
                                              color: Colors.grey,
                                              width: 0.75),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "  ${snapshot.data.genres[index]}  ",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ));
                                }),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rate_rounded,
                                          size: 24,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          " ${snapshot.data.rating / 10}  > ",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.greenAccent,
                                              width: 0.75),
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      child: Text(
                                        "  ${snapshot.data.type}  ",
                                        style: const TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.greenAccent,
                                              width: 0.75),
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      child: Text(
                                        "  ${snapshot.data.releaseDate}  ",
                                        style: const TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            // Container(
                            //   margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       GestureDetector(
                            //         onTap: (){
                            //           showBookmarkDialogbox(context);
                            //         },
                            //         child: Container(
                            //             decoration: BoxDecoration(
                            //                 color: Colors.grey.withOpacity(0.3),
                            //                 border: Border.all(
                            //                     color: Colors.grey,
                            //                     width: 0.75),
                            //                 borderRadius:
                            //                 BorderRadius.circular(10)),
                            //             child: const Text(
                            //               "  Add to List  +  ",
                            //               style: TextStyle(
                            //                 color: Colors.white,
                            //                 fontSize: 20,
                            //                 fontWeight: FontWeight.w300,
                            //                 letterSpacing: 2
                            //               ),
                            //             )),
                            //       ),
                            //       Container(
                            //         height: 30,
                            //         width: 30,
                            //         margin: const EdgeInsets.only(left: 15),
                            //         decoration: BoxDecoration(
                            //           color: Colors.black87,
                            //           border: Border.all(
                            //               color: Colors.white, width: 0.5),
                            //           borderRadius: BorderRadius.circular(15),
                            //         ),
                            //         alignment: Alignment.center,
                            //         child: const Icon(Icons.bookmark_add_outlined,size: 20,),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "  Summary",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 2),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.grey),
                          color: Colors.grey.withOpacity(0.3)),
                        child: ReadMoreText(
                          overview,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              letterSpacing: 2),
                          trimLines: 5,
                          colorClickableText: Colors.lightBlue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Show less',
                        )
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    "Episodes",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                    height: 140,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.episodes.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 100,
                            width: 170,
                            margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      snapshot.data.episodes[index].image)),
                              borderRadius: BorderRadius.circular(10),
                              //border: Border.all(color: Colors.white,width: 0.5)
                            ),
                            child: Stack(
                              children: [
                                const Center(
                                  child: Icon(
                                    Icons.play_circle_outline_rounded,
                                    size: 50,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black,
                                          blurRadius: 5)
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(

                                    height: 30,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: Text(
                                      "  Episode-${snapshot.data.episodes[index].number}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 3)
                                          ],
                                      letterSpacing: 2),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(top: 15, bottom: 5),
                  child: const Text(
                    "Related",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.relations.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 200,
                          width: 120,
                          margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(snapshot
                                    .data.relations[index].image)),
                            borderRadius: BorderRadius.circular(10),
                              //border: Border.all(color: Colors.white,width: 0.5)
                          ),
                          child: Container(
                            height: 40,
                            width: 120,
                            padding: const EdgeInsets.only(bottom: 2,left: 2),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                              border:Border.all(color: Colors.transparent,width: 0.5),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${snapshot.data.relations[index].relationType}',
                                  style: const TextStyle(
                                      color: Colors.tealAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      letterSpacing: 1),
                                ),
                                Text(
                                  '${snapshot.data.relations[index].title.romaji}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      letterSpacing: 1),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      id: snapshot
                                          .data.relations[index].id
                                          .toString())));
                        },
                      );
                    }),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(top: 15, bottom: 5),
                  child: const Text(
                    "More Like This",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.recommendations.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        child: Container(
                          height: 200,
                          width: 120,
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(snapshot.data
                                    .recommendations[index].image)),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Container(
                            height: 40,
                            width: 120,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration:  BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                              border: Border.all(color: Colors.transparent,width: 0.5)
                            ),
                            child: Text(
                              '${snapshot.data.recommendations[index].title.romaji}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  letterSpacing: 1),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      id: snapshot.data
                                          .recommendations[index].id
                                          .toString())));
                        },
                      );
                    }),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.dotsTriangle(
                  color: Colors.greenAccent, size: 50),
            );
          }
        }),
      ),
    );
  }
}

// Row(
// children: [
// Container(
// width: size.width*0.45,
// margin: EdgeInsets.only(top:10),
// padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
// decoration: BoxDecoration(
// color: Colors.green,
// borderRadius: BorderRadius.circular(20),
// border: Border.all(color: Colors.green)
// ),
// child: Row(
// children: [
// Icon(Icons.play_circle,color: Colors.white,size: 18,),
// Text("PLAY",style: TextStyle(
// color: Colors.white,
// fontSize: 18,
// fontWeight: FontWeight.w400,
// letterSpacing: 2),)
// ],
// mainAxisAlignment: MainAxisAlignment.center,
//
// ),
// ),
// Container(
// width: size.width*0.48,
// margin: EdgeInsets.only(top:10),
// padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// border: Border.all(color: Colors.green)
// ),
// child: Row(
// children: [
// Icon(Icons.add_box_outlined,color: Colors.green,size: 18,),
// Text("ADD TO LIST",style: TextStyle(
// color: Colors.green,
// fontSize: 18,
// fontWeight: FontWeight.w400,
// letterSpacing: 2),)
// ],
// ),
// ),
// ],
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// ),
