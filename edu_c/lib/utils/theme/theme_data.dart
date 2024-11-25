import 'package:edu_c/utils/theme/colors.dart';
import 'package:flutter/material.dart';

const primarycolor = Color(0xFF42AA56);

const secondarycolor = Color(0xFF1267A8);

class MyTheme {
  static final theme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorResources.WHITE,
        surfaceTintColor: ColorResources.WHITE,
          iconTheme: IconThemeData(color: ColorResources.BLACK,)),
      scaffoldBackgroundColor: ColorResources.WHITE);
}
