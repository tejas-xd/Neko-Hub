import 'package:flutter/material.dart';
import 'package:weeb_hub/api/api_requests.dart';
import 'package:weeb_hub/api/model/schedulemodel.dart';
import 'package:week_of_year/date_week_extensions.dart';

class CalenderScreen extends StatefulWidget {
   CalenderScreen({Key? key}) : super(key: key);

  int select = DateTime.now().day;
  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    late List<int> days = [];
    late List<int> dates = [];
    List<String> sday = ["", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday;
    int weekNumber = now.weekOfYear;
    int currentYear = DateTime.now().year;
    DateTime firstDayOfWeek = now.subtract(Duration(days: currentWeekday - 1));
    days.add(firstDayOfWeek.weekday);
    dates.add(firstDayOfWeek.day);
    for (int i = 1; i < 7; i++) {
      int day = firstDayOfWeek.add(Duration(days: i)).weekday;
      int date = firstDayOfWeek.add(Duration(days: i)).day;
      days.add(day);
      dates.add(date);
    }
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            height: size.height * 0.1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return (widget.select != dates[index])
                      ? InkWell(
                    onTap: ()
                    {
                      setState(() {
                        widget.select = dates[index];
                      });
                    },
                          child: ScheduleTab(
                            sday[days[index]],
                            dates[index].toString(),
                          ),
                        )
                      : SScheduleTab(
                          sday[days[index]],
                          dates[index].toString(),
                        );
                }),
          ),
          Container(
            height: size.height * 0.85,
            padding: EdgeInsets.only(top: 20),
            child: FutureBuilder(
              future: APIService()
                  .getschedule(currentYear.toString(), weekNumber.toString()),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<SResults>? snapshotdata = snapshot.data;
                  List<SResults>? sorted = [];
                  for (int i = 0; i < snapshotdata!.length; i++) {
                    String a = snapshotdata[i].episodeDate!.substring(8, 10);
                    if (widget.select < 10) {
                      String b = "0" + widget.select.toString();
                      if (b == a) {
                        sorted.add(snapshotdata[i]);
                      }
                    } else {
                      if (widget.select.toString() == a) {
                        sorted.add(snapshotdata[i]);
                      }
                    }
                  }
                  return Container(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 50),
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: sorted!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var url = sorted![index].imageVersionRoute;
                        var time =
                            sorted![index].episodeDate!.substring(11, 19);
                        return ScheduleCard(
                            sorted![index].title.toString(),
                            url == null
                                ? const AssetImage("assets/loadingimg.jpg")
                                : NetworkImage(
                                        "https://cdn.animeschedule.net/production/assets/public/img/$url")
                                    as ImageProvider,
                            time,
                            sorted![index].episodeNumber.toString());
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget ScheduleTab(String day, String date) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            date.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
          ),
        ],
      ));
}

Widget SScheduleTab(String day, String date) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            date.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
          ),
        ],
      ));
}

class ScheduleCard extends StatelessWidget {
  ScheduleCard(this.title, this.image, this.time, this.episodeno, {super.key});
  String title;
  ImageProvider image;
  String episodeno;
  String time;

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
                          'Episode: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          episodeno.toString().toUpperCase(),
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
                          "Time: ",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          time.toString(),
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
