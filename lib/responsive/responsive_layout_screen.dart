import 'package:flutter/material.dart';


class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayoutScreen({Key? key,required this.webScreenLayout,required this.mobileScreenLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (constraints.maxWidth > 600){
          return webScreenLayout;
        } 
        return mobileScreenLayout;
      },
    );
  }
}