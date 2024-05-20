import 'package:flutter/material.dart';

import '../../components/my_components.dart';
import '../../components/my_theme_styles.dart';
import '../../components/responsive_viewer.dart';
import '../../controllers/portfolio_controller.dart';
import '../my_home_page.dart';

class AboutWidgetPage extends StatefulWidget {
  const AboutWidgetPage({super.key});

  @override
  State<AboutWidgetPage> createState() => _AboutWidgetPageState();
}

class _AboutWidgetPageState extends State<AboutWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewer(
      desktopView:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        headerWidget(),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: ResponsiveClipImage(
                image: MyComponents.aboutImage,
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Expanded(child: contentButton()),
        ]),
      ]),
      tabletView:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        headerWidget(),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        ResponsiveClipImage(
            image: MyComponents.aboutImage,
            borderRadius: BorderRadius.circular(10.0)),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        contentButton(),
      ]),
      mobileView:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        headerWidget(),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        ResponsiveClipImage(
            image: MyComponents.aboutImage,
            borderRadius: BorderRadius.circular(10.0)),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        contentButton(),
      ]),
    );
  }

  Widget headerWidget() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('About Me', style: MyThemeStyles.headingBoldTextStyle(HType.h7)),
      Text('My Introduction',
          style: MyThemeStyles.subTitleMediumTextStyle(textColor: kGreyColor)),
    ]);
  }

  contentButton() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: sizeOfContext(context).width,
        child: ResponsiveTexter(
            text: portfolioDatum!.summary,
            textStyle: isMobileView(context)
                ? MyThemeStyles.subTitleMediumTextStyle()
                : MyThemeStyles.titleMediumTextStyle()),
      ),
      spaceWidget(sizeLength: 1, verticalSpace: false),
      ElevatedButton(
        onPressed: () =>
            PortfolioController.openUrlLauncher(siteUri: portfolioDatum!.link3),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            backgroundColor: kPrimaryColor,
            fixedSize:
                const Size(kToolbarHeight + 124.0, kToolbarHeight - 16.0)),
        child: FittedBox(
          child: Row(children: [
            Text(
              'Download Resume',
              style:
                  MyThemeStyles.subTitleMediumTextStyle(textColor: kWhiteColor),
            ),
            const SizedBox(width: kToolbarHeight - 46.0),
            const Icon(Icons.download_rounded, color: kWhiteColor),
          ]),
        ),
      ),
    ]);
  }
}
