import 'package:flutter/material.dart';

import '../../components/my_components.dart';
import '../../components/my_theme_styles.dart';
import '../../components/responsive_viewer.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_menu_model.dart';
import '../my_home_page.dart';

class ProjectWidgetPage extends StatefulWidget {
  const ProjectWidgetPage({super.key});

  @override
  State<ProjectWidgetPage> createState() => _ProjectWidgetPageState();
}

class _ProjectWidgetPageState extends State<ProjectWidgetPage> {
  int selectedProjectIndex = 0;
  List<RecentProject> recentProjects = [];
  PageController projectController = PageController();

  @override
  void initState() {
    super.initState();
    recentProjects.clear();
    recentProjects.addAll(portfolioDatum!.recentProjects);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveViewer(
      desktopView:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        headerWidget(),
        spaceWidget(sizeLength: 2, verticalSpace: false),
        Container(
          width: sizeOfContext(context).width,
          height: kToolbarHeight + 184.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            navIconButton(navLeftButton: true),
            Expanded(
              child: PageView(
                  controller: projectController,
                  children: projectWrapWidget(
                      contentWidth: sizeOfContext(context).width * 0.38,
                      contentHeight: kToolbarHeight + 184.0)),
            ),
            navIconButton(navLeftButton: false),
          ]),
        )
      ]),
      tabletView: Column(children: [
        headerWidget(),
        spaceWidget(sizeLength: 2, verticalSpace: false),
        Expanded(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
                shrinkWrap: true,
                children: projectWrapWidget(
                    contentWidth: sizeOfContext(context).width < 572.0
                        ? sizeOfContext(context).width
                        : sizeOfContext(context).width * 0.58)),
          ),
        ),
        spaceWidget(sizeLength: 2, verticalSpace: false),
      ]),
      mobileView:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        headerWidget(),
        spaceWidget(sizeLength: 2, verticalSpace: false),
        Expanded(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
                shrinkWrap: true,
                children: projectWrapWidget(
                    contentWidth: sizeOfContext(context).width)),
          ),
        ),
        spaceWidget(sizeLength: 2, verticalSpace: false),
      ]),
    );
  }

  Widget headerWidget() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Projects', style: MyThemeStyles.headingBoldTextStyle(HType.h7)),
      Text('Most recent work',
          style: MyThemeStyles.subTitleMediumTextStyle(textColor: kGreyColor)),
    ]);
  }

  Widget navIconButton({required bool navLeftButton}) {
    return IconButton(
      onPressed: () {
        if (navLeftButton) {
          selectedProjectIndex--;
          if (selectedProjectIndex == -1) {
            selectedProjectIndex = recentProjects.length - 1;
          }
        } else {
          selectedProjectIndex++;
          if (selectedProjectIndex >= recentProjects.length) {
            selectedProjectIndex = 0;
          }
        }
        projectController.animateToPage(selectedProjectIndex,
            duration: Durations.medium2, curve: Curves.bounceInOut);
        setState(() {});
      },
      icon: Icon(
          navLeftButton
              ? Icons.arrow_back_ios_rounded
              : Icons.arrow_forward_ios_rounded,
          size: 28.0),
    );
  }

  List<Widget> projectWrapWidget({double? contentWidth, contentHeight}) {
    return List.generate(
      recentProjects.length,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              ResponsiveClipImage(
                image: recentProjects[index].bannerImage,
                borderRadius: BorderRadius.circular(10.0),
                imageWidth: sizeOfContext(context).width < 572.0
                    ? sizeOfContext(context).width
                    : sizeOfContext(context).width * 0.28,
                imageHeight: contentHeight,
              ),
              Container(
                width: contentWidth,
                height: contentHeight,
                padding: EdgeInsets.only(
                    left: sizeOfContext(context).width < 572.0 ? 0.0 : 14.0,
                    top: 14.0,
                    right: 14.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResponsiveTexter(
                          text: recentProjects[index].projectName,
                          textStyle:
                              MyThemeStyles.headingMediumTextStyle(HType.h7)),
                      if (recentProjects[index].personalWork)
                        ResponsiveTexter(
                            text: 'Personal Work',
                            textStyle: MyThemeStyles.subTitleSemiTextStyle(
                                textColor: kOnSecondaryColor)),
                      spaceWidget(sizeLength: 1, verticalSpace: false),
                      ResponsiveTexter(
                          text: recentProjects[index].description,
                          textStyle: MyThemeStyles.titleMediumTextStyle()),
                      spaceWidget(sizeLength: 1, verticalSpace: false),
                      wrapButtonWidget(recentProject: recentProjects[index]),
                    ]),
              ),
            ]),
      ),
    );
  }

  Widget wrapButtonWidget({required RecentProject recentProject}) {
    return Wrap(runSpacing: 10.0, spacing: 10.0, children: [
      if (recentProject.projectLink1.isNotEmpty)
        buttonWidget(
            iconData: Icons.code_rounded,
            titleHeader: 'Source Code',
            onPressed: () => PortfolioController.openUrlLauncher(
                siteUri: recentProject.projectLink1)),
      if (recentProject.projectLink2.isNotEmpty)
        buttonWidget(
            iconData: Icons.developer_mode_rounded,
            titleHeader: 'Demo Link',
            onPressed: () => PortfolioController.openUrlLauncher(
                siteUri: recentProject.projectLink2)),
    ]);
  }

  Widget buttonWidget(
      {required IconData iconData,
      required String titleHeader,
      required void Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          fixedSize: const Size(kToolbarHeight + 84.0, kToolbarHeight - 16.0)),
      child: FittedBox(
        child: Row(children: [
          Icon(iconData, color: kWhiteColor),
          const SizedBox(width: kToolbarHeight - 46.0),
          Text(titleHeader,
              style: MyThemeStyles.titleSemiTextStyle(textColor: kWhiteColor)),
        ]),
      ),
    );
  }
}
