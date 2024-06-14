import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtons {
  static MaterialButton buildMaterialbutton({
    required VoidCallback onTap,
    required String buttonName
  }) {
    return MaterialButton(
      color: AppColors.themeColor,
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32), borderSide: BorderSide.none),
      hoverColor: AppColors.bgColor,
      splashColor: AppColors.themeColor,
      elevation: 5,
      height: 46,
      minWidth: 130,
      onPressed: onTap,
      child: Text(
        buttonName,
        style: AppTextStyles.headerTextStyle(),
      ),
    );
  }
}
