import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/pages/shoe_description_page.dart';

import 'shoe_shadow.dart';

class ShoeAndShadow extends StatelessWidget {
  const ShoeAndShadow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = Provider.of<ShoeColorModel>(context).colorPath;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: ShoeShadow(),
          ),
          Image(image: AssetImage(path)),
        ],
      ),
    );
  }
}
