import 'package:flutter/material.dart';


class Responsivo extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  const Responsivo({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <
        800; //verifica tamanho de tela (celular)
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1200; // caso for um tablet
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200; //Desktop
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (constraints.maxWidth >= 800) {
        Widget? resTablet = this.tablet;
        if (resTablet != null) {
          return resTablet;
        }
        return this.mobile;
      } else {
        return mobile;
      }
    });
  }
}
