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
    return ListTile(
      leading: Text(event.date),
      title: Text(event.name),
      subtitle: Text(event.type),
//      open browser to proper url to motorsportreg
      onTap: () async => await _launchInBrowser(event.link)
    );
  }

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play(AppStrings.rick);
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}