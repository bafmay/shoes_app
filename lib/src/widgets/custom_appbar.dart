import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Text(text,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            Spacer(),
            Icon(Icons.search, size: 30)
          ],
        ),
      ),
    );
  }
}
