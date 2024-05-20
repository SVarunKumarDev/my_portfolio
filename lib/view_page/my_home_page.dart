import 'package:flutter/material.dart';

import '../components/my_components.dart';
import '../components/my_theme_styles.dart';
import '../components/responsive_viewer.dart';
import '../controllers/portfolio_controller.dart';
import '../controllers/shared_theme_provider.dart';
import '../models/portfolio_menu_model.dart';
import 'body_page/about_page.dart';
import 'body_page/into_page.dart';
import 'body_page/project_page.dart';
import 'body_page/qualification_page.dart';
import 'header_footer_page/footer_page.dart';
import 'header_footer_page/header_page.dart';

List<MenuItemsModel> menuItemsList = [
  MenuItemsModel(iconDatum: Icons.home_rounded, titleHeader: 'Home'),
  MenuItemsModel(iconDatum: Icons.person_rounded, titleHeader: 'About'),
  MenuItemsModel(iconDatum: Icons.article_rounded, titleHeader: 'Skills'),
  MenuItemsModel(
      iconDatum: Icons.wb_incandescent_rounded, titleHeader: 'Projects'),
  MenuItemsModel(iconDatum: Icons.mode_comment_rounded, titleHeader: 'Contact'),
  MenuItemsModel(iconDatum: Icons.mood_rounded, titleHeader: 'Icons'),
];
int selectedIndex = 0;
PortfolioDatum? portfolioDatum;
PageController pageController = PageController();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    PortfolioController.getPortfolioData()
        .then((value) => setState(() => portfolioDatum = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        HeaderWidgetPage(
          onPressed: (selectedIndex) => pageController.animateToPage(
              selectedIndex,
              duration: Durations.medium2,
              curve: Curves.bounceInOut),
        ),
        Expanded(
          child: PageView(
              scrollDirection: Axis.vertical,
              controller: pageController,
              scrollBehavior: const MaterialScrollBehavior(),
              onPageChanged: (value) => setState(() {
                    selectedIndex = value;
                  }),
              children: const [
                IntroWidgetPage(),
                AboutWidgetPage(),
                QualificationWidgetPage(),
                ProjectWidgetPage(),
                FooterWidgetPage(),
              ]),
        ),
      ]),
      bottomNavigationBar: isDesktopView(context)
          ? null
          : ListTile(
              title: ResponsiveTexter(
                text: portfolioDatum!.fullName,
                textStyle: MyThemeStyles.headingMediumTextStyle(HType.h6),
              ),
              trailing: IconButton(
                  onPressed: () => showsBottomSheet(context),
                  icon: Icon(Icons.menu_rounded,
                      color: SharedPreference.isDarkThemeMode
                          ? kBlackColor
                          : kPrimaryColor)),
            ),
      floatingActionButton: selectedIndex == 0
          ? null
          : Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: FloatingActionButton(
                mini: true,
                onPressed: () => pageController.animateToPage(0,
                    duration: Durations.medium2, curve: Curves.bounceInOut),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child:
                    const Icon(Icons.arrow_upward_rounded, color: kWhiteColor),
              ),
            ),
    );
  }

  showsBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => ListView.builder(
        itemCount: menuItemsList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemBuilder: (context, index) => menuItemsList.length == index + 1
            ? const SizedBox.shrink()
            : ListTile(
                onTap: () {
                  selectedIndex = index;
                  pageController.animateToPage(selectedIndex,
                      duration: Durations.medium2, curve: Curves.bounceInOut);
                  setState(() {});
                  Navigator.pop(context);
                },
                leading: Icon(menuItemsList[index].iconDatum),
                title: Text(
                  menuItemsList[index].titleHeader,
                  style: MyThemeStyles.titleSemiTextStyle(
                    textColor: selectedIndex == index
                        ? kPrimaryColor
                        : SharedPreference.isDarkThemeMode
                            ? kBlackColor
                            : kWhiteColor,
                  ),
                ),
              ),
      ),
    );
  }
}
