import 'package:flutter/material.dart';

bool isDesktopView(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= 801.0 &&
    MediaQuery.sizeOf(context).width < double.infinity;

bool isTabletView(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= 451.0 &&
    MediaQuery.sizeOf(context).width <= 800.0;

bool isMobileView(BuildContext context) =>
    MediaQuery.sizeOf(context).width <= 450.0;

EdgeInsetsGeometry desktopPaddingMargin({double vertical = 10.0}) =>
    EdgeInsets.symmetric(vertical: vertical, horizontal: 100.0);
EdgeInsetsGeometry tabletPaddingMargin({double vertical = 10.0}) =>
    EdgeInsets.symmetric(vertical: vertical, horizontal: 60.0);
EdgeInsetsGeometry mobilePaddingMargin({double vertical = 10.0}) =>
    EdgeInsets.symmetric(vertical: vertical, horizontal: 20.0);

Widget spaceWidget({required int sizeLength, bool? verticalSpace = true}) =>
    ListView(
        scrollDirection: verticalSpace! ? Axis.horizontal : Axis.vertical,
        shrinkWrap: true,
        children: List.generate(
            sizeLength,
            (index) => verticalSpace
                ? const SizedBox(width: 10.0)
                : const SizedBox(height: 10.0)));

class ResponsiveViewer extends StatefulWidget {
  const ResponsiveViewer(
      {super.key,
      required this.desktopView,
      required this.tabletView,
      required this.mobileView,
      this.edgeInsetsZero = false});

  final Widget desktopView, tabletView, mobileView;
  final bool? edgeInsetsZero;

  @override
  State<ResponsiveViewer> createState() => _ResponsiveViewerState();
}

class _ResponsiveViewerState extends State<ResponsiveViewer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Container(
        margin: responsiveMargin(context, constraints, 24.0),
        child: responsiveChild(context, constraints),
      ),
    );
  }

  responsiveMargin(
      BuildContext context, BoxConstraints constraints, double vertical) {
    if (widget.edgeInsetsZero!) {
      return EdgeInsets.zero;
    } else if (constraints.maxWidth >= 801.0 &&
        constraints.maxWidth < double.infinity) {
      return EdgeInsets.symmetric(vertical: vertical, horizontal: 80.0);
    } else if (constraints.maxWidth >= 451.0 && constraints.maxWidth <= 800.0) {
      return EdgeInsets.symmetric(vertical: vertical, horizontal: 40.0);
    } else {
      return EdgeInsets.symmetric(vertical: vertical, horizontal: 10.0);
    }
  }

  responsiveChild(BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth >= 801.0 &&
        constraints.maxWidth < double.infinity) {
      return widget.desktopView;
    } else if (constraints.maxWidth >= 451.0 && constraints.maxWidth <= 800.0) {
      return widget.tabletView;
    } else {
      return widget.mobileView;
    }
  }
}

class ResponsiveTexter extends StatefulWidget {
  const ResponsiveTexter(
      {super.key, required this.text, this.textAlign, this.textStyle});

  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  State<ResponsiveTexter> createState() => _ResponsiveTexterState();
}

class _ResponsiveTexterState extends State<ResponsiveTexter> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => Text(
          widget.text,
          textAlign: widget.textAlign,
          style: widget.textStyle,
          textScaler: responsiveView(context, constraints)),
    );
  }

  TextScaler responsiveView(BuildContext context, BoxConstraints constraints) {
    return MediaQuery.sizeOf(context).width <= 250.0
        ? const TextScaler.linear(0.68)
        : MediaQuery.textScalerOf(context);
  }
}

class ResponsiveClipImage extends StatefulWidget {
  const ResponsiveClipImage(
      {super.key,
      required this.image,
      this.imageWidth,
      this.imageHeight,
      this.boxFit = BoxFit.fill,
      this.borderRadius = BorderRadius.zero});

  final String image;
  final double? imageWidth, imageHeight;
  final BoxFit? boxFit;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<ResponsiveClipImage> createState() => _ResponsiveClipImageState();
}

class _ResponsiveClipImageState extends State<ResponsiveClipImage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: widget.borderRadius!,
      child: Image.asset(
        widget.image,
        fit: widget.boxFit,
        width: widget.imageWidth ??
            (isMobileView(context) ? size.width : size.width * 0.44),
        height: widget.imageHeight ??
            (isMobileView(context) ? size.width * 0.48 : size.width * 0.28),
      ),
    );
  }
}
