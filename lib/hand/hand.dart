//Flutter Import
import 'package:flutter/material.dart';

//Third Party Import

//Local Import

abstract class Hand extends StatefulWidget {
  final Color color;
  final double length;

  Hand(
      {@required this.color,
      @required this.length})
      : assert(color != null),
        assert(length != null);
}
