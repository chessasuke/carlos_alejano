import 'package:carlos_alejano_v2/map/map/updated_custom_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// NOTE TO MYSELF
/// STEPS TO DRAW MAP (FOR NOW, I will automate it soon)
/// 1- download the raw data from openstreetmaps (osm file)
/// 2- convert osm to geojson, could use terminal with command: "osmtogeojson file.osm > file.geojson"
/// 3- preprocess data and identify the center of the data to deduce this distance from all point
/// in the mercator function (check the dart script testing-geojson)
/// 4- copy to the flutter project and use custom painter to draw it
/// 5- might need to adjust offset when painting the points
/// (in vedado map was point + screensize.width/2 and point + screensize.height/2)
/// (in utd map was different)

class GeoJsonVedado extends ConsumerWidget {
  const GeoJsonVedado({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.fromSize(
      size: size,
      child: RepaintBoundary(
        child: CustomPaint(
          isComplex: true,
          willChange: false,
          painter: CustomMap(context: context),
        ),
      ),
    );
  }
}
