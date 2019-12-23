//Flutter Import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

//Third Party Import
import 'package:intl/intl.dart';

//Local Import
import 'package:fusm_clock/hand/second_hand.dart';
import 'package:fusm_clock/hand/minute_hand.dart';
import 'package:fusm_clock/hand/hour_hand.dart';
import 'package:fusm_clock/hour_sun_moon.dart';
import 'package:fusm_clock/minute_rabbit_bear.dart';
import 'package:fusm_clock/hour_sky.dart';
import 'package:fusm_clock/background/terrain.dart';
import 'package:fusm_clock/second_bird_comet.dart';
import 'package:fusm_clock/background/sky_clouds_stars.dart';

/// Total distance traveled by a second or a minute hand, each second or minute,
/// respectively.
final radiansPerTick = radians(360 / 60);

/// Total distance traveled by an hour hand, each hour, in radians.
final radiansPerHour = radians(360 / 12);

class Clock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClockState();
  }
}

class ClockState extends State<Clock> {
  DateTime _now = DateTime.now();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        ///Sky color changes by hours
        HourSky(
          hours: _now.hour,
        ),
        ///Sun and Moon interchange by day and night, from left to right represents 6am/pm to 6pm/am, in the middle will be 12am/pm
        HourSunMoon(
          hours: _now.hour,
        ),
        ///Cloud and Stars interchange by day and night, represents 10, 20, 30, 40 and 50 seconds mark
        SkyCloudsStars(
          hours: _now.hour,
        ),
        ///Bird and Comet interchange by day and night, represents seconds
        SecondBirdComet(
          seconds: _now.second,
          hours: _now.hour,
        ),
        ///Terrain: House represents 15 minute mark, trees represents 30 minute mark, and mountains represents 45 minute mark
        Terrain(minutes: _now.minute,hours: _now.hour),
        ///Rabbit and Bear interchange by day and night, represents minutes
        MinuteRabbitBear(
          minutes: _now.minute,
          hours: _now.hour,
        ),
        /// Uncomment to get clock
//        HourHand(
//          color: Colors.black,
//          length: height/2,
//          thickness: 4,
//          radians: (_now.hour * radiansPerHour) +
//              (_now.minute * (radiansPerHour / 60)),
//          hours: _now.hour,
//        ),
//        SecondHand(
//          color: Colors.black,
//          length: 120,
//          thickness: 1,
//          radians: _now.second * radiansPerTick,
//          hours: _now.second,
//        ),
//        MinuteHand(
//          color: Colors.black,
//          length: 120,
//          thickness: 4,
//          radians: _now.minute * radiansPerTick,
//          minutes: _now.minute,
//        ),
//        Center(
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Row(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  Text('${_now.day}'),
//                  Text(' '),
//                  Text('${DateFormat('MMM').format(_now)}'),
//                  Text(' '),
//                  Text('${_now.year}'),
//                ],
//              ),
//              Row(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  Text('${_now.hour}'),
//                  Text(' : '),
//                  Text('${_now.minute}'),
//                  Text(' : '),
//                  Text('${_now.second}'),
//                ],
//              )
//            ],
//          ),
//        )
      ],
    );
  }
}
