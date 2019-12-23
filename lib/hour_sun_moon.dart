//Flutter Import
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

//Third Party Import

//Local Import

///Sun and Moon interchange by day and night, from left to right represents 6am/pm to 6pm/am, in the middle will be 12am/pm
class HourSunMoon extends StatefulWidget {
  final int hours;

  HourSunMoon({@required this.hours}) : assert(hours != null);

  @override
  State<StatefulWidget> createState() {
    return HourSunMoonState();
  }
}

class HourSunMoonState extends State<HourSunMoon> {
  double _translationSunXValue;
  double _translationSunYValue;
  double _translationMoonXValue;
  double _translationMoonYValue;
  String _animation;

  @override
  void initState() {
    _animation = 'shining';
    super.initState();
  }

  void _translateSunMoon(double width, double height) {
    setState(() {
      ///Translate Sun
      if (widget.hours == 5) {
        _translationSunXValue = width / 13 * 0 - width * 0.2;
      } else if (widget.hours == 6) {
        _translationSunXValue = width / 13 * 1 - width * 0.2;
      } else if (widget.hours == 7) {
        _translationSunXValue = width / 13 * 2 - width * 0.2;
      } else if (widget.hours == 8) {
        _translationSunXValue = width / 13 * 3 - width * 0.2;
      } else if (widget.hours == 9) {
        _translationSunXValue = width / 13 * 4 - width * 0.2;
      } else if (widget.hours == 10) {
        _translationSunXValue = width / 13 * 5 - width * 0.2;
      } else if (widget.hours == 11) {
        _translationSunXValue = width / 13 * 6 - width * 0.2;
      } else if (widget.hours == 12) {
        _translationSunXValue = width / 13 * 7 - width * 0.2;
      } else if (widget.hours == 13) {
        _translationSunXValue = width / 13 * 8 - width * 0.2;
      } else if (widget.hours == 14) {
        _translationSunXValue = width / 13 * 9 - width * 0.2;
      } else if (widget.hours == 15) {
        _translationSunXValue = width / 13 * 10 - width * 0.2;
      } else if (widget.hours == 16) {
        _translationSunXValue = width / 13 * 11 - width * 0.2;
      } else if (widget.hours == 17) {
        _translationSunXValue = width / 13 * 12 - width * 0.2;
      } else if (widget.hours == 18) {
        _translationSunXValue = width / 13 * 13 - width * 0.2;
      } else if (widget.hours == 19) {
        _translationSunXValue = width / 13 * 14 - width * 0.2;
      } else {
        _translationSunXValue = 0;
      }
      if (widget.hours == 5 || widget.hours == 19) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 0));
      } else if (widget.hours == 6 || widget.hours == 18) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 2));
      } else if (widget.hours == 7 || widget.hours == 17) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 3));
      } else if (widget.hours == 8 || widget.hours == 16) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 4));
      } else if (widget.hours == 9 || widget.hours == 15) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 5));
      } else if (widget.hours == 10 || widget.hours == 14) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 6));
      } else if (widget.hours == 11 || widget.hours == 13) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 7));
      } else if (widget.hours == 12) {
        _translationSunYValue = -((height * 0.05) + (height * 0.9 / 7 * 8));
      } else {
        _translationSunYValue = 0;
      }

      ///Translate Moon
      if (widget.hours == 17) {
        _translationMoonXValue = width / 13 * 0 - width * 0.2;
      } else if (widget.hours == 18) {
        _translationMoonXValue = width / 13 * 1 - width * 0.2;
      } else if (widget.hours == 19) {
        _translationMoonXValue = width / 13 * 2 - width * 0.2;
      } else if (widget.hours == 20) {
        _translationMoonXValue = width / 13 * 3 - width * 0.2;
      } else if (widget.hours == 21) {
        _translationMoonXValue = width / 13 * 4 - width * 0.2;
      } else if (widget.hours == 22) {
        _translationMoonXValue = width / 13 * 5 - width * 0.2;
      } else if (widget.hours == 23) {
        _translationMoonXValue = width / 13 * 6 - width * 0.2;
      } else if (widget.hours == 0) {
        _translationMoonXValue = width / 13 * 7 - width * 0.2;
      } else if (widget.hours == 1) {
        _translationMoonXValue = width / 13 * 8 - width * 0.2;
      } else if (widget.hours == 2) {
        _translationMoonXValue = width / 13 * 9 - width * 0.2;
      } else if (widget.hours == 3) {
        _translationMoonXValue = width / 13 * 10 - width * 0.2;
      } else if (widget.hours == 4) {
        _translationMoonXValue = width / 13 * 11 - width * 0.2;
      } else if (widget.hours == 5) {
        _translationMoonXValue = width / 13 * 12 - width * 0.2;
      } else if (widget.hours == 6) {
        _translationMoonXValue = width / 13 * 13 - width * 0.2;
      } else if (widget.hours == 7) {
        _translationMoonXValue = width / 13 * 14 - width * 0.2;
      } else {
        _translationMoonXValue = 0;
      }
      if (widget.hours == 17 || widget.hours == 7) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 0));
      } else if (widget.hours == 18 || widget.hours == 6) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 2));
      } else if (widget.hours == 19 || widget.hours == 5) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 3));
      } else if (widget.hours == 20 || widget.hours == 4) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 4));
      } else if (widget.hours == 21 || widget.hours == 3) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 5));
      } else if (widget.hours == 22 || widget.hours == 2) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 6));
      } else if (widget.hours == 23 || widget.hours == 1) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 7));
      } else if (widget.hours == 0) {
        _translationMoonYValue = -((height * 0.05) + (height * 0.9 / 7 * 8));
      } else {
        _translationMoonYValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _translateSunMoon(width, height);
    return Stack(
      children: <Widget>[
        widget.hours >= 5 && widget.hours <= 19
            ? Positioned(
                left: 0,
                bottom: -height * 0.4,
                child: AnimatedContainer(
                  transform: Matrix4.translationValues(
                      _translationSunXValue, _translationSunYValue, 0),
                  child: Container(
                      child: FlareActor('assets/flare/sun.flr',
                          animation: _animation,
                          alignment: Alignment.bottomLeft)),
                  margin: EdgeInsets.only(left: 0),
                  duration: Duration(seconds: 1),
                  width: width * 0.4,
                  height: height * 0.4,
                ),
              )
            : Container(),
        widget.hours >= 17 || widget.hours <= 7
            ? Positioned(
                left: 0,
                bottom: -height * 0.4,
                child: AnimatedContainer(
                  transform: Matrix4.translationValues(
                      _translationMoonXValue, _translationMoonYValue, 0),
                  child: Container(
                      child: FlareActor('assets/flare/moon.flr',
                          animation: _animation,
                          alignment: Alignment.bottomLeft)),
                  margin: EdgeInsets.only(left: 0),
                  duration: Duration(seconds: 1),
                  width: width * 0.4,
                  height: height * 0.4,
                ),
              )
            : Container(),
      ],
    );
  }
}
