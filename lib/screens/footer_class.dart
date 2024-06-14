import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_colors.dart';

class FooterClass extends StatelessWidget {
  final VoidCallback onTap;

  const FooterClass({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: AppColors.bgColor2,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.themeColor,
          ),
          child: const Icon(
            Icons.arrow_upward,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
