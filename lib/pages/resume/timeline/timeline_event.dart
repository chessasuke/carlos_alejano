import 'package:flutter/material.dart';

class TimelineEvent {
TimelineEvent({
  required this.title,
  required this.description,
  required this.dateTime,
  required this.icon,
});

  final String title;
  final String description;
  final DateTime dateTime;
  final IconData icon;
}
