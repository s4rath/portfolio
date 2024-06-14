import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_buttons.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/constants.dart';
import '../helper/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    
      final String name = _nameController.text;
      final String email = _emailController.text;
      final String mobile = _mobileController.text;
      final String subject = _subjectController.text;
      final String message = _messageController.text;

      String _email = Uri.encodeComponent(email);
      String _subject = Uri.encodeComponent(subject);
      String _body = Uri.encodeComponent(
          "\nPhone Number : " + mobile + "\nName : " + name + "\n" + message);

      print(_subject);
      print(_email);
      print(_body);

      var url = Uri.parse("mailto:$_email?subject=$_subject&body=$_body");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildContactText(),
                Constants.sizedBox(height: 40.0),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextFormField(
                    controller: _nameController,
                    cursorColor: AppColors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildInputDecoration(hintText: 'Full Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                ),
                Constants.sizedBox(height: 20.0),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextFormField(
                    controller: _emailController,
                    cursorColor: AppColors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildInputDecoration(hintText: 'Email Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                Constants.sizedBox(height: 20.0),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextFormField(
                    controller: _mobileController,
                    cursorColor: AppColors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildInputDecoration(hintText: 'Mobile Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      return null;
                    },
                  ),
                ),
                Constants.sizedBox(height: 20.0),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextFormField(
                    controller: _subjectController,
                    cursorColor: AppColors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildInputDecoration(hintText: 'Email Subject'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the email subject';
                      }
                      return null;
                    },
                  ),
                ),
                Constants.sizedBox(height: 20.0),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  elevation: 8,
                  child: TextFormField(
                    controller: _messageController,
                    maxLines: 10,
                    cursorColor: AppColors.white,
                    style: AppTextStyles.normalStyle(),
                    decoration: buildInputDecoration(hintText: 'Your Message'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                  ),
                ),
                Constants.sizedBox(height: 40.0),
                AppButtons.buildMaterialbutton(
                    buttonName: 'Send Message',
                    onTap: () async {
                      print(_nameController.text);
                      print(_emailController.text);
                      print(_mobileController.text);
                      print(_subjectController.text);
                      print(_messageController.text);
                      await _sendMessage();
                    }),
                Constants.sizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
      tablet: buildForm(),
      desktop: buildForm(),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(),
        Constants.sizedBox(height: 40.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  controller: _nameController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  controller: _mobileController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Mobile Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  controller: _subjectController,
                  cursorColor: AppColors.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Subject'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email subject';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          elevation: 8,
          child: TextFormField(
            controller: _messageController,
            maxLines: 10,
            cursorColor: AppColors.white,
            style: AppTextStyles.normalStyle(),
            decoration: buildInputDecoration(hintText: 'Your Message'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
        ),
        Constants.sizedBox(height: 40.0),
        AppButtons.buildMaterialbutton(
            buttonName: 'Send Message',
            onTap: () async {
              print(_nameController.text);
              print(_emailController.text);
              print(_mobileController.text);
              print(_subjectController.text);
              print(_messageController.text);
              await _sendMessage();
            }),
        Constants.sizedBox(height: 30.0),
      ],
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.comfortaaStyle(),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColors.bgColor2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16));
  }
}
