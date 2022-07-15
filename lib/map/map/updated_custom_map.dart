import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/map/data/buildingCoord.dart';
import 'package:carlos_alejano_v2/map/data/coord3.dart';
import 'package:carlos_alejano_v2/map/data/coord4.dart';
import 'package:flutter/material.dart';

const x_23y12 = 12.06703280210495;
const y_23y12 = 7.979438259452581;

class CustomMap extends CustomPainter {
  CustomMap({required this.context});
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height));
    // canvas.drawColor(Colors.transparent, BlendMode.darken);

    /// Paint the buildings (building coord)
    for (int i = 0; i < coordBuild.length; i++) {
      paintBuilding(canvas, coordBuild[i], size, context);
    }

    /// Paint the 4d structures that are NOT buildings (coord4)
    for (int i = 0; i < coord4D.length; i++) {
      bool doPaint = true;
      if (i == 0 || i == 3) doPaint = false;
      paint4dStructures(canvas, coord4D[i], size, context, doPaint: doPaint);
    }

    /// Paint the 3d structures (lines)
    for (int i = 0; i < coord3D.length; i++) {
      paint3dStructures(
        canvas,
        coord3D[i],
        size,
        context,
      );
    }

    paint23y12(canvas, size);
  }

  /// Paint buildings
  /// Using [drawPath] for filling and [drawLines] for borders
  paintBuilding(Canvas canvas, List<List<List<double>>> building, Size size,
      BuildContext context) {
    /// Two painters, one for border other for fill
    final Paint paintFill = Paint()
      ..color = Theme.of(context).focusColor.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final Paint paintBorder = Paint()
      ..color = Theme.of(context).cardColor.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    /// Go over the points (from p1 to p2)
    /// form a polygon iterating over each p1-p2
    /// each time draw a line which is the border
    /// at the end add the polygon to a path to fill a building
    ///
    for (int i = 0; i < building.length; i++) {
      /// Paint polygon using lines
      /// before I was using Path but was extremely expensive(slow)
      List<Offset> buildingPoints = [];
      Path path = Path();

      for (int j = 0; j < building[i].length - 1; j++) {
        Offset p1 = Offset(building[i][j][0] + size.width / 2,
            (-building[i][j][1]) + size.height / 2);
        Offset p2 = Offset(building[i][j + 1][0] + size.width / 2,
            (-building[i][j + 1][1]) + size.height / 2);

        buildingPoints.add(p1);
        buildingPoints.add(p2);

        /// Drawing lines turned out to be way less expensive than drawing Path
        canvas.drawLine(p1, p2, paintBorder);
      }

      /// Fill
      path.addPolygon(buildingPoints, false);
      canvas.drawPath(path, paintFill);
    }
  }

  /// Repeat the same operation than with the buildings above
  void paint4dStructures(
      Canvas canvas, List structure, Size size, BuildContext context,
      {bool doPaint = true}) {
    final Paint paintFill = Paint()
      ..color = AppColors.neutral200.withOpacity(0.3)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final Paint paintBorder = Paint()
      ..color = AppColors.dataBlue02.withOpacity(0.3)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    /// Not a building, dont fill
    for (int i = 0; i < structure.length; i++) {
      List<Offset> buildingPoints = [];
      Path path = Path();

      for (int j = 0; j < structure[i].length - 1; j++) {
        Offset p1 = Offset(structure[i][j][0] + size.width / 2,
            (-structure[i][j][1]) + size.height / 2);
        Offset p2 = Offset(structure[i][j + 1][0] + size.width / 2,
            (-structure[i][j + 1][1]) + size.height / 2);

        buildingPoints.add(p1);
        buildingPoints.add(p2);

        /// Border
        canvas.drawLine(p1, p2, paintBorder);
      }

      if (doPaint) {
        path.addPolygon(buildingPoints, false);
        canvas.drawPath(path, paintFill);
      } else {
        continue;
      }
    }
  }

  /// Paint streets (lines) using [drawLines]
  void paint3dStructures(
      Canvas canvas, List street, Size size, BuildContext context) {
    final Paint paintBorder = Paint()
      ..color = AppColors.neutral500.withOpacity(0.25)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.5;

    for (int i = 0; i < street.length - 1; i++) {
      /// Paint lines
      Offset firstPt = Offset(
          street[i][0] + size.width / 2, (-street[i][1]) + size.height / 2);
      Offset secondPt = Offset(street[i + 1][0] + size.width / 2,
          (-street[i + 1][1]) + size.height / 2);

      canvas.drawLine(firstPt, secondPt, paintBorder);
    }
  }

  /// Paint 2d [drawLines]
  void paint23y12(Canvas canvas, Size size) {
    final Paint paintBorder = Paint()
      ..color = AppColors.success500.withOpacity(0.5)
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    Offset c = Offset(x_23y12 + size.width / 2, y_23y12 + size.height / 2);
    canvas.drawCircle(c, 5, paintBorder);
  }

  @override
  bool shouldRepaint(CustomMap oldDelegate) {
    return false;
  }
}
