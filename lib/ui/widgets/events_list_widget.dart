import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_x/data/model/event_data.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:auto_x/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page_button.dart';

class EventsListWidget extends StatelessWidget{
  final List<EventTile> eventTiles = [];

  EventsListWidget({events}){
    for(EventData event in events){
      eventTiles.add(EventTile(event: event));
      print(event.link);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Responsive.mediumSpace),
          HomePageButton(),
          SizedBox(height: Responsive.smallSpace),
          Container(
              child: Column(
                children: eventTiles,
              ),
            )
        ],
      ),
    );
  }
}

class EventTile extends StatelessWidget{
  final EventData event;

  EventTile({this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(4)
      ),
      child: ListTile(
        leading: EventDateIcon(date: event.date),
        title: Text(event.name),
        subtitle: Text(event.type),
        onTap: () async => await _launchInBrowser(event.link)
      ),
    );
  }

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play(AppStrings.rick);
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class EventDateIcon extends StatelessWidget{
  String month;
  String day;
  String year;

  final monthNames = {
    '01':'Jan',
    '02':'Feb',
    '03':'Mar',
    '04':'Apr',
    '05':'May',
    '06':'Jun',
    '07':'Jul',
    '08':'Aug',
    '09':'Sep',
    '10':'Oct',
    '11':'Nov',
    '12':'Dec',
  };

  EventDateIcon({date}){
    this.year = date.substring(0,4);
    this.month = monthNames[date.substring(5,7)];
    this.day = date.substring(8);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.XLSpace,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(month, style: TextStyle(fontSize: Responsive.largeFont)),
          Text(day, style: TextStyle(fontSize: Responsive.mediumFont))
        ],
      ),
    );
  }
}