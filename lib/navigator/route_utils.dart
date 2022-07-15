import 'package:flutter/material.dart';

import '../screens/unknown_screen.dart';

enum RoutePath {
  home,
  projects,
  resume,
  unknown;

  String get segmentName => this == RoutePath.home ? '' : name;
  String get location => this == RoutePath.home ? '/' : '/$name';
}

class RouteUtils {
  static RoutePath parseUri(String? location) {
    if (location != null) {
      final uri = Uri.parse(location);
      late RoutePath result;
      if (uri.pathSegments.isEmpty) {
        result = RoutePath.home;
      } else if (uri.pathSegments.first == RoutePath.projects.segmentName) {
        result = RoutePath.projects;
      } else if (uri.pathSegments.first == RoutePath.resume.segmentName) {
        result = RoutePath.resume;
      } else {
        result = RoutePath.unknown;
      }
      return result;
    } else {
      return RoutePath.unknown;
    }
  }

  static RouteInformation restoreRouteInformation(RoutePath path) {
    late RouteInformation result;
    switch (path) {
      case RoutePath.home:
        result = RouteInformation(location: RoutePath.home.location);
        break;
      case RoutePath.projects:
        result = RouteInformation(location: RoutePath.home.location);
        break;
      case RoutePath.resume:
        result = RouteInformation(location: RoutePath.home.location);
        break;
      case RoutePath.unknown:
        result = RouteInformation(location: RoutePath.unknown.location);
        break;
    }
    return result;
  }

  static MaterialPage? updatePages(RoutePath path) {
    late MaterialPage? newPage;
    switch (path) {
      case RoutePath.home:
        return null;
      case RoutePath.projects:
        newPage = MaterialPage(
          child: const UnknownScreen(),
          key: UniqueKey(),
          name: RoutePath.unknown.location,
        );
        break;
      case RoutePath.resume:
        newPage = MaterialPage(
          child: const UnknownScreen(),
          key: UniqueKey(),
          name: RoutePath.unknown.location,
        );
        break;
      case RoutePath.unknown:
        newPage = MaterialPage(
          child: const UnknownScreen(),
          key: UniqueKey(),
          name: RoutePath.unknown.location,
        );
        break;
    }
    return newPage;
  }
}
