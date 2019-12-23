//Flutter Import
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

//Third Party Import

//Local Import
import 'hand.dart';

/// Total distance traveled in one full turn
final radiansInOneFullTurn = radians(360);

class MinuteHand extends Hand {
  final double thickness;
  final double radians;
  final int minutes;

  MinuteHand({
    @required Color color,
    @required double length,
    @required this.thickness,
    @required this.radians,
    @required this.minutes,
  })  : assert(color != null),
        assert(length != null),
        assert(thickness != null),
        assert(radians != null),
        assert(minutes != null),
        super(
        color: color,
        length: length,
      );

  @override
  State<StatefulWidget> createState() {
    return MinuteHandState();
  }
}

class MinuteHandState extends State<MinuteHand> with TickerProviderStateMixin {

  AnimationController _animationController;
  double _numberOfTurns;
  double _totalRadians;
  int _previousMinute;

  @override
  void initState() {
    _animationController = new AnimationController.unbounded(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _numberOfTurns = 0;
    _previousMinute = widget.minutes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.minutes == 0 && _previousMinute != widget.minutes){
      _numberOfTurns =_numberOfTurns + 1;
    }
    _previousMinute = widget.minutes;
    _totalRadians = (_numberOfTurns * radiansInOneFullTurn) + widget.radians;
    _animationController.animateTo(_totalRadians,curve: Curves.bounceOut);
    return Stack(children: <Widget>[
      Center(
        child: AnimatedBuilder(
          animation: _animationController,
          child: Container(
            child: CustomPaint(
              painter: _MinuteHandPainter(
                color: widget.color,
                thickness: widget.thickness,
                length: widget.length,),
            ),
          ),
          builder: (context, child) {
            return Transform.rotate(
                angle: _animationController.value, child: child);
          },
        ),
      ),
    ],);
//    return Center(
//      child: AnimatedContainer(
//        duration: Duration(hours: 1),
//        transform: Transform.rotate(angle: _totalRadians).transform,
//        curve: Curves.bounceOut,
//        child: Container(
//          child: CustomPaint(
//            painter: _MinuteHandPainter(
//              color: widget.color,
//              thickness: widget.thickness,
//              length: widget.length,
//            ),
//          ),
//        ),
//      ),
//    );
  }
}

class _MinuteHandPainter extends CustomPainter {
  double length;
  double thickness;
  Color color;
  Size deviceSize;

  _MinuteHandPainter(
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
  bool shouldRepaint(_MinuteHandPainter oldDelegate) {
    return false;
  }
}
