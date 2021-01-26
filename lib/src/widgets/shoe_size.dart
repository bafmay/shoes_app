import 'package:flutter/material.dart';
import 'package:shoes_app/src/pages/shoe_description_page.dart';
import 'shoe_and_shadow.dart';
import 'shoe_sizes.dart';

class ShoeSizePreview extends StatelessWidget {
  const ShoeSizePreview({
    Key key,
    this.fullscreen = false,
  }) : super(key: key);

  final bool fullscreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullscreen) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ShoeDescriptionPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullscreen ? 5 : 30,
          vertical: fullscreen ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: fullscreen ? 350 : 380,
          decoration: BoxDecoration(
            color: Color(0xFFFFCF53),
            borderRadius: fullscreen
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              ShoeAndShadow(),
              if (!fullscreen) ShoeSizes(),
            ],
          ),
        ),
      ),
    );
  }
}
