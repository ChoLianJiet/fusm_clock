//Flutter Import
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

//Third Party Import

//Local Import

///Terrain: House represents 15 minute mark, trees represents 30 minute mark, and mountains represents 45 minute mark
class Terrain extends StatefulWidget {
  final int hours;
  final int minutes;

  Terrain({@required this.minutes, @required this.hours})
      : assert(minutes != null),
        assert(hours != null);

  @override
  State<StatefulWidget> createState() {
    return TerrainState();
  }
}

class TerrainState extends State<Terrain> {
  FlareActor _hut;
  String _treesAnimation;

  @override
  void initState() {
    _treesAnimation = 'idle';
    super.initState();
  }

  void _setHut() {
    setState(() {
      if (widget.hours >= 6 && widget.hours < 18) {
        _hut = FlareActor(
          'assets/flare/hut/morning_hut.flr',
          animation: 'chimney',
        );
      } else if ((widget.hours >= 18 && widget.hours < 22) ||
          widget.hours == 5) {
        _hut = FlareActor(
          'assets/flare/hut/night_hut.flr',
          animation: 'chimney',
        );
      } else {
        _hut = FlareActor(
          'assets/flare/hut/midnight_hut.flr',
        );
      }
    });
  }

  void _setTreesAnimation() {
    setState(() {
      if (widget.minutes < 30) {
        setState(() {
          _treesAnimation = 'move_left';
        });
      } else if (widget.minutes > 30) {
        _treesAnimation = 'move_right';
      } else if (widget.minutes == 30) {
        _treesAnimation = 'idle';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _setHut();
    _setTreesAnimation();
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: Container(
            width: width,
            height: height * 0.1,
            alignment: Alignment.bottomCenter,
            color: Colors.lightGreen,
          ),
        ),
        Positioned(
            left: (width * 1.1 * 15 / 60) - (width * 0.195),
            bottom: height * 0.1,
            child: Container(
              width: width * 0.3,
              height: height * 0.3,
              child: _hut,
            )),
        Positioned(
            left: (width * 1.1 * 30 / 60) - (width * 0.195),
            bottom: height * 0.075,
            child: Container(
              width: width * 0.3,
              height: height * 0.3,
              child: FlareActor(
                'assets/flare/trees.flr',
                animation: _treesAnimation,
              ),
            )),
        Positioned(
            left: (width * 1.1 * 45 / 60) - (width * 0.195),
            bottom: height * 0.1,
            child: Container(
              width: width * 0.3,
              height: height * 0.3,
              child: FlareActor(
                'assets/flare/mountains.flr',
              ),
            )),
      ],
    );
  }
}
