import 'package:flutter/material.dart';
import 'package:weeb_hub/api/model/model.dart';

class Custombar extends StatefulWidget {
  const Custombar({Key? key ,required this.title}) : super(key: key);

  final String title;

  @override
  State<Custombar> createState() => _CustombarState();
}

class _CustombarState extends State<Custombar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/logo.png",width:60,),
              SizedBox(width: 5,),
              Text(widget.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
            ],
          ),
          Container(
              child: Icon( Icons.search_outlined,color: Colors.green,size: 30,),
              margin: EdgeInsets.only(right: 10),
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
                return AnimeCard(snapshot.data![index].title.romaji.toString(),
                    NetworkImage("$url"));
              }),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ((context, index) {
                return AnimeCard(
                    "Loading", const AssetImage("assets/loadingimg.jpg"));
              }),
            );
          }
        }),
      ),
    );
  }
}

Widget AnimeCard(String title, ImageProvider image) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 150,
        width: 100,
        margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: image),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Container(
        width: 100,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}

class LandingCard extends StatelessWidget {
  LandingCard(this.image, this.name, {super.key});
  ImageProvider image;
  String name;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.33,
      width: size.width,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.33,
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover, image: image)),
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
                  ]),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Color(0x99111015),
                    Color(0xFF111015),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.28),
            width: size.width,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
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