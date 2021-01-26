import 'package:flutter/material.dart';

class ShoeShadow extends StatelessWidget {
  const ShoeShadow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
