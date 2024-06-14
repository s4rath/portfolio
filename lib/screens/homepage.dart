import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_assets.dart';
import '../constants/app_buttons.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/constants.dart';
import '../helper/helper_class.dart';
import '../widgets/pro_animate.dart';
import '../widgets/utils.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    AppAssets.linkedin,
    AppAssets.github,
    AppAssets.insta,
    AppAssets.facebook,
  ];

  final socialUrls = <String>[
    'linkedin.com/in/sarath-sreedhar-j-7710ba248/',
    'github.com/s4rath',
    'instagram.com/_sarath_sreedhar/',
    'facebook.com/sarath.sj.75/',
  ];

  var socialBI;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Sarath Sreedhar J',
            style: GoogleFonts.playfairDisplay(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Wrap(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  TyperAnimatedText('Django Developer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            width: size.width * 0.5,
            child: Text(
              "I'm a passionate software developer with a knack for learning and adapting to new technologies. I love creating solutions that make a difference, especially in the fields of app development and data science. My goal is to continually grow and contribute to innovative projects with my skills and enthusiasm.",
              style: AppTextStyles.normalStyle(),
            ),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    final url = socialUrls[index];
                    Utils.launchURL(url);
                  },
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        socialBI = index;
                      } else {
                        socialBI = null;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                      asset: socialButtons[index],
                      hover: socialBI == index ? true : false),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialbutton(
              onTap: () {
                html.window.open("assets/resume.pdf", "text");
              },
              buttonName: 'Download CV'),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColors.bgColor : AppColors.themeColor,
        // fit: BoxFit.fill,
      ),
    );
  }
}
