import 'dart:math';

import 'package:flutter/material.dart';

class SingleButton extends StatelessWidget {
  final int position;

  SingleButton(this.position);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double buttonContainerSize = constraints.maxWidth / 2 - 8;

        double buttonSize = buttonContainerSize * sqrt(2) / 2;
        double borderRadius = buttonSize / 4;

        double textAreaSize = buttonContainerSize / 2 - 8;

        return GestureDetector(
          onTap: _onTap,
          child: ClipPath(
            clipper: ButtonClipper(borderRadius, position),
            child: Container(
              width: buttonContainerSize,
              height: buttonContainerSize,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Transform.rotate(
                    angle: pi / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Container(
                        width: buttonSize,
                        height: buttonSize,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Container(
                    width: textAreaSize,
                    height: textAreaSize,
                    color: Colors.amber, // remove this color
                    child: Text('text or icon here'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _onTap() {
    print('HENLO (_onTap() not impletmented)');
  }
}

class ButtonClipper extends CustomClipper<Path> {
  final double radius;
  final int position;

  ButtonClipper(this.radius, this.position);

  @override
  Path getClip(Size size) {
    // Clippers work in a way, that they create a path around the stuff that
    // should be rendered
    var path = Path();

    // here we tell him that it should cover the whole object, by creating a
    // path around that object (if the path isn't closed, then it draws a
    // straight line from the last point to the beginning)
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    // and here we tell that we should add (cut) a circle in that path, with
    // given properties
    path.addOval(
      Rect.fromCircle(
        center: getOffset(size),
        radius: radius,
      ),
    );

    return path;
  }

  Offset getOffset(Size size) {
    if (position == 0) {
      return Offset(size.width / 2, size.height);
    } else if (position == 1) {
      return Offset(size.width, size.height / 2);
    } else if (position == 2) {
      return Offset(0, size.height / 2);
    } else {
      return Offset(size.width / 2, 0);
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
