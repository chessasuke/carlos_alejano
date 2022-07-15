import 'package:carlos_alejano_v2/map/data/buildingCenters.dart';
import 'package:carlos_alejano_v2/map/data/centers4.dart';
import 'package:carlos_alejano_v2/map/data/coord3.dart';
import 'package:carlos_alejano_v2/map/data/name3.dart';
import 'package:carlos_alejano_v2/map/data/name4.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/buildingName.dart';
import 'structure_model.dart';

/// 4d Structures - Buildings
final buildingProvider = Provider<List<Structure>>((ref) {
  List<Structure> buildings = [];

  for (int i = 0; i < namesBuild.length; i++) {
    buildings.add(Structure(
      name: namesBuild[i],
      centroid: building_centers[i],
    ));
  }
  return buildings;
});

/// 4d Structures - non Buildings
final structure4dProvider = Provider<List<Structure>>((ref) {
  List<Structure> structures4D = [];

  for (int i = 0; i < names4D.length; i++) {
    structures4D.add(Structure(
      name: names4D[i],
      centroid: centers4D[i],
    ));
  }

  return structures4D;
});

/// 3d Structures
final streetsProvider = Provider<List<Street>>((ref) {
  List<Street> structures3D = [];

  for (int i = 0; i < names3D.length; i++) {
    structures3D.add(Street(
      name: names3D[i],
      coordinates: coord3D[i][0],
    ));
  }

  return structures3D;
});
