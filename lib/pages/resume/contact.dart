import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text(
            'Contact',
            style: TextStyles.heading02,
          ),
        ),
      ],
    );
  }
}
