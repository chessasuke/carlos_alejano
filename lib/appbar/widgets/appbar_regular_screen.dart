import 'package:carlos_alejano_v2/appbar/widgets/appbar_row_items.dart';
import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
import 'package:flutter/material.dart';

class AppBarRegularScreen extends StatelessWidget {
  const AppBarRegularScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: DisplayProperties.kAppBarSize,
      elevation: 0.0,
      leadingWidth: 100,
      title: const AppBarRowItems(),
    );
  }
}
