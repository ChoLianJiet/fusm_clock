//Flutter Import
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' show radians;

//Third Party Import
import 'package:flare_flutter/flare_actor.dart';

//Local Import
import 'hand.dart';
import 'package:fusm_clock/hour_sky.dart';
import 'package:fusm_clock/hour_sun_moon.dart';

/// Total distance traveled in one full turn
final radiansInOneFullTurn = radians(360);

class HourHand extends Hand {
  final double thickness;
  final double radians;
  final int hours;

  HourHand({
    @required Color color,
    @required double length,
    @required this.thickness,
    @required this.radians,
    @required this.hours,
  })
      : assert(color != null),
        assert(length != null),
        assert(thickness != null),
        assert(radians != null),
        assert(hours != null),
        super(
        color: color,
        length: length,
      );

  @override
  State<StatefulWidget> createState() {
    return HourHandState();
  }
}

class HourHandState extends State<HourHand> with TickerProviderStateMixin {
  AnimationController _animationController;
  double _numberOfTurns;
  double _totalRadians;
  int _previousHour;

  @override
  void initState() {
    _animationController = new AnimationController.unbounded(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _numberOfTurns = 0;
    _previousHour = widget.hours;
    super.initState();
  }

  Widget _buildSunMoon() {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        child: AnimatedContainer(
          duration: Duration(hours: 1),
          curve: Curves.linear,
          transform: Transform
              .translate(
              offset: -(Offset.zero &
              Size(
                  widget.thickness,
                  widget.radians % (2 * math.pi) <
                      20 * math.pi / 180 ||
                      widget.radians % (2 * math.pi) >
                          340 * math.pi / 180
                      ? widget.length * 1.5
                      : widget.length +
                      1.5 *
                          (math.sin(widget.radians %
                              (2 * math.pi) /
                              2) *
                              widget.length)))
                  .center)
              .transform,
          width: 200,
          height: 200,
          child: _sunMoonInterchange(),
        ),
        builder: (context, child) {
          return Transform.rotate(
              angle: _animationController.value, child: child);
        },
      ),
    );
  }

  Widget _sunMoonInterchange() {
    return widget.hours > 6 && widget.hours < 18
        ? FlareActor(
      'assets/flare/sun.flr',
      animation: 'shining',
    )
        : FlareActor(
      'assets/flare/moon.flr',
      animation: 'shining',
    );
  }

  Widget _buildHourHand() {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        child: Container(
          child: CustomPaint(
            painter: _HourHandPainter(
              color: widget.color,
              thickness: widget.thickness,
              length: widget.length / 3,
            ),
          ),
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
              angle: _animationController.value, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.hours == 12 || widget.hours == 0) &&
        _previousHour != widget.hours) {
      _numberOfTurns = _numberOfTurns + 1;
    }
    _previousHour = widget.hours;
    _totalRadians = (_numberOfTurns * radiansInOneFullTurn) +
        (widget.radians % (2 * math.pi));
    _animationController.animateTo(_totalRadians);
    return Stack(
      children: <Widget>[
//        _buildSunMoon(),
        _buildHourHand(),
      ],
    );
  }
}

class _HourHandPainter extends CustomPainter {
  double length;
  double thickness;
  Color color;
  Size deviceSize;

  _HourHandPainter(
      {@required this.color, @required this.length, @required this.thickness})
      : assert(color != null),
        assert(length != null),
        assert(thickness != null),
        assert(length >= 0.0);

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final position = Offset(center.dx, -length);
    final linePaint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.square;
    canvas.drawLine(center, position, linePaint);
  }

  @override
  bool shouldRepaint(_HourHandPainter oldDelegate) {
    return false;
  }
}
