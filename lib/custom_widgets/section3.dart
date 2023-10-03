import 'package:flutter/material.dart';
import 'package:web_page/controllers/expandable_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_page/custom_widgets/card.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';



// ignore: must_be_immutable
class Section3 extends StatefulWidget {
  final GlobalKey projects;
  double screenHeight;
  double screenWidth;
  double text;
  double titles;
  double introductions;
   ExpandableProvider expandableProvider;
  Section3(
      {super.key,
      required this.projects,
      required this.screenHeight,
      required this.screenWidth,
      required this.text,
      required this.titles,
      required this.introductions,
      required this.expandableProvider,});

  @override
  State<Section3> createState() => _Section1State();
}

class _Section1State extends State<Section3> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
                    key: widget.projects,
                    child: Container(
                      height: widget.screenHeight +
                          widget.expandableProvider.currentSection2Offset,
                      decoration: const BoxDecoration(
                       color: Color(0xff0b192f),
                        image: DecorationImage
                        (image:  AssetImage(
                                      'images/back2.jpg'),
                        fit: BoxFit.cover,
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.screenWidth * .1,
                            vertical: widget.screenHeight * .05),
                        child: Column(children: [
                          Text("Projects",
                              style: TextStyle(
                                  color: const Color(0xff53D8BA),
                                  fontSize: widget.titles)),

                          //Projecto de simon dice CARD        
                          InfoCard(
                            title: "Simon's Game",
                            classification: "video game",
                            classificationColor: const Color(0xffc53ace),
                            //La seccion salta a la 2, por
                            section: 2,
                            index: 0,
                            expandableProvider: widget.expandableProvider,
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
                                          size: widget.screenHeight * .08,
                                          color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              ' Click here to see the repository',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: widget.text),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _openURL(
                                        "https://rodrigogarcia-ksquare.github.io/project1_simon/");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow,
                                          size: widget.screenHeight * .08,
                                          color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Click here to play',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: widget.text),
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
                            section: 2,
                            index: 1,
                            expandableProvider: widget.expandableProvider,
                            childWidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                    "https://i.imgur.com/P0uxGY8.png"),
                                InkWell(
                                  onTap: () {
                                    _openURL(
                                        "https://github.com/ArgenisGonzalez-Ksquare/project2_conway");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.remove_red_eye_outlined,
                                          size: widget.screenHeight * .08,
                                          color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'Click here to see the repository',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: widget.text),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _openURL(
                                        "https://argenisgonzalez-ksquare.github.io/project2_conway/");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow,
                                          size: widget.screenHeight * .08,
                                          color: const Color(0xff61f7d5)),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Click here to play',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: widget.text),
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
                            section: 2,
                            index: 2,
                            expandableProvider: widget.expandableProvider,
                            childWidget: Column(children: [
                              SizedBox(
                                width: widget.screenWidth * .75,
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
                                onTap: () {
                                  _openURL(
                                      "https://github.com/EstrellaPoot-Ksquare/tv_series_project");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.remove_red_eye_outlined,
                                        size: widget.screenHeight * .08,
                                        color: const Color(0xff61f7d5)),
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            'Click here to see the repository',
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: widget.text),
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
                            section: 2,
                            index: 3,
                            expandableProvider: widget.expandableProvider,
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
                  );
  }
}

_openURL(url) async {
  url = Uri.parse(url);
  if (await launchUrl(url)) {
    await canLaunchUrl(url);
  } else {
   /*  print("Error"); */
  }
}