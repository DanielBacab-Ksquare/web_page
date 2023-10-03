import 'package:flutter/material.dart';
import 'package:web_page/custom_widgets/card.dart';
import 'package:web_page/controllers/expandable_provider.dart';



// ignore: must_be_immutable
class Section2 extends StatefulWidget {
  final GlobalKey experience;
  double screenHeight;
  double screenWidth;
  double text;
  double titles;
  double introductions;
  ExpandableProvider expandableProvider;
  Section2(
      {super.key,
      required this.experience,
      required this.screenHeight,
      required this.screenWidth,
      required this.text,
      required this.titles,
      required this.introductions,
      required this.expandableProvider,});

  @override
  State<Section2> createState() => _Section1State();
}

class _Section1State extends State<Section2> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
                    key: widget.experience,
                    child: Container(
                      decoration: const BoxDecoration(
                        color:  Color(0xff0b192f),
                        image: DecorationImage
                        (image:  AssetImage(
                                      'images/back1.jpg'),
                        fit: BoxFit.cover,
                        )
                      ),
                      height: widget.screenHeight +
                          widget.expandableProvider
                              .currentSection1Offset, 
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.screenWidth * .1,
                            vertical: widget.screenHeight * .05),
                        child: Column(children: [
                          Text("Experience",
                              style: TextStyle(
                                  color: const Color(0xff61f7d5),
                                  fontSize: widget.titles)),

                          //Ingenieria en mecatronica CARD        
                          InfoCard(
                            title:
                                "Mechatronics Engineering | Facultad de ingeniería | December 2016 - December 2021",
                            classification: "Education",
                            classificationColor: Colors.lightBlue,
                            section: 0,
                            index: 0,
                            expandableProvider: widget.expandableProvider,
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

                          //Accenture bootcamp CARD
                          InfoCard(
                            title: "QE Bootcamp | Accenture | May 2022",
                            classification: "Bootcamp",
                            classificationColor: Colors.lightGreen,
                            section: 0,
                            index: 1,
                            expandableProvider: widget.expandableProvider,
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

                          //ITK experience CARD
                          InfoCard(
                            title:
                                "Software Engineering Certification Course | Instituto Tecnologico Ksquare | September 2022 - March 2023",
                            classification: "Course",
                            classificationColor: Colors.orange,
                            section: 0,
                            index: 2,
                            expandableProvider: widget.expandableProvider,
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
                                    height: widget.screenHeight * 1.2,
                                    width: widget.screenWidth * .65,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          //1ero trader CARD

                          InfoCard(
                            title: "Scanner | 1ero Trader | June - July 2023", 
                            classification: "Contract", 
                            classificationColor: Colors.red, 
                            childWidget: Center(
                                  child: Image.network(
                                    "https://i.imgur.com/OuYhgQW.jpg",
                                   height: widget.screenHeight * 1.5,/*
                                    width: screenWidth * .65, */
                                    fit: BoxFit.cover,
                                  ),
                                ), 
                            index: 3, 
                            section: 0, 
                            expandableProvider: widget.expandableProvider)



                        ]),
                      ),
                    ),
                  );
  }
}

