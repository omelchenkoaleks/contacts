import 'package:flutter/material.dart';

import 'package:contacts/src/constants/breakpoints.dart';
import 'package:contacts/src/localiation/string_hardcoded.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < Breakpoint.tablet) {
      return AppBar(
        title: Text('Contacts'.hardcoded),
        actions: const [],
      );
    } else {
      return AppBar(
        title: Text('Contacts'.hardcoded),
        actions: const [],
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
