import 'package:flutter/services.dart';

void changeStatusBarLight() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

void changeStatusBarDark() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}
