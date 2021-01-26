import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    Key key,
    @required this.ammount,
  }) : super(key: key);

  final double ammount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Text(
              "\$$ammount",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            OrangeButton(text: "Add to cart")
          ],
        ),
      ),
    );
  }
}
