import 'dart:core';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1)}";
    }
    return "";
  }

  String lastNChars(int n) {
    if (length < n) {
      return this;
    } else {
      return substring(length - n);
    }
  }
}

extension IndicatorStyleX on IndicatorStyle {
  IndicatorStyle copyWith({
  double? width,
  double? height,
  Widget? indicator,
  EdgeInsets? padding,
  Color? color,
  IconStyle? iconStyle,
  double? indicatorXY,
  bool? drawGap,  
  }) => IndicatorStyle(
  width: width ?? this.width,
  height: height ?? this.height,
  indicator: indicator ?? this.indicator,
  padding: padding ?? this.padding,
  color: color ?? this.color,
  iconStyle: iconStyle ?? this.iconStyle,
  indicatorXY: indicatorXY ?? this.indicatorXY,
  drawGap: drawGap ?? this.drawGap,   
  );
}
