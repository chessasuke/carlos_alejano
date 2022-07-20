import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
import 'package:carlos_alejano_v2/common/constants/till_remote_config_is_set.dart';
import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:carlos_alejano_v2/generated/i18n.dart';
import 'package:carlos_alejano_v2/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ResumeTimeline extends StatelessWidget {
  const ResumeTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text(
            S.of(context).resumeExperienceTitle,
            style: TextStyles.heading02,
          ),
        ),
        _TimelineTile(
          isFirst: true,
          iconStyle: IconStyle(
            color: AppColors.secondary100,
            iconData: Icons.school,
          ),
          startChild: const _TimelineEventContainer(
            text: TillRemoteConfigIsSet.utrgv,
          ),
          endChild: const _EventDate(
            text: TillRemoteConfigIsSet.utrgvDate,
            textAlign: TextAlign.start,
          ),
        ),
        _TimelineTile(
          iconStyle: IconStyle(
            color: AppColors.secondary100,
            iconData: Icons.work,
          ),
          startChild: const _EventDate(
            text: TillRemoteConfigIsSet.utrgvInternPhyDate,
            textAlign: TextAlign.end,
          ),
          endChild: const _TimelineEventContainer(
              text: TillRemoteConfigIsSet.utrgvInternPhy),
        ),
        _TimelineTile(
          iconStyle: IconStyle(
            color: AppColors.secondary100,
            iconData: Icons.work,
          ),
          endChild: const _EventDate(
            text: TillRemoteConfigIsSet.utrgvInternChessDate,
            textAlign: TextAlign.start,
          ),
          startChild: const _TimelineEventContainer(
              text: TillRemoteConfigIsSet.utrgvInternChess),
        ),
        _TimelineTile(
          iconStyle: IconStyle(
            color: AppColors.secondary100,
            iconData: Icons.school,
          ),
          startChild: const _EventDate(
            text: TillRemoteConfigIsSet.utdDate,
            textAlign: TextAlign.end,
          ),
          endChild:
              const _TimelineEventContainer(text: TillRemoteConfigIsSet.utd),
        ),
        _TimelineTile(
          iconStyle: IconStyle(
            color: AppColors.secondary100,
            iconData: Icons.work,
          ),
          startChild: const _TimelineEventContainer(
              text: TillRemoteConfigIsSet.internGallagher),
          endChild: const _EventDate(
            text: TillRemoteConfigIsSet.internGallagherDate,
            textAlign: TextAlign.start,
          ),
        ),
        _TimelineTile(
          iconStyle: IconStyle(
            color: AppColors.secondary100,
            iconData: Icons.work,
          ),
          startChild: const _EventDate(
            text: TillRemoteConfigIsSet.psDate,
            textAlign: TextAlign.end,
          ),
          endChild: const _TimelineEventContainer(
            text: TillRemoteConfigIsSet.ps,
          ),
        ),
        _TimelineTile(
          isLast: true,
          iconStyle: IconStyle(
            color: AppColors.secondary100,
            iconData: Icons.work,
          ),
          endChild: const _EventDate(
            text: TillRemoteConfigIsSet.enzoDate,
            textAlign: TextAlign.start,
          ),
          startChild: const _TimelineEventContainer(
            text: TillRemoteConfigIsSet.enzo,
          ),
        ),
      ],
    );
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({
    // this.hasIndicator = false,
    this.isFirst = false,
    this.isLast = false,
    this.iconStyle,
    this.startChild,
    this.endChild,
    Key? key,
  }) : super(key: key);

  final bool isFirst;
  final bool isLast;

  // final bool hasIndicator;
  final IconStyle? iconStyle;
  final Widget? startChild;
  final Widget? endChild;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      hasIndicator: iconStyle != null,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: DisplayProperties.defaultIndicatorStyle.copyWith(
        iconStyle: iconStyle,
      ),
      beforeLineStyle: const LineStyle(color: AppColors.primary100),
      afterLineStyle: const LineStyle(color: AppColors.primary100),
      startChild: startChild,
      endChild: endChild,
    );
  }
}

class _TimelineEventContainer extends StatelessWidget {
  const _TimelineEventContainer({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.neutral200,
      elevation: 4,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 50,
          maxWidth: 200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyles.body01,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

class _EventDate extends StatelessWidget {
  const _EventDate({
    required this.text,
    required this.textAlign,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.subheading01.copyWith(fontWeight: FontWeight.bold),
      textAlign: textAlign,
    );
  }
}
