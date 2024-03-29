import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Social extends StatefulWidget {
  final GlobalKey social;
  double screenHeight;
  double screenWidth;
  double text;
  double titles;
  double introductions;
  Social({
    super.key,
    required this.social,
    required this.screenHeight,
    required this.screenWidth,
    required this.text,
    required this.titles,
    required this.introductions,
  });

  @override
  State<Social> createState() => _Section1State();
}

class _Section1State extends State<Social> {
  @override
  Widget build(BuildContext context) {
    bool isMobileVertical = widget.screenHeight > widget.screenWidth;

    double heightImages = isMobileVertical
        ? (widget.screenHeight * .096)
        : (widget.screenHeight * .12);

    double widthImages = isMobileVertical
        ? (widget.screenHeight * .08)
        : (widget.screenHeight * .1);

    double sizedIcons = isMobileVertical ? ( widget.screenHeight *0.072) : ( widget.screenHeight * .09);

    return SliverToBoxAdapter(
      key: widget.social,
      child: Container(
        height: widget.screenHeight * .2,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget.screenHeight * .01,
              horizontal: widget.screenWidth * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _openURL("https://github.com/DanielBacab-Ksquare");
                },
                child: Image.asset(
                  "images/github.jpg",
                  height: heightImages,
                  width: widthImages,
                ),
              ),
              Container(
                width: widget.screenHeight * .12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    _openURL(
                        "https://www.linkedin.com/in/daniel-alfredo-bacab-baas-973334134/");
                  },
                  child: Image.asset(
                    "images/linkedin.jpg",
                    height: heightImages,
                    width: widthImages,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _openURL("tel:+${9992468205}");
                },
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: sizedIcons,
                ),
              ),
              InkWell(
                onTap: () {
                  _openURL("mailto:dany-black88@hotmail.com");
                },
                child: Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                  size: sizedIcons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_openURL(url) async {
  url = Uri.parse(url);
  if (await launchUrl(url)) {
    await canLaunchUrl(url);
  } else {
    //print("Error");
  }
}
