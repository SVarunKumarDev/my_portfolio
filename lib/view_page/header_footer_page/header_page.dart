import 'package:flutter/material.dart';
import 'package:myportfolio/components/my_components.dart';
import 'package:provider/provider.dart';

import '../../components/my_theme_styles.dart';
import '../../components/responsive_viewer.dart';
import '../../controllers/shared_theme_provider.dart';
import '../my_home_page.dart';

class HeaderWidgetPage extends StatefulWidget {
  const HeaderWidgetPage({super.key, this.onPressed});

  final void Function(int)? onPressed;

  @override
  State<HeaderWidgetPage> createState() => _HeaderWidgetPageState();
}

class _HeaderWidgetPageState extends State<HeaderWidgetPage> {
  @override
  Widget build(BuildContext context) {
    SharedThemeProvider themeProvider =
        Provider.of<SharedThemeProvider>(context);
    return ResponsiveViewer(
      desktopView: childernWidget(children: [
        clipImageWidget(imageAspectRatio: kToolbarHeight),
        Row(children: actionsWidget(themeProvider: themeProvider)),
      ]),
      tabletView: childernWidget(children: [
        clipImageWidget(imageAspectRatio: kToolbarHeight - 6.0),
        iconButtonWidget(themeProvider: themeProvider),
      ]),
      mobileView: childernWidget(children: [
        clipImageWidget(imageAspectRatio: kToolbarHeight - 6.0),
        iconButtonWidget(themeProvider: themeProvider),
      ]),
    );
  }

  childernWidget({List<Widget> children = const <Widget>[]}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: children);
  }

  Widget clipImageWidget({required double imageAspectRatio}) {
    return ResponsiveClipImage(
        image: MyComponents.appImageLogo,
        imageWidth: imageAspectRatio,
        imageHeight: imageAspectRatio,
        borderRadius: BorderRadius.circular(40.0));
  }

  List<Widget> actionsWidget(
      {required SharedThemeProvider themeProvider,
      EdgeInsetsGeometry? actionPadding}) {
    return List.generate(
      menuItemsList.length,
      (index) => index == (menuItemsList.length - 1)
          ? iconButtonWidget(themeProvider: themeProvider)
          : TextButton(
              onPressed: () {
                selectedIndex = index;
                widget.onPressed!.call(selectedIndex);
              },
              style: TextButton.styleFrom(
                  padding: actionPadding ??
                      const EdgeInsets.symmetric(horizontal: 14.0)),
              child: Text(
                menuItemsList[index].titleHeader,
                style: MyThemeStyles.titleMediumTextStyle(
                    textColor: selectedIndex == index
                        ? kPrimaryColor
                        : SharedPreference.isDarkThemeMode
                            ? kBlackColor
                            : kWhiteColor),
              ),
            ),
    );
  }

  Widget iconButtonWidget({required SharedThemeProvider? themeProvider}) {
    return IconButton(
      onPressed: () =>
          themeProvider!.setDarkThemeMode = !SharedPreference.isDarkThemeMode,
      icon: Icon(
          SharedPreference.isDarkThemeMode
              ? Icons.dark_mode_rounded
              : Icons.wb_sunny_rounded,
          color:
              SharedPreference.isDarkThemeMode ? kBlackColor : kPrimaryColor),
    );
  }
}
