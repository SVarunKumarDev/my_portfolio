import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../components/my_components.dart';
import '../../components/my_theme_styles.dart';
import '../../components/responsive_viewer.dart';
import '../../controllers/portfolio_controller.dart';
import '../my_home_page.dart';

class FooterWidgetPage extends StatefulWidget {
  const FooterWidgetPage({super.key});

  @override
  State<FooterWidgetPage> createState() => _FooterWidgetPageState();
}

class _FooterWidgetPageState extends State<FooterWidgetPage> {
  TextEditingController fullNameController = TextEditingController(),
      emailAddressController = TextEditingController(),
      subjectController = TextEditingController(),
      messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: ResponsiveViewer(
            edgeInsetsZero: true,
            desktopView: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerWidget(),
                  Padding(
                    padding: desktopPaddingMargin(),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          leftRowChild(
                              listTileWidth:
                                  sizeOfContext(context).width * 0.28),
                          rightRowChild(
                              listTileWidth:
                                  sizeOfContext(context).width * 0.28),
                        ]),
                  ),
                  footerWidget(),
                ]),
            tabletView: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerWidget(),
                  Padding(
                    padding: tabletPaddingMargin(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          leftRowChild(
                              listTileWidth: sizeOfContext(context).width),
                          rightRowChild(
                              listTileWidth:
                                  sizeOfContext(context).width * 0.58),
                        ]),
                  ),
                  footerWidget(),
                ]),
            mobileView: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerWidget(),
                  Padding(
                    padding: mobilePaddingMargin(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          leftRowChild(
                              listTileWidth: sizeOfContext(context).width),
                          rightRowChild(
                              listTileWidth: sizeOfContext(context).width),
                        ]),
                  ),
                  footerWidget(),
                ]),
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Contact Me', style: MyThemeStyles.headingBoldTextStyle(HType.h7)),
      Text('Get in touch',
          style: MyThemeStyles.subTitleMediumTextStyle(textColor: kGreyColor)),
    ]);
  }

  leftRowChild({required double listTileWidth}) {
    return SizedBox(
      width: listTileWidth,
      child: Column(children: [
        ResponsiveTexter(
            text: 'Thank you for visiting my portfolio site. I am '
                'always available to collaborate with anyone project and happy '
                'to share my thoughts. Feel free to get in touch with me, via',
            textStyle: MyThemeStyles.titleMediumTextStyle()),
        spaceWidget(sizeLength: 2, verticalSpace: false),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => PortfolioController.toSendMailer(
              mailAddress: portfolioDatum!.emailAddress),
          leading: const FaIcon(FontAwesomeIcons.envelope),
          title: ResponsiveTexter(
            text: 'Email',
            textStyle: MyThemeStyles.headingMediumTextStyle(HType.h7),
          ),
          subtitle: ResponsiveTexter(
            text: portfolioDatum!.emailAddress,
            textStyle: MyThemeStyles.titleMediumTextStyle(),
          ),
        ),
        spaceWidget(sizeLength: 2, verticalSpace: false),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => PortfolioController.openUrlLauncher(
              siteUri: portfolioDatum!.link1),
          leading: const FaIcon(FontAwesomeIcons.github),
          title: ResponsiveTexter(
            text: 'Github',
            textStyle: MyThemeStyles.headingMediumTextStyle(HType.h7),
          ),
          subtitle: ResponsiveTexter(
            text: portfolioDatum!.linkedinProfile,
            textStyle: MyThemeStyles.titleMediumTextStyle(),
          ),
        ),
        spaceWidget(sizeLength: 2, verticalSpace: false),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => PortfolioController.openUrlLauncher(
              siteUri: portfolioDatum!.link2),
          leading: const FaIcon(FontAwesomeIcons.linkedin),
          title: ResponsiveTexter(
            text: 'LinkedIn',
            textStyle: MyThemeStyles.headingMediumTextStyle(HType.h7),
          ),
          subtitle: ResponsiveTexter(
            text: portfolioDatum!.linkedinProfile,
            textStyle: MyThemeStyles.titleMediumTextStyle(),
          ),
        ),
      ]),
    );
  }

  rightRowChild({required double listTileWidth}) {
    return SizedBox(
      width: listTileWidth,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Message me', style: MyThemeStyles.titleSemiTextStyle()),
        ),
        textFormWidget(
            controller: fullNameController,
            prefixIcon: Icons.person_rounded,
            keyboardType: TextInputType.name,
            labelText: 'Full name'),
        textFormWidget(
            controller: emailAddressController,
            prefixIcon: Icons.email_rounded,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email'),
        textFormWidget(
            controller: subjectController,
            prefixIcon: Icons.subject_rounded,
            keyboardType: TextInputType.text,
            labelText: 'Subject'),
        textFormWidget(
            controller: messageController,
            prefixIcon: Icons.message_rounded,
            prefixIconRequired: false,
            keyboardType: TextInputType.text,
            maxLines: 2,
            labelText: 'Message'),
        ElevatedButton(
          onPressed: () {
            if (emailAddressController.text.isEmpty) {
              toastMessenger(message: 'Enter your email address!');
              return;
            }
            if (!isValidateEmail(emailAddressController.text)) {
              toastMessenger(message: 'Enter valid email address!');
              return;
            }
            if (messageController.text.isEmpty) {
              toastMessenger(message: 'Share your thoughts!');
              return;
            }
            FirebaseFirestore.instance.collection(collectionPath).add({
              'name': fullNameController.text,
              'email': emailAddressController.text,
              'subject': subjectController.text,
              'content': messageController.text,
            }).whenComplete(() => clearFeildData());
          },
          style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              backgroundColor: kPrimaryColor,
              fixedSize:
                  const Size(kToolbarHeight + 124.0, kToolbarHeight - 16.0)),
          child: FittedBox(
            child: Text(
              'Send Message',
              style:
                  MyThemeStyles.subTitleMediumTextStyle(textColor: kWhiteColor),
            ),
          ),
        ),
      ]),
    );
  }

  textFormWidget(
      {required TextEditingController? controller,
      int? maxLines = 1,
      TextInputType? keyboardType,
      required IconData? prefixIcon,
      bool? prefixIconRequired = true,
      String? labelText = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        minLines: maxLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            prefixIcon: prefixIconRequired! ? Icon(prefixIcon) : null,
            border: const OutlineInputBorder(),
            labelText: labelText),
      ),
    );
  }

  Widget footerWidget() {
    return Container(
      width: sizeOfContext(context).width,
      height: kToolbarHeight,
      color: kPrimaryColor,
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'Developer By ',
            style: MyThemeStyles.titleMediumTextStyle(textColor: kWhiteColor),
            children: [
              const WidgetSpan(
                  child: Icon(Icons.favorite_rounded, color: kWhiteColor)),
              TextSpan(
                text: ' ${portfolioDatum!.fullName}',
                style: MyThemeStyles.titleSemiTextStyle(textColor: kWhiteColor),
              ),
            ]),
      ),
    );
  }

  clearFeildData() {
    fullNameController.clear();
    emailAddressController.clear();
    subjectController.clear();
    messageController.clear();
    toastMessenger(message: 'Thank you for your message, I`ll reach you asap.');
  }
}
