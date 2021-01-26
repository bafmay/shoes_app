import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_size_item_model.dart';
import 'package:shoes_app/src/models/shoe_size_model.dart';
import 'shoe_size_item.dart';

class ShoeSizes extends StatelessWidget {
  const ShoeSizes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShoeSizeModel(),
      child: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                shoeSizes.length,
                (index) {
                  final selectedModel = shoeSizes[index];
                  return ShoeSizeItem(
                    model: selectedModel,
                    onPress: () {
                      Provider.of<ShoeSizeModel>(context, listen: false)
                          .selectedSize = selectedModel.id;
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
