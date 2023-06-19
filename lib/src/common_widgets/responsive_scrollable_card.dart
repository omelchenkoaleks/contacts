import 'package:flutter/material.dart';

import 'package:contacts/src/common_widgets/responsive_center.dart';
import 'package:contacts/src/constants/app_sizes.dart';
import 'package:contacts/src/constants/breakpoints.dart';

class ResponsiveScrollableCard extends StatelessWidget {
  const ResponsiveScrollableCard({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
