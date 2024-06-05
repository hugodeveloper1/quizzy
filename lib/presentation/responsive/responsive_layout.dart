import 'package:flutter/material.dart';

enum ResponsiveStatus {
  mobile,
  desktop,
  web;

  static ResponsiveStatus status(BuildContext context) {
    final size = MediaQuery.of(context).size;
    switch (size.width) {
      case > 1200:
        return web;

      case > 600:
        return desktop;

      default:
        return mobile;
    }
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.mobile,
    this.desktop,
    this.web,
  });

  final Widget? mobile;
  final Widget? desktop;
  final Widget? web;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Widget? targetWidget;
        ResponsiveStatus status = ResponsiveStatus.status(context);

        switch (status) {
          case ResponsiveStatus.web:
            targetWidget = web;

            break;
          case ResponsiveStatus.desktop:
            targetWidget = desktop;
            break;

          case ResponsiveStatus.mobile:
            targetWidget = mobile;
            break;
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: targetWidget ?? Container(),
        );
      },
    );
  }
}
