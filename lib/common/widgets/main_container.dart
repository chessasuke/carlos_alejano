import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    required this.child,
    this.color,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: color ?? Colors.transparent,
        constraints: const BoxConstraints(maxWidth: 900),
        padding: DisplayProperties.defaultPagePadding,
        child: child,
      ),
    );
  }
}
