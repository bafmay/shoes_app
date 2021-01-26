import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_size_item_model.dart';
import 'package:shoes_app/src/models/shoe_size_model.dart';

class ShoeSizeItem extends StatelessWidget {
  const ShoeSizeItem({
    Key key,
    @required this.model,
    @required this.onPress,
  }) : super(key: key);

  final ShoeSizeItemModel model;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final selectedId = Provider.of<ShoeSizeModel>(context).selectedSizeId;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: model.id == selectedId ? Color(0xFFF1A23A) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (model.id == selectedId)
                BoxShadow(
                  color: Color(0xFFF1A23A),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
            ]),
        child: Text(
          "${model.shoeSize.toString().replaceAll('.0', '')}",
          style: TextStyle(
              color: model.id == selectedId ? Colors.white : Color(0xFFF1A23A),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
