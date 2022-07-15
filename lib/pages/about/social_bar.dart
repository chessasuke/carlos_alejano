import 'package:carlos_alejano_v2/common/constants/till_remote_config_is_set.dart';
import 'package:carlos_alejano_v2/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialBar extends StatelessWidget {
  const SocialBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Utils.launchURL(TillRemoteConfigIsSet.linkedin),
          child: const Icon(FontAwesomeIcons.linkedin),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => Utils.launchURL(TillRemoteConfigIsSet.github),
          child: const Icon(FontAwesomeIcons.github),
        ),
      ],
    );
  }
}
