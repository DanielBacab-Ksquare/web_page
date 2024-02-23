import 'package:flutter/material.dart';
import 'package:web_page/controllers/appbar_provider.dart';

// ignore: must_be_immutable
class CustomAppbarMobile extends StatefulWidget {
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
  CustomAppbarMobile({
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
  State<CustomAppbarMobile> createState() => _Section1State();
}

class _Section1State extends State<CustomAppbarMobile> {
  @override
  Widget build(BuildContext context) {
    bool isHorizontal = widget.screenWidth > widget.screenHeight;

    double sectionNavOptionsHorizontal = .05;
    double interSeparationOptions = .03;

    //Horizontal
    return isHorizontal
        ? SliverAppBar(
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
                        left: widget.screenWidth *
                            .2 *
                            (widget.currentHeight / widget.screenHeight),
                        top: widget.screenHeight *
                            .15 *
                            (widget.currentHeight / widget.screenHeight),
                        child: ClipPath(
                            clipper: OvalClipper(),
                            child: Image.asset(
                              'images/profile.jpg',
                              height: (widget.screenWidth /
                                      widget.screenHeight) *
                                  70 *
                                  (widget.currentHeight / widget.screenHeight),
                              width: (widget.screenWidth /
                                      widget.screenHeight) *
                                  70 *
                                  (widget.currentHeight / widget.screenHeight),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ]),
                    Stack(children: <Widget>[
                      Positioned(
                          left: widget.screenWidth *
                              .48 *
                              (widget.currentHeight / widget.screenHeight),
                          top: widget.screenHeight *
                              .27 *
                              (widget.currentHeight / widget.screenHeight),
                          child: Text(
                            'Daniel Bacab',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    (widget.screenWidth / widget.screenHeight) *
                                        (widget.currentHeight /
                                            widget.screenHeight) *
                                        25),
                          ))
                    ]),
                    Stack(children: <Widget>[
                      Positioned(
                          left: widget.screenWidth *
                              .6 *
                              (widget.currentHeight / widget.screenHeight),
                          top: widget.screenHeight *
                              .55 *
                              (widget.currentHeight / widget.screenHeight),
                          child: Text(
                            widget.appbarProvider.isExpanded
                                ? 'Flutter Developer'
                                : '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    (widget.screenWidth / widget.screenHeight) *
                                        (widget.currentHeight /
                                            widget.screenHeight) *
                                        10),
                          ))
                    ]),
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
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    SizedBox(
                      width: widget.screenWidth * interSeparationOptions,
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
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    Text(
                      "Experience",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    SizedBox(
                      width: widget.screenWidth * interSeparationOptions,
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
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    Text(
                      "Projects",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    SizedBox(
                      width: widget.screenWidth * interSeparationOptions,
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
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    Text(
                      "Social",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              widget.screenHeight * sectionNavOptionsHorizontal,
                          fontWeight: widget.navbarWeight),
                    ),
                    SizedBox(
                      width: widget.screenWidth * interSeparationOptions,
                    )
                  ],
                ),
              ),
            ],
          )
        :
        //Vertical
        SliverAppBar(
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
                        left: widget.screenWidth *
                            .35 *
                            (widget.currentHeight / widget.screenHeight),
                        top: widget.screenHeight *
                            .05 *
                            (widget.currentHeight / widget.screenHeight),
                        child: ClipPath(
                            clipper: OvalClipper(),
                            child: Image.asset(
                              'images/profile.jpg',
                              height: (widget.screenWidth /
                                      widget.screenHeight) *
                                  200 *
                                  (widget.currentHeight / widget.screenHeight),
                              width: (widget.screenWidth /
                                      widget.screenHeight) *
                                  200 *
                                  (widget.currentHeight / widget.screenHeight),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ]),
                    Stack(children: <Widget>[
                      Positioned(
                          left: widget.screenWidth *
                              .38 *
                              (widget.currentHeight / widget.screenHeight),
                          top: widget.screenHeight *
                              .75 *
                              (widget.currentHeight / widget.screenHeight),
                          child: Text(
                            'Daniel Bacab in MOBILE 2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    (widget.screenWidth / widget.screenHeight) *
                                        (widget.currentHeight /
                                            widget.screenHeight) *
                                        30),
                          ))
                    ]),
                    Stack(children: <Widget>[
                      Positioned(
                          left: widget.screenWidth *
                              .4 *
                              (widget.currentHeight / widget.screenHeight),
                          top: widget.screenHeight *
                              .87 *
                              (widget.currentHeight / widget.screenHeight),
                          child: Text(
                            widget.appbarProvider.isExpanded
                                ? 'Flutter Developer'
                                : '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    (widget.screenWidth / widget.screenHeight) *
                                        (widget.currentHeight /
                                            widget.screenHeight) *
                                        20),
                          ))
                    ]),
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
