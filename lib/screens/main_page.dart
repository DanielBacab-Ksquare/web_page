// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_page/controllers/appbar_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scrollController = ScrollController();
  late AppbarProvider appbarProvider;
  double screenHeight = 100;
  double screenWidth = 200;
  double currentHeight = 100;

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

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            //Appbar

            SliverAppBar(
                pinned: true,
                backgroundColor: appbarProvider.sliverAppBarColor,
                expandedHeight: screenHeight,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
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
                                child: Image.network(
                                  'https://i.imgur.com/A5ns36k.jpg',
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
                )),

            //sections 1

            SliverToBoxAdapter(
              child: Container(
                height: screenHeight,
                color: Color(0xFF001BC9),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .1,
                      vertical: screenHeight * .1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, my name is",
                          style: TextStyle(
                              color: Color(0xff61f7d5),
                              fontSize: introductions)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Daniel Bacab.",
                          style:
                              TextStyle(color: Colors.white, fontSize: titles)),
                      SizedBox(
                        width: screenWidth * .5,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      "I am a mechatronic engineer with a focus on the software area. I'm certified as a junior Flutter developer by ",
                                  style: TextStyle(
                                      color: Color(0xff8993af),
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
                                      color: Color(0xff8993af),
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
              child: Container(
                height: screenHeight,
                color: Color(0xFF0017AE),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .1,
                      vertical: screenHeight * .1),
                  child: Column(children: []),
                ),
              ),
            ),

            //sections 3

            SliverToBoxAdapter(
              child: Container(
                height: screenHeight,
                color: Color(0xFF001289),
                child: Center(
                  child: Text('Sección 3'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  // Aquí colocarías los elementos del banner que se ajustarán a medida que el banner se colapsa
                  ListTile(title: Text('Elemento 1')),
                  ListTile(title: Text('Elemento 2')),
                  ListTile(title: Text('Elemento 3')),
                  ListTile(title: Text('Elemento 4')),
                  ListTile(title: Text('Elemento 5')),
                  ListTile(title: Text('Elemento 6')),
                  ListTile(title: Text('Elemento 7')),
                  ListTile(title: Text('Elemento 8')),
                  ListTile(title: Text('Elemento 9')),
                  ListTile(title: Text('Elemento 10')),
                ],
              ),
            ),
          ],
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
