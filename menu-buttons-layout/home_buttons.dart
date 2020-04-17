import 'package:flutter/material.dart';

class HomeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        double smallerDim = (w < h) ? w : h;

        double iconArea = smallerDim / 8;

        return Stack(
          children: [
            // we can put here some background
            Align(
              alignment: Alignment.center,
              child: Container(
                width: smallerDim,
                height: smallerDim,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: iconArea,
                        height: iconArea,
                        child: Icon(Icons.alternate_email), // icon, logo, etc
                      ),
                    ),
                    //
                    Align(
                      alignment: Alignment.topCenter,
                      child: SingleButton(0),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SingleButton(2),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleButton(3),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleButton(1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
