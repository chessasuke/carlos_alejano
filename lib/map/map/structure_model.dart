
class Structure {
  Structure({
    required this.name,
    required this.centroid,
  });

  /// Name of the building
  final String name;

  /// The centroid is calculated by taking the average of all
  /// coordinates of the polygon. This is not ideal, since polygons
  /// with a hole in the center for example will get the center wrong
  /// but it's enough for this use case (UTD CAMPUS MAP)
  final List<double> centroid;
}

class Street {
  final String name;
  final List coordinates;
  Street({required this.name, required this.coordinates});
}
