import 'package:flutter/material.dart';

import '../components/my_components.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Image(
          image: const AssetImage(MyComponents.errorImage),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height),
    );
  }
}
