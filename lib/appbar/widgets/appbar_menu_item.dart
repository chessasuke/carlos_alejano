import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:flutter/material.dart';

class AppBarMenuItem extends StatefulWidget {
  const AppBarMenuItem({
    Key? key,
    required this.text,
    this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  AppBarMenuItemState createState() => AppBarMenuItemState();
}

class AppBarMenuItemState extends State<AppBarMenuItem> {
  double menuWidth = 0;

  @override
  Widget build(BuildContext context) {
    Size size = (TextPainter(
      text: TextSpan(text: widget.text),
      maxLines: 1,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout())
        .size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          MouseRegion(
            onEnter: (onEnter) => setState(() => menuWidth = size.width),
            onExit: (onExit) => setState(() => menuWidth = 0),
            child: 
            InkWell(
              hoverColor: Colors.transparent,
              onTap: widget.onTap,
              child: Text(
                widget.text,
                style: TextStyles.heading03,
                ),
              ),
            ),
          AnimatedContainer(
            curve: Curves.easeOut,
            color: Colors.black,
            height: 2,
            width: widget.isSelected ? size.width : menuWidth,
            duration: const Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }
}
