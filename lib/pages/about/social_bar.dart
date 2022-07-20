import 'package:carlos_alejano_v2/common/constants/till_remote_config_is_set.dart';
import 'package:carlos_alejano_v2/services/analytics/events/actions_events.dart';
import 'package:carlos_alejano_v2/services/analytics/models/event.dart';
import 'package:carlos_alejano_v2/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialBar extends ConsumerWidget {
  const SocialBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _onTapLinkedIn(ref),
          child: const Icon(FontAwesomeIcons.linkedin),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => _onTapGithub(ref),
          child: const Icon(FontAwesomeIcons.github),
        ),
      ],
    );
  }

  void _onTapGithub(WidgetRef ref) {
    Utils.trackEvent(
        event: Event(name: ActionsEvents.clickedGithubLink.name), ref: ref);
    Utils.launchURL(TillRemoteConfigIsSet.github);
  }

  void _onTapLinkedIn(WidgetRef ref) {
    Utils.trackEvent(
        event: Event(name: ActionsEvents.clickedLinkedInLink.name), ref: ref);
    Utils.launchURL(TillRemoteConfigIsSet.linkedin);
  }
}
