import 'package:flutter/material.dart';

import '../../components/my_components.dart';
import '../../components/my_theme_styles.dart';
import '../../components/responsive_viewer.dart';
import '../../models/portfolio_menu_model.dart';
import '../my_home_page.dart';

class QualificationWidgetPage extends StatefulWidget {
  const QualificationWidgetPage({super.key});

  @override
  State<QualificationWidgetPage> createState() =>
      _QualificationWidgetPageState();
}

class _QualificationWidgetPageState extends State<QualificationWidgetPage> {
  bool isEducationButton = true;
  List<int> index1 = [0, 1, 2], index2 = [3, 4, 5];
  List<Education> education = [];
  List<Experience> experience = [];
  ScrollController scrollMainController = ScrollController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    education.clear();
    experience.clear();
    education.addAll(portfolioDatum!.education);
    experience.addAll(portfolioDatum!.experience);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: ResponsiveViewer(
              desktopView: Column(children: [
                headerWidget(title: 'Skills', subtitle: 'My Technical Skills'),
                spaceWidget(sizeLength: 1, verticalSpace: false),
                horizontalSkillsWidget(),
                spaceWidget(sizeLength: 2, verticalSpace: false),
                headerWidget(title: 'Qualification', subtitle: 'My journey'),
                spaceWidget(sizeLength: 1, verticalSpace: false),
                textButtonWidget(),
                isEducationButton
                    ? qualificationListWidget(
                        listDatum: education,
                        stepperLength: sizeOfContext(context).height * 0.18)
                    : experienceListWidget(
                        listDatum: experience,
                        stepperLength: sizeOfContext(context).height * 0.14),
                spaceWidget(sizeLength: 2, verticalSpace: false),
              ]),
              tabletView: Column(children: [
                headerWidget(title: 'Skills', subtitle: 'My Technical Skills'),
                spaceWidget(sizeLength: 1, verticalSpace: false),
                horizontalSkillsWidget(),
                spaceWidget(sizeLength: 2, verticalSpace: false),
                headerWidget(title: 'Qualification', subtitle: 'My journey'),
                spaceWidget(sizeLength: 1, verticalSpace: false),
                textButtonWidget(),
                isEducationButton
                    ? qualificationListWidget(
                        listDatum: education,
                        stepperLength: sizeOfContext(context).height * 0.22)
                    : experienceListWidget(
                        listDatum: experience,
                        stepperLength: sizeOfContext(context).height * 0.18),
                spaceWidget(sizeLength: 2, verticalSpace: false),
              ]),
              mobileView: Column(children: [
                headerWidget(title: 'Skills', subtitle: 'My Technical Skills'),
                spaceWidget(sizeLength: 1, verticalSpace: false),
                horizontalSkillsWidget(),
                spaceWidget(sizeLength: 2, verticalSpace: false),
                headerWidget(title: 'Qualification', subtitle: 'My journey'),
                spaceWidget(sizeLength: 1, verticalSpace: false),
                textButtonWidget(),
                isEducationButton
                    ? qualificationListWidget(
                        listDatum: education,
                        stepperLength: sizeOfContext(context).height * 0.28)
                    : experienceListWidget(
                        listDatum: experience,
                        stepperLength: sizeOfContext(context).height * 0.20),
                spaceWidget(sizeLength: 2, verticalSpace: false),
              ])),
        ),
      ),
    );
  }

  Widget headerWidget({required String title, required String subtitle}) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title, style: MyThemeStyles.headingBoldTextStyle(HType.h7)),
      Text(subtitle,
          style: MyThemeStyles.subTitleMediumTextStyle(textColor: kGreyColor)),
    ]);
  }

  Widget horizontalSkillsWidget() {
    return Scrollbar(
      controller: scrollController,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              index1.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      backgroundColor: kPrimaryColor,
                      disabledBackgroundColor: kPrimaryColor,
                      fixedSize: const Size(
                          kToolbarHeight + 124.0, kToolbarHeight - 16.0)),
                  child: Text(
                    portfolioDatum!.technicalSkills[index1[index]],
                    style: MyThemeStyles.subTitleMediumTextStyle(
                        textColor: kWhiteColor),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              index2.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      backgroundColor: kPrimaryColor,
                      disabledBackgroundColor: kPrimaryColor,
                      fixedSize: const Size(
                          kToolbarHeight + 124.0, kToolbarHeight - 16.0)),
                  child: Text(
                    portfolioDatum!.technicalSkills[index2[index]],
                    style: MyThemeStyles.subTitleMediumTextStyle(
                        textColor: kWhiteColor),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget textButtonWidget() {
    return Wrap(children: [
      buttonWidget(
          iconData: Icons.school_rounded,
          titleHeader: 'Education',
          color: isEducationButton ? kPrimaryColor : kSecondaryColor,
          onPressed: () {
            isEducationButton = true;
            setState(() {});
          }),
      const SizedBox(width: kToolbarHeight - 46.0),
      buttonWidget(
          iconData: Icons.work_rounded,
          titleHeader: 'Work',
          color: !isEducationButton ? kPrimaryColor : kSecondaryColor,
          onPressed: () {
            isEducationButton = false;
            setState(() {});
          }),
    ]);
  }

  Widget buttonWidget(
      {required IconData iconData,
      required String titleHeader,
      required Color? color,
      required void Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          fixedSize: const Size(kToolbarHeight + 84.0, kToolbarHeight - 16.0)),
      child: FittedBox(
        child: Row(children: [
          Icon(iconData, color: color),
          const SizedBox(width: kToolbarHeight - 46.0),
          Text(
            titleHeader,
            style: MyThemeStyles.titleSemiTextStyle(textColor: color),
          ),
        ]),
      ),
    );
  }

  Widget qualificationListWidget(
      {required List<Education> listDatum,
      required double stepperLength,
      bool isMobileView = false}) {
    return ListView.builder(
      itemCount: listDatum.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      itemBuilder: (context, index) => listViewWidget(
          title: listDatum[index].collegeName,
          subTitle: listDatum[index].degree,
          subTitle1: listDatum[index].course,
          durationPeriod: '${listDatum[index].startYear} '
              '-'
              ' ${listDatum[index].endYear}',
          stepperLength: stepperLength,
          currentIndex: index,
          currentLength: listDatum.length,
          isMobileView: isMobileView),
    );
  }

  Widget experienceListWidget(
      {required List<Experience> listDatum,
      required double stepperLength,
      bool isMobileView = false}) {
    return ListView.builder(
      itemCount: listDatum.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      itemBuilder: (context, index) => listViewWidget(
          title: listDatum[index].companyName,
          subTitle: listDatum[index].position,
          durationPeriod: '${listDatum[index].startYear} '
              '-'
              ' ${listDatum[index].endYear}',
          stepperLength: stepperLength,
          currentIndex: index,
          currentLength: listDatum.length,
          isMobileView: isMobileView),
    );
  }

  Widget listViewWidget(
      {required String title,
      required String subTitle,
      String subTitle1 = '',
      String durationPeriod = '',
      required double stepperLength,
      int? currentIndex,
      int? currentLength,
      bool isMobileView = false}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      if (!isMobileView)
        currentIndex!.isEven
            ? Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ResponsiveTexter(
                        text: title,
                        textAlign: TextAlign.end,
                        textStyle: MyThemeStyles.titleBoldTextStyle(),
                      ),
                      ResponsiveTexter(
                        text: subTitle,
                        textAlign: TextAlign.end,
                        textStyle: MyThemeStyles.titleMediumTextStyle(),
                      ),
                      if (subTitle1.isNotEmpty)
                        ResponsiveTexter(
                          text: subTitle1,
                          textAlign: TextAlign.end,
                          textStyle: MyThemeStyles.subTitleMediumTextStyle(),
                        ),
                      if (durationPeriod.isNotEmpty)
                        ResponsiveTexter(
                          text: durationPeriod,
                          textAlign: TextAlign.end,
                          textStyle: MyThemeStyles.subTitleSemiTextStyle(
                              textColor: kSecondaryColor),
                        ),
                    ]),
              )
            : const Spacer(),
      SizedBox(
        width: kToolbarHeight - 16.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.circle_rounded, color: kPrimaryColor),
              RotatedBox(
                quarterTurns: 1,
                child: SizedBox(
                  width: stepperLength,
                  child: const Divider(color: kPrimaryColor),
                ),
              ),
            ]),
      ),
      currentIndex!.isOdd || isMobileView
          ? Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveTexter(
                      text: title,
                      textAlign: TextAlign.start,
                      textStyle: MyThemeStyles.titleBoldTextStyle(),
                    ),
                    ResponsiveTexter(
                      text: subTitle,
                      textAlign: TextAlign.start,
                      textStyle: MyThemeStyles.titleMediumTextStyle(),
                    ),
                    if (subTitle1.isNotEmpty)
                      ResponsiveTexter(
                        text: subTitle1,
                        textAlign: TextAlign.start,
                        textStyle: MyThemeStyles.subTitleMediumTextStyle(),
                      ),
                    if (durationPeriod.isNotEmpty)
                      ResponsiveTexter(
                        text: durationPeriod,
                        textAlign: TextAlign.start,
                        textStyle: MyThemeStyles.subTitleSemiTextStyle(
                            textColor: kSecondaryColor),
                      ),
                  ]),
            )
          : const Spacer(),
    ]);
  }
}
