import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_x/data/model/event_data.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page_button.dart';

class EventsListWidget extends StatelessWidget{
  final List<EventTile> eventTiles = [];

  EventsListWidget({events}){
    for(EventData event in events){
      eventTiles.add(EventTile(event: event));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          HomePageButton(),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: eventTiles,
              ),
            ),
          ),
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
      onTap: () async => await playLocalAsset(),
    );
  }

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play(AppStrings.rick);
  }
}