//Flutter Import
import 'package:flutter/material.dart';

//Third Party Import
import 'package:flare_flutter/flare_actor.dart';

//Local Import

///Cloud and Stars interchange by day and night, represents 10, 20, 30, 40 and 50 seconds mark
class SkyCloudsStars extends StatefulWidget {
  final int hours;

  SkyCloudsStars({@required this.hours}) : assert(hours != null);

  @override
  State<StatefulWidget> createState() {
    return SkyCloudsStarsState();
  }
}

class SkyCloudsStarsState extends State<SkyCloudsStars> {
  Widget _cloudsStars;

  @override
  void initState() {
    super.initState();
  }

  void _cloudStarInterChange(double width, double height) {
    if (widget.hours >= 6 && widget.hours < 18) {
      setState(() {
        _cloudsStars = Stack(
          children: <Widget>[
            Positioned(
                top: height * 0.35,
                left: (width * 1.1 * 10 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/cloud.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.1,
                left: (width * 1.1 * 20 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/cloud.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.5,
                left: (width * 1.1 * 30 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/cloud.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.25,
                left: (width * 1.1 * 40 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/cloud.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.4,
                left: (width * 1.1 * 50 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/cloud.flr',
                      animation: 'shining',
                    ))),
          ],
        );
      });
    } else {
      setState(() {
        _cloudsStars = Stack(
          children: <Widget>[
            Positioned(
                top: height * 0.35,
                left: (width * 1.1 * 10 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/star.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.1,
                left: (width * 1.1 * 20 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/star.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.5,
                left: (width * 1.1 * 30 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/star.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.25,
                left: (width * 1.1 * 40 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/star.flr',
                      animation: 'shining',
                    ))),
            Positioned(
                top: height * 0.4,
                left: (width * 1.1 * 50 / 60) - (width * 0.055),
                child: Container(
                    width: width * 0.1,
                    height: height * 0.1,
                    child: FlareActor(
                      'assets/flare/star.flr',
                      animation: 'shining',
                    ))),
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _cloudStarInterChange(width, height);
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.linear,
          child: _cloudsStars,
        )
      ],
    );
  }
}
