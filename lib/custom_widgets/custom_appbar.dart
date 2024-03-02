import 'package:flutter/material.dart';
import 'package:web_page/controllers/appbar_provider.dart';
import 'dart:math';

// ignore: must_be_immutable
class CustomAppbar extends StatefulWidget {
  final GlobalKey about;
  final GlobalKey experience;
  final GlobalKey projects;
  final GlobalKey social;
  double screenHeight;
  double screenWidth;
  double currentHeight;
  double text;
  double titles;
  double introductions;
  AppbarProvider appbarProvider;
  FontWeight navbarWeight;
  ScrollController scrollController;
  CustomAppbar({
    super.key,
    required this.screenHeight,
    required this.currentHeight,
    required this.screenWidth,
    required this.text,
    required this.titles,
    required this.introductions,
    required this.appbarProvider,
    required this.navbarWeight,
    required this.about,
    required this.experience,
    required this.projects,
    required this.social,
    required this.scrollController,
  });

  @override
  State<CustomAppbar> createState() => _Section1State();
}

class _Section1State extends State<CustomAppbar> {


  @override
  Widget build(BuildContext context) {
      
    return SliverAppBar(
      pinned: true,
      backgroundColor: widget.appbarProvider.sliverAppBarColor,
      expandedHeight: widget.screenHeight,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          widget.currentHeight = constraints.maxHeight;

          widget.appbarProvider.currentHeight = constraints.maxHeight;
        
          return Stack(
            children: [
              Stack(children: <Widget>[
                Positioned(
                  left: ((widget.screenWidth / 2) -
                          ((0.6 * widget.currentHeight) / 2)) -
                      ((1 - (widget.currentHeight / widget.screenHeight)) *
                          (widget.screenWidth / 2)),
                  top: ((widget.screenHeight / 2) -
                          ((0.6 * widget.currentHeight) / 2)) -
                      ((1 - (widget.currentHeight / widget.screenHeight)) *
                          (widget.screenHeight / 2)),
                  child: ClipPath(
                      clipper: OvalClipper(),
                      child: Image.asset(
                        'images/profile.jpg',
                        height: 0.6 * widget.currentHeight,
                        width: 0.6 * widget.currentHeight,
                        fit: BoxFit.cover,
                      )),
                ),
              ]),
              Stack(children: <Widget>[
                Positioned(
                    left: -((1 - (widget.currentHeight / widget.screenHeight)) *
                        (widget.screenWidth /
                            2.25))
                    ,
                    top: exp(8 *
                            ((widget.currentHeight / widget.screenHeight) -
                                1)) *
                        (widget.screenHeight * .35) ,
                    child: SizedBox(
                      width: widget.screenWidth,
                      height: widget.currentHeight,
                      child: Center(
                        child: Text(
                          'Daniel Bacab',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widget.currentHeight * .05 +
                                  widget.screenHeight * .02),
                        ),
                      ),
                    ))
              ]),
              widget.appbarProvider.isExpanded?Stack(children: <Widget>[
                Positioned(
                      left: -((1 - (widget.currentHeight / widget.screenHeight)) *
                        (widget.screenWidth /
                            2.25))
                    ,
                    top: exp(2 *
                            ((widget.currentHeight / widget.screenHeight) -
                                1)) *
                        (widget.screenHeight * .40) ,
                    child: SizedBox(
                       width: widget.screenWidth,
                      height: widget.currentHeight,
                      child: Center(
                        child: Text('Flutter Developer',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widget.currentHeight * .03 +
                                  widget.screenHeight * .005),
                        ),
                      ),
                    ))
              ]):const SizedBox(),
            ],
          );
        },
      ),
      actions: [
        InkWell(
          onTap: () {
            widget.scrollController.position.ensureVisible(
                widget.about.currentContext!.findRenderObject()!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          child: Row(
            children: [
              Text(
                "01. ",
                style: TextStyle(
                    color: const Color(0xff61f7d5),
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              Text(
                "About",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              SizedBox(
                width: widget.screenWidth * .03,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.scrollController.position.ensureVisible(
                widget.experience.currentContext!.findRenderObject()!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          child: Row(
            children: [
              Text(
                "02. ",
                style: TextStyle(
                    color: const Color(0xff61f7d5),
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              Text(
                "Experience",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              SizedBox(
                width: widget.screenWidth * .03,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.scrollController.position.ensureVisible(
                widget.projects.currentContext!.findRenderObject()!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          child: Row(
            children: [
              Text(
                "03. ",
                style: TextStyle(
                    color: const Color(0xff61f7d5),
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              Text(
                "Projects",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              SizedBox(
                width: widget.screenWidth * .03,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.scrollController.position.ensureVisible(
                widget.social.currentContext!.findRenderObject()!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          child: Row(
            children: [
              Text(
                "04. ",
                style: TextStyle(
                    color: const Color(0xff61f7d5),
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              Text(
                "Social",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.screenHeight * .02,
                    fontWeight: widget.navbarWeight),
              ),
              SizedBox(
                width: widget.screenWidth * .03,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class OvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addOval(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
