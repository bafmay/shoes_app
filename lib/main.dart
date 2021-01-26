import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/pages/shoes_page.dart';

import 'src/pages/shoe_description_page.dart';

void main() {
  return runApp(
    ChangeNotifierProvider(
      create: (_) => ShoeColorModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ShoesPage(),
    );
  }
}
