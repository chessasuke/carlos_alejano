import 'package:carlos_alejano_v2/appbar/widgets/appbar_regular_screen.dart';
import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({required this.isSmallScreen, Key? key}) : super(key: key);

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    // if (isSmallScreen) {
    //   return const AppBarSmallScreen();
    // } else {
    //   return const AppBarRegularScreen();
    // }
    return const AppBarRegularScreen();
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(DisplayProperties.kAppBarSize);
}
