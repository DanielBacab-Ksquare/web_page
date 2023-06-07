import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:web_page/controllers/expandable_provider.dart';

// ignore: must_be_immutable
class InfoCard extends StatefulWidget {
  String title;
  String classification;
  Color classificationColor;
  Widget childWidget;
  int index;
  int section;
  ExpandableProvider expandableProvider;

  InfoCard({
    Key? key,
    required this.title,
    required this.classification,
    required this.classificationColor,
    required this.childWidget,
    required this.index,
    required this.section,
    required this.expandableProvider,
  }) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  GlobalKey sizedBoxKey = GlobalKey();

  late ExpandableController expandableController;

  @override
  void initState() {
    int plus1 = widget.section + 1;
    super.initState();
    expandableController = ExpandableController(
        initialExpanded: widget.expandableProvider.sections[widget.section]
            [widget.index]);
    expandableController.addListener(() {
      widget.expandableProvider.sections[widget.section][widget.index] =
          expandableController.expanded;
      widget.expandableProvider.sections[plus1][widget.index] =
          sizedBoxKey.currentContext?.size?.height ?? 0.0;
      widget.expandableProvider.calculate1();

      setState(() {
        print(widget.expandableProvider.currentSection2Offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xff2f6d91);

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ScrollOnExpand(
          scrollOnExpand: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: mainColor,
            ),
            child: ExpandablePanel(
              controller: expandableController,
              theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  iconSize: 24,
                  iconColor: Colors.white),
              header: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ))),
              collapsed: const SizedBox(),
              expanded: SizedBox(
                key: sizedBoxKey,
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
                              color: widget.classificationColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          height: 24.0,
                          width: 120.0,
                          child: Center(
                            child: Text(
                              widget.classification,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        widget.childWidget
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
      ),
    );
  }
}
