//Flutter Import
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

//Third Party Import

//Local Import

///Rabbit and Bear interchange by day and night, represents minutes
class MinuteRabbitBear extends StatefulWidget {
  final int minutes;
  final int hours;

  MinuteRabbitBear({@required this.minutes, @required this.hours})
      : assert(minutes != null),
        assert(hours != null);

  @override
  State<StatefulWidget> createState() {
    return MinuteRabbitBearState();
  }
}

class MinuteRabbitBearState extends State<MinuteRabbitBear> {
  double _translationXValue;
  double _numberOfTurns;
  int _previousMinute;
  String _animation;

  @override
  void initState() {
    _numberOfTurns = 0;
    _previousMinute = widget.minutes;
    _animation = 'idle';
    super.initState();
  }

  void _translateRabbitBear(double width) {
    setState(() {
      _translationXValue = (width * 1.1 * widget.minutes / 60) - width * 0.09;
    });
  }

  void _changeFlareAnimation() {
    setState(() {
      if (_previousMinute != widget.minutes) {
        _animation = 'move';
        if (widget.minutes == 0) {
          _numberOfTurns = _numberOfTurns + 1;
        }
        _previousMinute = widget.minutes;
      } else {
        _animation = 'idle';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _translateRabbitBear(width);
    _changeFlareAnimation();
    return Stack(
      children: <Widget>[
        _numberOfTurns.toInt().isEven
            ? Positioned(
                bottom: height * 0.05,
                child: AnimatedContainer(
                  transform:
                      Matrix4.translationValues(_translationXValue, 0, 0),
                  child: FlareActor(
                      widget.hours >= 6 && widget.hours < 18
                          ? 'assets/flare/rabbit.flr'
                          : 'assets/flare/bear.flr',
                      animation: _animation,
                      alignment: Alignment.bottomLeft),
                  margin: EdgeInsets.only(left: 0),
                  duration: Duration(seconds: 1),
                  width: width * 0.3,
                  height: height * 0.3,
                ),
              )
            : Container(),
        _numberOfTurns.toInt().isOdd
            ? Positioned(
                bottom: height * 0.05,
                child: AnimatedContainer(
                  transform:
                      Matrix4.translationValues(_translationXValue, 0, 0),
                  child: FlareActor(
                      widget.hours >= 6 && widget.hours < 18
                          ? 'assets/flare/rabbit.flr'
                          : 'assets/flare/bear.flr',
                      animation: _animation,
                      alignment: Alignment.bottomLeft),
                  margin: EdgeInsets.only(left: 0),
                  duration: Duration(seconds: 1),
                  width: width * 0.3,
                  height: height * 0.3,
                ),
              )
            : Container(),
      ],
    );
  }
}
