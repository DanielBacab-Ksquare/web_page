import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  String title;
  String classification;
  Color classificationColor;
  Widget childWidget;

   InfoCard(
      {Key? key,
      required this.title,
      required this.classification,
      required this.classificationColor,
      required this.childWidget,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {

    Color mainColor = const Color(0xff2f6d91);

    return ExpandableNotifier(child: Padding(padding: const EdgeInsets.all(10), child: ScrollOnExpand(scrollOnExpand: true,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: mainColor,
      ),
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            iconSize: 24,
            iconColor: Colors.white),
        header: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Nunito-Sans',
                ))),
        collapsed: const SizedBox(),
        expanded: 
          SizedBox(
            width: double.maxFinite,
            child: Card(
              color: const Color(0xff21130d),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: classificationColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              height: 24.0,
                              width: 120.0,
                              child: Center(
                                child: Text(
                                  classification,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            childWidget
                          ],
                        ),
                      ),
                    ),
          ),
        
        builder: (_, collapsed, expanded) {
          return Expandable(
            collapsed: collapsed,
            expanded: expanded,
            theme: const ExpandableThemeData(crossFadePoint: 0),
          );
        },
      ),
    ),
    ),

    
    ),);
  }
}