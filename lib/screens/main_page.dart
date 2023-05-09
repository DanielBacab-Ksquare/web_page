// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_page/controllers/appbar_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_page/custom_widgets/card.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            SpinKitCircle(
              duration: const Duration(milliseconds: 1500),
              color: const Color(0xff61f7d5),
              size: screenWidth * .3,
            ),
            Scrollbar(
              interactive: true,
              thickness: screenWidth * .01,
              trackVisibility: true,
              thumbVisibility: true,
              controller: scrollController,
              child: CustomScrollView(
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                slivers: <Widget>[
                  //Appbar

                  SliverAppBar(
                    pinned: true,
                    backgroundColor: appbarProvider.sliverAppBarColor,
                    expandedHeight: screenHeight,
                    snap: true,
                    floating: true,
                    flexibleSpace: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        currentHeight = constraints.maxHeight;

                        appbarProvider.currentHeight = constraints.maxHeight;

                        return Stack(
                          children: [
                            Stack(children: <Widget>[
                              Positioned(
                                left: screenWidth *
                                    .35 *
                                    (currentHeight / screenHeight),
                                top: screenHeight *
                                    .05 *
                                    (currentHeight / screenHeight),
                                child: ClipPath(
                                    clipper: OvalClipper(),
                                    child: Image.asset(
                                      'images/profile.jpg',
                                      height: (screenWidth / screenHeight) *
                                          200 *
                                          (currentHeight / screenHeight),
                                      width: (screenWidth / screenHeight) *
                                          200 *
                                          (currentHeight / screenHeight),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ]),
                            Stack(children: <Widget>[
                              Positioned(
                                  left: screenWidth *
                                      .38 *
                                      (currentHeight / screenHeight),
                                  top: screenHeight *
                                      .75 *
                                      (currentHeight / screenHeight),
                                  child: Text(
                                    'Daniel Bacab',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (screenWidth / screenHeight) *
                                            (currentHeight / screenHeight) *
                                            30),
                                  ))
                            ]),
                            Stack(children: <Widget>[
                              Positioned(
                                  left: screenWidth *
                                      .4 *
                                      (currentHeight / screenHeight),
                                  top: screenHeight *
                                      .87 *
                                      (currentHeight / screenHeight),
                                  child: Text(
                                    appbarProvider.isExpanded
                                        ? 'Flutter Developer'
                                        : '',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (screenWidth / screenHeight) *
                                            (currentHeight / screenHeight) *
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
                          scrollController.position.ensureVisible(
                              about.currentContext!.findRenderObject()!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Row(
                          children: [
                            Text(
                              "01. ",
                              style: TextStyle(
                                  color: const Color(0xff61f7d5),
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            Text(
                              "About",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            SizedBox(
                              width: screenWidth * .03,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          scrollController.position.ensureVisible(
                              experience.currentContext!.findRenderObject()!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Row(
                          children: [
                            Text(
                              "02. ",
                              style: TextStyle(
                                  color: const Color(0xff61f7d5),
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            Text(
                              "Experience",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            SizedBox(
                              width: screenWidth * .03,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          scrollController.position.ensureVisible(
                              projects.currentContext!.findRenderObject()!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Row(
                          children: [
                            Text(
                              "03. ",
                              style: TextStyle(
                                  color: const Color(0xff61f7d5),
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            Text(
                              "Projects",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            SizedBox(
                              width: screenWidth * .03,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          scrollController.position.ensureVisible(
                              social.currentContext!.findRenderObject()!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Row(
                          children: [
                            Text(
                              "04. ",
                              style: TextStyle(
                                  color: const Color(0xff61f7d5),
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            Text(
                              "Social",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * .02,
                                  fontWeight: navbarWeight),
                            ),
                            SizedBox(
                              width: screenWidth * .03,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  //sections 1

                  SliverToBoxAdapter(
                    key: about,
                    child: Container(
                      height: screenHeight,
                      color: const Color.fromARGB(255, 0, 20, 153),
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * .06),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 10.0, color: Colors.grey),
                            left: BorderSide(width: 10.0, color: Colors.grey),
                            right: BorderSide(width: 10.0, color: Colors.grey),
                            bottom: BorderSide(width: 10.0, color: Colors.grey),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * .1,
                            vertical: screenHeight * .1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi, my name is",
                                style: TextStyle(
                                    color: const Color(0xff61f7d5),
                                    fontSize: introductions)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Daniel Bacab.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: titles)),
                            SizedBox(
                              width: screenWidth * .5,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            "I am a mechatronic engineer with a focus on the software area. I'm certified as a junior Flutter developer by ",
                                        style: TextStyle(
                                            color: const Color(0xff8993af),
                                            fontSize: text)),
                                    TextSpan(
                                      text: 'ITK',
                                      style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                          fontSize: text),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _openURL(
                                              "https://itk.mx/certification-course/");
                                        },
                                    ),
                                    TextSpan(
                                        text:
                                            ', I have experience in real flutter projects (like this page) as well as a bit of HTML, CSS and Javascript.',
                                        style: TextStyle(
                                            color: const Color(0xff8993af),
                                            fontSize: text)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //section 2

                  SliverToBoxAdapter(
                    key: experience,
                    child: Container(
                      height: screenHeight * 2.7,
                      color: Color.fromARGB(255, 0, 17, 124),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * .1,
                            vertical: screenHeight * .05),
                        child: Column(children: [
                          InfoCard(
                            title:
                                "Mechatronics Engineering | Facultad de ingeniería | December 2016 - December 2021",
                            classification: "Education",
                            classificationColor: Colors.lightBlue,
                            childWidget: RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text:
                                        ' Programming and computing (C++, C#, Python)\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text:
                                        ' Automation, electronics, manufacturing, etc.\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text:
                                        ' Pre-Advanced English, Office Package (word, Excel, Power Point, etc.)\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoCard(
                            title: "QE Bootcamp | Accenture | May 2022",
                            classification: "Bootcamp",
                            classificationColor: Colors.lightGreen,
                            childWidget: RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' Agile\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' Testing\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' NodeJS\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' JavaScript & WebDriverIO\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' Selenium, Maven & POM\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' Automation BDD\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' SQL\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: ' DevOps\n',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoCard(
                            title:
                                "Software Engineering Certification Course | Instituto Tecnologico Ksquare | September 2022 - March 2023",
                            classification: "Course",
                            classificationColor: Colors.orange,
                            childWidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        alignment: PlaceholderAlignment.middle,
                                      ),
                                      TextSpan(
                                        text: ' Git, GitHub, GitLab\n',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        alignment: PlaceholderAlignment.middle,
                                      ),
                                      TextSpan(
                                        text:
                                            ' Flutter: UI Designing, Navigation, Networking, State Management, Testing, Packages & Deployment\n',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        alignment: PlaceholderAlignment.middle,
                                      ),
                                      TextSpan(
                                        text: ' PMO\n',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        alignment: PlaceholderAlignment.middle,
                                      ),
                                      TextSpan(
                                        text: ' Design Thinking\n',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        alignment: PlaceholderAlignment.middle,
                                      ),
                                      TextSpan(
                                        text:
                                            ' Experience with real projects\n',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Image.network(
                                    "https://i.imgur.com/gNGMPR0.jpg",
                                    height: screenHeight * 1.2,
                                    width: screenWidth * .65,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),

                  //sections 3

                  SliverToBoxAdapter(
                    key: projects,
                    child: Container(
                      height: screenHeight * 6.5,
                      color: Color.fromARGB(255, 0, 9, 65),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * .1,
                            vertical: screenHeight * .05),
                        child: Column(children: [
                          InfoCard(
                            title: "Simon's Game",
                            classification: "video game",
                            classificationColor: const Color(0xffc53ace),
                            childWidget: Column(
                              children: [
                                Image.network(
                                    "https://i.imgur.com/obo8VbM.png"),
                                InkWell(
                                  onTap: () {
                                    _openURL(
                                        "https://github.com/RodrigoGarcia-Ksquare/project1_simon");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.remove_red_eye_outlined,
                                          size: screenHeight * .08,
                                          color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              ' Click here to see the repository',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: text),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                  _openURL(
                                                  "https://rodrigogarcia-ksquare.github.io/project1_simon/");

                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow,
                                          size: screenHeight * .08,
                                          color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Click here to play',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: text),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoCard(
                            title: "Conway's Game of Life",
                            classification: "video game",
                            classificationColor: Color(0xffc53ace),
                            childWidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                    "https://i.imgur.com/P0uxGY8.png"),
                                InkWell(
                                  onTap: (){
                                     _openURL(
                                                  "https://github.com/ArgenisGonzalez-Ksquare/project2_conway");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Icon(Icons.remove_red_eye_outlined,
                                            size: screenHeight * .08,
                                            color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Click here to see the repository',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                              fontSize: text),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                            _openURL(
                                                  "https://argenisgonzalez-ksquare.github.io/project2_conway/");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow,
                                          size: screenHeight * .08,
                                          color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Click here to play',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.underline,
                                              fontSize: text),
                                          
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoCard(
                            title: "TV Series App",
                            classification: "Mobile App",
                            classificationColor: Color(0xff31b8f7),
                            childWidget: Column(children: [
                              SizedBox(
                                width: screenWidth * .75,
                                child: const HtmlWidget(
                                  '''
                                         html,
                                          webView: true,
                                          <iframe src="https://drive.google.com/file/d/16xHHJplDXtEJKLT12L3y3RbSe53wNJ-e/preview?usp=share_link" width="640" height="480" scrolling="yes" overflow: scroll></iframe>
                                          <iframe src="https://drive.google.com/file/d/1RYQSl9DKgU8xshWQ71fn4U-1CXlPZNXS/preview?usp=share_link" width="640" height="480"></iframe>
                                          ''',
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                   _openURL(
                                                "https://github.com/EstrellaPoot-Ksquare/tv_series_project");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.remove_red_eye_outlined,
                                            size: screenHeight * .08,
                                            color: const Color(0xff61f7d5)),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Click here to see the repository',
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.underline,
                                            fontSize: text),
                                        
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoCard(
                            title: "Synkron",
                            classification: "Mobile App",
                            classificationColor: const Color(0xff31b8f7),
                            childWidget: Column(children: [
                              GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  child: const HtmlWidget('''
            <div style="position: relative; width: 100%; overflow: hidden; padding-top: 56.25%;">
              <iframe
                src="https://drive.google.com/file/d/1dIeaRu6YxoCqoZv06N3zUmKnkPcdax62/preview?usp=share_link"
                style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"
                scrolling="yes"
                sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-top-navigation"
              ></iframe>
            </div>
            ''')),
                            ]),
                          )
                        ]),
                      ),
                    ),
                  ),

                  //Social
                  SliverToBoxAdapter(
                    key: social,
                    child: Container(
                      height: screenHeight * .2,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * .01,
                            horizontal: screenWidth * .08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                _openURL(
                                    "https://github.com/DanielBacab-Ksquare");
                              },
                              child: Image.asset(
                                "images/github.jpg",
                                height: screenHeight * .12,
                                width: screenHeight * .1,
                              ),
                            ),
                            Container(
                              width: screenHeight * .12,
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
                                  height: screenHeight * .12,
                                  width: screenHeight * .1,
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
                                size: screenHeight * .09,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _openURL("mailto:dany-black88@hotmail.com");
                              },
                              child: Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                                size: screenHeight * .09,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
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

_openURL(url) async {
  url = Uri.parse(url);
  if (await launchUrl(url)) {
    await canLaunchUrl(url);
  } else {
    print("Error");
  }
}
