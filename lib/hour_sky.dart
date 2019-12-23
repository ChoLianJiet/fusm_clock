//Flutter Import
import 'package:flutter/material.dart';

//Third Party Import
import 'package:flare_flutter/flare_actor.dart';

//Local Import

///Sky color changes by hours
class HourSky extends StatefulWidget {
  final int hours;

  HourSky({@required this.hours}) : assert(hours != null);

  @override
  State<StatefulWidget> createState() {
    return HourSkyState();
  }
}

class HourSkyState extends State<HourSky> {
  Color _firstLayerSky;
  Color _secondLayerSky;
  Color _thirdLayerSky;
  Color _fourthLayerSky;
  Color _fifthLayerSky;
  Color _sixthLayerSky;
  Color _seventhLayerSky;

  @override
  void initState() {
    _setSkyColor();
    super.initState();
  }

  void _setSkyColor() {
    if (widget.hours <= 3 || widget.hours >= 21) {
      _firstLayerSky = Color(0xFF00040F);
      _secondLayerSky = Color(0xFF040816);
      _thirdLayerSky = Color(0xFF070D25);
      _fourthLayerSky = Color(0xFF070B34);
      _fifthLayerSky = Color(0xFF141852);
      _sixthLayerSky = Color(0xFF2B2F77);
      _seventhLayerSky = Color(0xFF483475);
    } else if (widget.hours == 4 || widget.hours == 20) {
      _firstLayerSky = Color(0xFF040816);
      _secondLayerSky = Color(0xFF070D25);
      _thirdLayerSky = Color(0xFF070B34);
      _fourthLayerSky = Color(0xFF141852);
      _fifthLayerSky = Color(0xFF2B2F77);
      _sixthLayerSky = Color(0xFF483475);
      _seventhLayerSky = Color(0xFF6B4984);
    } else if (widget.hours == 5 || widget.hours == 19) {
      _firstLayerSky = Color(0xFF070B34);
      _secondLayerSky = Color(0xFF141852);
      _thirdLayerSky = Color(0xFF2B2F77);
      _fourthLayerSky = Color(0xFF483475);
      _fifthLayerSky = Color(0xFF6B4984);
      _sixthLayerSky = Color(0xFF855988);
      _seventhLayerSky = Color(0xFFB4809F);
    } else if (widget.hours == 6 || widget.hours == 18) {
      _firstLayerSky = Color(0xFF2B2F77);
      _secondLayerSky = Color(0xFF483475);
      _thirdLayerSky = Color(0xFF6B4984);
      _fourthLayerSky = Color(0xFF855988);
      _fifthLayerSky = Color(0xFFB4809F);
      _sixthLayerSky = Color(0xFFC48D94);
      _seventhLayerSky = Color(0xFFE6AEA9);
    } else if (widget.hours == 7 || widget.hours == 17) {
      _firstLayerSky = Color(0xFF855988);
      _secondLayerSky = Color(0xFFB4809F);
      _thirdLayerSky = Color(0xFFC48D94);
      _fourthLayerSky = Color(0xFFE6AEA9);
      _fifthLayerSky = Color(0xFFE5C1D2);
      _sixthLayerSky = Color(0xFFDEC1E0);
      _seventhLayerSky = Color(0xFFC3B4E9);
    } else if (widget.hours == 8 || widget.hours == 16) {
      _firstLayerSky = Color(0xFFE5C1D2);
      _secondLayerSky = Color(0xFFDEC1E0);
      _thirdLayerSky = Color(0xFFC3B4E9);
      _fourthLayerSky = Color(0xFFA0A3F7);
      _fifthLayerSky = Color(0xFFA0C4F7);
      _sixthLayerSky = Color(0xFF5FDEFF);
      _seventhLayerSky = Color(0xFF89E9FD);
    } else if (widget.hours == 9 || widget.hours == 15) {
      _firstLayerSky = Color(0xFF4C79FE);
      _secondLayerSky = Color(0xFF549DFF);
      _thirdLayerSky = Color(0xFF3DB2FE);
      _fourthLayerSky = Color(0xFF47CAFE);
      _fifthLayerSky = Color(0xFF5FDEFF);
      _sixthLayerSky = Color(0xFF89E9FD);
      _seventhLayerSky = Color(0xFF9FEAFC);
    } else if (widget.hours >= 10 || widget.hours <= 14) {
      _firstLayerSky = Color(0xFF348BFF);
      _secondLayerSky = Color(0xFF3DB2FE);
      _thirdLayerSky = Color(0xFF47CAFE);
      _fourthLayerSky = Color(0xFF5FDEFF);
      _fifthLayerSky = Color(0xFF89E9FD);
      _sixthLayerSky = Color(0xFF9FEAFC);
      _seventhLayerSky = Color(0xFFB2F2FA);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _setSkyColor();
    return Stack(
      children: <Widget>[
        Positioned(
            bottom: height * 0.1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  color: _firstLayerSky,
                  height: height * 0.9 / 7,
                  width: width,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  color: _secondLayerSky,
                  height: height * 0.9 / 7,
                  width: width,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  color: _thirdLayerSky,
                  height: height * 0.9 / 7,
                  width: width,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  color: _fourthLayerSky,
                  height: height * 0.9 / 7,
                  width: width,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  color: _fifthLayerSky,
                  height: height * 0.9 / 7,
                  width: width,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  color: _sixthLayerSky,
                  height: height * 0.9 / 7,
                  width: width,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  color: _seventhLayerSky,
                  height: height * 0.9 / 7,
                  width: width,
                ),
              ],
            )),
      ],
    );
  }
}
