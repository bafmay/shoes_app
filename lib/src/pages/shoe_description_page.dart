import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescriptionPage extends StatelessWidget {
  const ShoeDescriptionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusBarLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: "shoe-1",
                child: ShoeSizePreview(fullscreen: true),
              ),
              Positioned(
                top: 70,
                left: 10,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    changeStatusBarDark();
                  },
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNowAmmount(),
                  _ColorAndMore(),
                  _BottomButtons()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _BottomButtonModel(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ShadowButton(
              index: 0,
              icon: Icons.star,
            ),
            _ShadowButton(
              index: 1,
              icon: Icons.shopping_cart,
            ),
            _ShadowButton(
              index: 2,
              icon: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  const _ShadowButton({
    Key key,
    this.icon,
    this.index,
  }) : super(key: key);

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        Provider.of<_BottomButtonModel>(context).selectedIndex;
    return GestureDetector(
      onTap: () {
        Provider.of<_BottomButtonModel>(context, listen: false).selectedIndex =
            index;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: selectedIndex == index
              ? Colors.red
              : Colors.grey.withOpacity(0.4),
        ),
      ),
    );
  }
}

class _ColorAndMore extends StatelessWidget {
  const _ColorAndMore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                ColorButton(
                  color: Color(0xFF364D56),
                  index: 1,
                  path: "assets/imgs/negro.png",
                ),
                Positioned(
                  left: 30,
                  child: ColorButton(
                    color: Color(0xFF2099F1),
                    index: 2,
                    path: "assets/imgs/azul.png",
                  ),
                ),
                Positioned(
                  left: 60,
                  child: ColorButton(
                    color: Color(0xFFFFAD29),
                    index: 3,
                    path: "assets/imgs/amarillo.png",
                  ),
                ),
                Positioned(
                  left: 90,
                  child: ColorButton(
                    color: Color(0xFFC6D642),
                    index: 4,
                    path: "assets/imgs/verde.png",
                  ),
                ),
              ],
            ),
          ),
          OrangeButton(
            text: "More related items",
            width: 170,
            height: 30,
            color: Color(0xFFFFC675),
          )
        ],
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key key,
    @required this.color,
    this.index,
    @required this.path,
  }) : super(key: key);

  final Color color;
  final int index;
  final String path;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: 200 * index),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          Provider.of<ShoeColorModel>(context, listen: false).colorPath = path;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _BuyNowAmmount extends StatelessWidget {
  const _BuyNowAmmount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Text(
            "\$180.0",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Bounce(
            delay: Duration(seconds: 1),
            from: 9,
            child: OrangeButton(
              text: "Buy now",
              width: 120,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomButtonModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => this._selectedIndex;
  set selectedIndex(int index) {
    this._selectedIndex = index;
    notifyListeners();
  }
}

class ShoeColorModel extends ChangeNotifier {
  String _colorPath = "assets/imgs/negro.png";

  String get colorPath => this._colorPath;
  set colorPath(String path) {
    this._colorPath = path;
    notifyListeners();
  }
}
