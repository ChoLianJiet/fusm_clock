//Flutter Import
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

//Third Party Import

//Local Import

///Bird and Comet interchange by day and night, represents seconds
class SecondBirdComet extends StatefulWidget {
  final int seconds;
  final int hours;

  SecondBirdComet({@required this.seconds, @required this.hours})
      : assert(seconds != null),
        assert(hours != null);

  @override
  State<StatefulWidget> createState() {
    return SecondBirdCometState();
  }
}

class SecondBirdCometState extends State<SecondBirdComet> {
  double _translationXValue;
  double _translationYValue;
  double _numberOfTurns;
  int _previousSecond;
  String _animation;

  @override
  void initState() {
    _numberOfTurns = 0;
    _previousSecond = widget.seconds;
    _animation = 'flying';
    super.initState();
  }

  void _translateBirdComet(double width, double height) {
    setState(() {
      _translationXValue = (width * 1.1 * widget.seconds / 60) - width * 0.09;
      _translationYValue = (height * 0.7 * widget.seconds / 60);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (widget.seconds == 0 && _previousSecond != widget.seconds) {
      _numberOfTurns = _numberOfTurns + 1;
    }
    _previousSecond = widget.seconds;
    _translateBirdComet(width, height);
    return Stack(
      children: <Widget>[
        _numberOfTurns.toInt().isEven
            ? Positioned(
                top: 0,
                child: AnimatedContainer(
                  transform: Matrix4.translationValues(
                      _translationXValue,
                      widget.hours >= 6 && widget.hours < 18
                          ? height * 0.3
                          : _translationYValue,
                      0),
                  child: FlareActor(
                      widget.hours >= 6 && widget.hours < 18
                          ? 'assets/flare/bird.flr'
                          : 'assets/flare/comet.flr',
                      animation: _animation,
                      alignment: Alignment.bottomLeft),
                  margin: EdgeInsets.only(left: 0),
                  duration: Duration(seconds: 1),
                  width: width * 0.15,
                  height: height * 0.15,
                ),
              )
            : Container(),
        _numberOfTurns.toInt().isOdd
            ? Positioned(
                top: 0,
                child: AnimatedContainer(
                  transform: Matrix4.translationValues(
                      _translationXValue,
                      widget.hours >= 6 && widget.hours < 18
                          ? height * 0.3
                          : _translationYValue,
                      0),
                  child: FlareActor(
                      widget.hours >= 6 && widget.hours < 18
                          ? 'assets/flare/bird.flr'
                          : 'assets/flare/comet.flr',
                      animation: _animation,
                      alignment: Alignment.bottomLeft),
                  margin: EdgeInsets.only(left: 0),
                  duration: Duration(seconds: 1),
                  width: width * 0.15,
                  height: height * 0.15,
                ),
              )
            : Container(),
      ],
    );
  }
}
