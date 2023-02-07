import 'dart:ui';

import 'package:weeb_hub/api/api_requests.dart';
import 'package:weeb_hub/api/model/model.dart';
import 'package:weeb_hub/screens/detail/DetailScreen.dart';
import 'package:weeb_hub/screens/custom.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final myController = TextEditingController();
  String query = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        extendBody: true,
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            // Image(
            //   image: NetworkImage(
            //     'https://i.pinimg.com/originals/90/ff/6f/90ff6fe1fa93ee8abb993fbcdf80b7a8.gif',
            //   ),
            //   fit: BoxFit.fitWidth,
            //   width: size.width,
            // ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(8, 28, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green.withOpacity(0.5),
                    ),
                    child: TextField(
                      controller: myController,
                      cursorColor: Colors.green,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          suffixIcon: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                          suffixIconColor: Colors.white,
                          prefixIconColor: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          query = myController.text;
                        });
                      },
                    ),
                  ),
                  SearchList(APIService().getSearchAnime(query))
                ],
              ),
            ),
          ],
        ));
  }
}

class SearchList extends StatefulWidget {
  SearchList(this.future, {super.key});

  Future<List<Results>> future;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      width: size.width,
      child: FutureBuilder(
        future: widget.future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: GridView.builder(
                gridDelegate:
                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: size.height * 0.23),
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(id: snapshot.data[index].id)));
                      },
                    child: AnimeCard(
                        snapshot.data![index].title!.romaji.toString(),
                        NetworkImage(snapshot.data![index].image.toString()),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("Not found"));
          }
        },
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  SearchCard(this.title, this.image, this.popularRating, this.mediatype,
      {super.key});
  String title;
  ImageProvider image;
  String popularRating;
  String mediatype;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 100,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: image),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                  width: size.width - 150,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    width: size.width - 150,
                    child: Row(
                      children: [
                        const Text(
                          'Media Type: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          mediatype.toString().toUpperCase(),
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    width: size.width - 150,
                    child: Row(
                      children: [
                        Text(
                          'Rating: ',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          popularRating.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}
