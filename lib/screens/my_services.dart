import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_assets.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/constants/constants.dart';


import '../constants/app_text_styles.dart';
import '../helper/helper_class.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isApp = false, isDjango = false, isFlask = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApp = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'App Development',
              content:
                  "I specialize in developing cross-platform mobile applications using Flutter. My focus is on ensuring optimal performance and user experience across various devices. I collaborate closely with designers and backend developers to implement comprehensive project specifications, integrating client systems with third-party APIs and services.",
              asset: AppAssets.code,
              hover: isApp,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isDjango = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Django REST Framework Development',
              content:
                  "I build robust and scalable backends using Django REST Framework. My experience includes creating APIs for various applications, ensuring they are secure, efficient, and easy to maintain. I also work on integrating these APIs with frontend systems for seamless user experience",
              asset: AppAssets.drf,
              hover: isDjango,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isFlask = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Python Flask Development',
              content:
                  "I create lightweight and high-performance web applications using Python Flask. My expertise lies in building RESTful APIs, developing backend systems, and ensuring smooth integration with various frontend technologies. I focus on delivering clean, maintainable, and scalable code.",
              asset: AppAssets.flask,
              hover: isFlask,
            ),
          ),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  content:
                      "I specialize in developing cross-platform mobile applications using Flutter. My focus is on ensuring optimal performance and user experience across various devices. I collaborate closely with designers and backend developers to implement comprehensive project specifications, integrating client systems with third-party APIs and services.",
                  asset: AppAssets.code,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isDjango = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Django REST Framework Development',
                  content:
                      "I build robust and scalable backends using Django REST Framework. My experience includes creating APIs for various applications, ensuring they are secure, efficient, and easy to maintain. I also work on integrating these APIs with frontend systems for seamless user experience",
                  asset: AppAssets.drf,
                  hover: isDjango,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isFlask = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Python Flask Development',
                  content:
                      "I create lightweight and high-performance web applications using Python Flask. My expertise lies in building RESTful APIs, developing backend systems, and ensuring smooth integration with various frontend technologies. I focus on delivering clean, maintainable, and scalable code.",
                  asset: AppAssets.flask,
                  hover: isFlask,
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  content:
                      "I specialize in developing cross-platform mobile applications using Flutter. My focus is on ensuring optimal performance and user experience across various devices. I collaborate closely with designers and backend developers to implement comprehensive project specifications, integrating client systems with third-party APIs and services.",
                  asset: AppAssets.code,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isDjango = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Django REST Framework Development',
                  content:
                      "I build robust and scalable backends using Django REST Framework. My experience includes creating APIs for various applications, ensuring they are secure, efficient, and easy to maintain. I also work on integrating these APIs with frontend systems for seamless user experience",
                  asset: AppAssets.drf,
                  hover: isDjango,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isFlask = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Python Flask Development',
                  content:
                      "I create lightweight and high-performance web applications using Python Flask. My expertise lies in building RESTful APIs, developing backend systems, and ensuring smooth integration with various frontend technologies. I focus on delivering clean, maintainable, and scalable code.",
                  asset: AppAssets.flask,
                  hover: isFlask,
                ),
              ),
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required String content,
    required bool hover,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 430 : 420,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border:
            hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 130,
            height: 80,
            color: AppColors.themeColor,
          ),
          
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            content,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
