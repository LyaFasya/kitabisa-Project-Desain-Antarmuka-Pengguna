import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget? tabletBody; // Tanda tanya (?) berarti opsional/boleh kosong
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody;
        } 
        else if (constraints.maxWidth < 1000) {
          return tabletBody ?? mobileBody; 
        } 
        else {
          return desktopBody;
        }
      },
    );
  }
}
