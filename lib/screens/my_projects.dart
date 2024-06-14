import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_assets.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/constants.dart';
import '../helper/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/utils.dart';

class Project {
  final String imagePath;
  final String title;
  final String description;
  final String link;
  final bool isCompleted;

  Project({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.link,
    required this.isCompleted,
  });
}

final List<Project> projects = [
  Project(
    imagePath: AppAssets.work1,
    title: 'Smart Farming System',
    description:
        'Worked as a Team Lead to develop a mobile application for farmers to control Green House System.\n'
        'Frontend: Flutter, \n'
        'Backend: Firebase, Flask, \n'
        'Model Creation: Python',
    link: 'https://github.com/s4rath/smart_farming',
    isCompleted: true,
  ),
  Project(
    imagePath: AppAssets.work2,
    title: 'Garbage Classification System',
    description:
        'Worked as a Team Lead to develop a reward-based mobile application for garbage classification and disposal.\n'
        'Frontend: Flutter, \n'
        'Backend: Firebase, \n'
        'Model Creation: Python',
    link: 'https://github.com/s4rath/Garbage-Classification',
    isCompleted: true,
  ),
  Project(
    imagePath: AppAssets.work3,
    title: 'Tuition Centre Mobile Application',
    description:
        'On Going Freelance Project for a Tuition Centre that helps Parents to know the academics of their children.',
    link: 'https://github.com/s4rath/kibs_app',
    isCompleted: false,
  ),
];

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.work1,
    AppAssets.work2,
    AppAssets.work3,
  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var project = projects[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {
              // Open the project link when tapped
              if (project.isCompleted) {
                Utils.launchURL(project.link);
              }
            },
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(project.imagePath), fit: BoxFit.fill),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onH0verEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.themeColor.withOpacity(1.0),
                            AppColors.themeColor.withOpacity(0.9),
                            AppColors.themeColor.withOpacity(0.8),
                            AppColors.themeColor.withOpacity(0.6),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Column(
                      children: [
                        Text(
                          project.title,
                          style: AppTextStyles.montserratStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          project.description,
                          style:
                              AppTextStyles.normalStyle(color: Colors.black87,fontSize: 13),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 30.0),
                        if (!project.isCompleted)
                          Text(
                            'In Progress',
                            style: AppTextStyles.montserratStyle(
                                color: Colors.red, fontSize: 14),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void launch(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}
