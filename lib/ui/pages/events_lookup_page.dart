import 'package:auto_x/bloc/event_data/event_data_bloc.dart';
import 'package:auto_x/bloc/event_data/event_data_event.dart';
import 'package:auto_x/bloc/event_data/event_data_state.dart';
import 'package:auto_x/ui/widgets/events_list_widget.dart';
import 'package:auto_x/ui/widgets/events_lookup_widget.dart';
import 'package:auto_x/ui/widgets/spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsLookupPage extends StatefulWidget {
  @override
  _EventsLookupPageState createState() => _EventsLookupPageState();
}

class _EventsLookupPageState extends State<EventsLookupPage> {
  EventDataBloc eventDataBloc;

  @override
  void initState() {
    super.initState();
    eventDataBloc = BlocProvider.of<EventDataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDataBloc, EventDataState>(builder: (context, state){
      if(state is EventDataInitialState){
        return EventsLookupWidget();
      }
      else if (state is EventDataLoadedState){
        return EventsListWidget(events: state.res.events);
      }
      else if (state is EventDataErrorState){
        return Text('No Events Found');
      } else {
        return Spinner();
      }
    });
  }
}