// ignore_for_file: prefer_interpolation_to_compose_strings


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_page/controllers/appbar_provider.dart';
import 'package:web_page/controllers/expandable_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:web_page/custom_widgets/custom_appbar.dart';
import 'package:web_page/custom_widgets/custom_appbar_mobile.dart';
import 'package:web_page/custom_widgets/section1.dart';
import 'package:web_page/custom_widgets/section2.dart';
import 'package:web_page/custom_widgets/section3.dart';
import 'package:web_page/custom_widgets/social.dart';
import 'package:web_page/utils/responsive.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ScrollController scrollController;
  final GlobalKey about = GlobalKey();
  final GlobalKey experience = GlobalKey();
  final GlobalKey projects = GlobalKey();
  final GlobalKey social = GlobalKey();

  late AppbarProvider appbarProvider;
  late ExpandableProvider expandableProvider;
  Future<void>? initializeVideoPlayerFuture;
  double screenHeight = 100;
  double screenWidth = 200;
  double currentHeight = 100;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appbarProvider = Provider.of<AppbarProvider>(context);

    scrollController.addListener(() {
      /* print("currentHeight: ${appbarProvider.currentHeight * 1.2}");
      print("screenHeight: ${(screenHeight)}"); 
      print((255 * (appbarProvider.currentHeight / screenHeight)).round() -
          appbarProvider.colorOffset);*/

      appbarProvider.newColor(
          (255 * (appbarProvider.currentHeight / screenHeight)).round() -
              appbarProvider.colorOffset,
          (255 * (appbarProvider.currentHeight / screenHeight)).round() -
              appbarProvider.colorOffset,
          (255 * (appbarProvider.currentHeight / screenHeight)).round() -
              appbarProvider.colorOffset);

      if (appbarProvider.currentHeight <= (((screenHeight * .2)) * 2)) {
        appbarProvider.isCollapsed = true;
      } else {
        appbarProvider.isCollapsed = false;
      }

      if (appbarProvider.currentHeight * 1.3 >= (screenHeight)) {
        appbarProvider.isExpanded = true;
      } else {
        appbarProvider.isExpanded = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appbarProvider = Provider.of<AppbarProvider>(context);
    expandableProvider = Provider.of<ExpandableProvider>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    appbarProvider.colorOffset = ((screenWidth / screenHeight) * 70).round();

    //text sizes
    double titles = screenHeight * 0.2;
    double introductions = screenHeight * .07;
    double text = screenHeight * .04;

    FontWeight navbarWeight = FontWeight.w800;

    return SafeArea(
      child: WebSmoothScroll(
        controller: scrollController,
        scrollOffset: 80,
        animationDuration: 400,
        curve: Curves.easeInOutCirc,
        child: Scaffold(
          body: Stack(children: [
            Scrollbar(
              interactive: true,
              thickness: screenWidth * .01,
              trackVisibility: true,
              thumbVisibility: true,
              controller: scrollController,
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[

                  //APPBAR
                  Responsive(mobile: CustomAppbarMobile(screenHeight: screenHeight, currentHeight: currentHeight, screenWidth: screenWidth, text: text, titles: titles, introductions: introductions, appbarProvider: appbarProvider, navbarWeight: navbarWeight, about: about, experience: experience, projects: projects, social: social, scrollController: scrollController), desktop: CustomAppbar(screenHeight: screenHeight, currentHeight: currentHeight, screenWidth: screenWidth, text: text, titles: titles, introductions: introductions, appbarProvider: appbarProvider, navbarWeight: navbarWeight, about: about, experience: experience, projects: projects, social: social, scrollController: scrollController))
                  ,

                  //sections 1
                  Section1(about: about, screenHeight: screenHeight, screenWidth: screenWidth, text: text, titles: titles, introductions: introductions),
                  
                  //section 2
                  Section2(experience: experience, screenHeight: screenHeight, screenWidth: screenWidth, text: text, titles: titles, introductions: introductions, expandableProvider: expandableProvider),

                  //sections 3
                  Section3(projects: projects, screenHeight: screenHeight, screenWidth: screenWidth, text: text, titles: titles, introductions: introductions, expandableProvider: expandableProvider),

                  //Social
                  Social(social: social, screenHeight: screenHeight, screenWidth: screenWidth, text: text, titles: titles, introductions: introductions),

                  //Fin
                ],
              ),
            ),
          ]),
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
    /* print("Error"); */
  }
}
