import 'package:flutter/material.dart';

import '../../components/my_components.dart';
import '../../components/my_theme_styles.dart';
import '../../components/responsive_viewer.dart';
import '../my_home_page.dart';

class IntroWidgetPage extends StatefulWidget {
  const IntroWidgetPage({super.key});

  @override
  State<IntroWidgetPage> createState() => _IntroWidgetPageState();
}

class _IntroWidgetPageState extends State<IntroWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveViewer(
      desktopView: Row(children: [
        ResponsiveClipImage(
            image: MyComponents.introImage,
            borderRadius: BorderRadius.circular(10.0)),
        spaceWidget(sizeLength: 4),
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            professionNameWidget(htype: HType.h1),
            spaceWidget(sizeLength: 2, verticalSpace: false),
            contentButton(htype: HType.h6),
          ]),
        ),
      ]),
      tabletView:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        professionNameWidget(htype: HType.h4),
        spaceWidget(sizeLength: 2, verticalSpace: false),
        ResponsiveClipImage(
            image: MyComponents.introImage,
            borderRadius: BorderRadius.circular(10.0)),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        contentButton(htype: HType.h6),
      ]),
      mobileView:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        professionNameWidget(htype: HType.h6),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        ResponsiveClipImage(
            image: MyComponents.introImage,
            borderRadius: BorderRadius.circular(10.0)),
        spaceWidget(sizeLength: 1, verticalSpace: false),
        contentButton(htype: HType.h6),
      ]),
    );
  }

  clipImageWidget({required double imageWidth, imageHeight}) {
    return ResponsiveClipImage(
      image: MyComponents.introImage,
      imageWidth: imageWidth,
      imageHeight: imageHeight,
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  Widget professionNameWidget({required HType htype}) {
    return Column(children: [
      SizedBox(
        width: sizeOfContext(context).width,
        child: Text(
          'Hi, I am ${portfolioDatum!.fullName}',
          style: MyThemeStyles.headingBoldTextStyle(htype),
        ),
      ),
      SizedBox(
        width: sizeOfContext(context).width,
        child: Text(
          portfolioDatum!.profession,
          style: MyThemeStyles.titleBoldTextStyle(textColor: kPrimaryColor),
        ),
      ),
    ]);
  }

  contentButton({required HType htype}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: sizeOfContext(context).width,
        child: ResponsiveTexter(
            text: portfolioDatum!.shortDescription,
            textStyle: MyThemeStyles.headingMediumTextStyle(htype)),
      ),
      spaceWidget(
          sizeLength: isMobileView(context) ? 1 : 2, verticalSpace: false),
      ElevatedButton(
        onPressed: () => pageController.animateToPage(4,
            duration: Durations.medium2, curve: Curves.bounceInOut),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            backgroundColor: kPrimaryColor,
            fixedSize:
                const Size(kToolbarHeight + 124.0, kToolbarHeight - 16.0)),
        child: FittedBox(
          child: Row(children: [
            Text(
              'Contact Me',
              style:
                  MyThemeStyles.subTitleMediumTextStyle(textColor: kWhiteColor),
            ),
            const SizedBox(width: kToolbarHeight - 46.0),
            const Icon(Icons.mail_outline_rounded, color: kWhiteColor),
          ]),
        ),
      ),
    ]);
  }
}
