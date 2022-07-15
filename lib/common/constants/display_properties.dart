import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DisplayProperties {
  /// AppBar
  static const double kAppBarSize = 75;

  /// Deafult Main Content Padding
  static const double mainHorizontalPadding = 20.0;
  static const double mainBottomPadding = 48.0;
  static const double mainTopPadding = 24.0;

  /// Progress Indicator Widget
  static const double stepProgressIndicatorHeight = 2.0;
  static const double stepProgressIndicatorRadius = 2.0;

  static final EdgeInsetsGeometry defaultPagePadding =
      const EdgeInsets.symmetric(horizontal: mainHorizontalPadding)
          .add(const EdgeInsets.only(
    top: mainTopPadding,
    bottom: mainBottomPadding,
  ));

  /// Timeline
  static const defaultIndicatorStyle = IndicatorStyle(
    padding: EdgeInsets.symmetric(horizontal: 8),
    width: 40,
    color: AppColors.primary100,
  );
}
