import 'dart:ui';

import 'package:flutter/material.dart';

class LevelGauge extends StatelessWidget {
  final double maxLevel;
  final double minLevel;
  final List<double> levels;
  final double height = 50;

  LevelGauge(
      {@required this.maxLevel,
      @required this.minLevel,
      @required this.levels}) {
    if (this.maxLevel < this.minLevel)
      throw "minLevel is greater than maxLevel";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Container(
          height: boxConstraints.maxHeight,
          width: boxConstraints.maxWidth,
          child: CustomPaint(
            painter: _LevelGaugePainter(maxLevel, minLevel, levels),
          ),
        );
      },
    );
  }
}

class _LevelGaugePainter extends CustomPainter {
  final double maxLevel;
  final double minLevel;
  final List<double> levels;

  _LevelGaugePainter(this.maxLevel, this.minLevel, this.levels);

  double _getYForLevel(double level) {
    if (level <= minLevel) return 0.1;
    if (level > maxLevel) return .99;

    var temp = level - minLevel;
    var diff = maxLevel - minLevel;

    return temp / diff;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    var x = 0;
    for (var level in levels) {
      path.lineTo(size.width * (x++ / (levels.length - 1)),
          size.height - size.height * _getYForLevel(level));
    }
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(
        path,
        Paint()
          ..color = Color(0x560000ff)
          ..strokeWidth = 1);

    canvas.drawLine(
        Offset(0, size.height - 5),
        Offset(size.width, size.height - 5),
        Paint()
          ..color = Colors.green
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke);

    canvas.drawLine(
        Offset(0, 5),
        Offset(size.width, 5),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
