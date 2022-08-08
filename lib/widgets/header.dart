import 'package:coffee_app_ui/screen/home_screen.dart';
import 'package:coffee_app_ui/screen/mainScreen.dart';
import 'package:coffee_app_ui/widgets/contentView.dart';
import 'package:coffee_app_ui/widgets/customTab.dart';
import 'package:coffee_app_ui/widgets/custom_tabbar.dart';
import 'package:coffee_app_ui/widgets/customtabbarr.dart';
import 'package:coffee_app_ui/widgets/footer.dart';
import 'package:coffee_app_ui/widgets/mainCategories.dart';
import 'package:coffee_app_ui/widgets/tabControllerHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  TabController? tabController;
  ItemScrollController? itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  double? screenHeight;
  double? screenWidth;
  double? topPadding;
  // double? bottomPadding;
  double? sidePadding;

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Home'),
      content: MainCategories(),
    ),
    ContentView(
      tab: CustomTab(title: 'About'),
      content: Container(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight! * 0.05;
    // bottomPadding = screenHeight! * 0.03;
    sidePadding = screenWidth! * 0.05;

    return Padding(
        padding: EdgeInsets.only(top: topPadding!), child: desktopView());
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// Tab Bar
        Container(
          height: screenHeight! * 0.05,
          child: CustomTabBarr(
              controller: tabController!,
              tabs: contentViews.map((e) => e.tab).toList()),
        ),

        /// Tab Bar View
        Container(
          height: screenHeight!,
          child: TabControllerHandler(
            tabController: tabController!,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
