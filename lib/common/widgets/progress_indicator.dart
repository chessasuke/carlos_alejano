/// If decide to go with vertical page switch


// import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
// import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
// import 'package:flutter/material.dart';

// class TopProgressIndicator extends StatelessWidget {
//   const TopProgressIndicator({
//     required this.stepIndex,
//     required this.maxStep,
//     Key? key,
//     this.progressKey,
//   }) : super(key: key);

//   final ValueKey? progressKey;
//   final int maxStep;
//   final int stepIndex;

//   @override
//   Widget build(BuildContext context) {
//     return StepProgressIndicator(
//       maxSteps: maxStep,
//       step: stepIndex,
//       height: DisplayProperties.stepProgressIndicatorHeight,
//       bgColor: Colors.transparent,
//       indicatorColor: AppColors.primary100,
//       radius: DisplayProperties.stepProgressIndicatorRadius,
//       key: progressKey,
//     );
//   }
// }

// /// [step] must be >= 0 and < [maxSteps]. If [step] is negative, it will have the undesired effect of causing
// /// the step indicator to appear outside the progress bar on the left.
// class StepProgressIndicator extends StatefulWidget {
//   const StepProgressIndicator({
//     required this.step,
//     required this.maxSteps,
//     required this.bgColor,
//     required this.indicatorColor,
//     required this.height,
//     required this.radius,
//     Key? key,
//   })  : assert(maxSteps > 0),
//         assert(maxSteps > step),
//         assert(radius <= height),
//         super(key: key);

//   final int step;
//   final int maxSteps;
//   final Color bgColor;
//   final Color indicatorColor;
//   final double height;
//   final double radius;

//   @override
//   StepProgressIndicatorState createState() => StepProgressIndicatorState();
// }

// class StepProgressIndicatorState extends State<StepProgressIndicator>
//     with SingleTickerProviderStateMixin {
//   final _containerKey = GlobalKey();
//   final _indicatorKey = GlobalKey();
//   double _containerWidth = 0.0;
//   double _containerHeight = 0.0;
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   double _step = 0.0;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) {
//         setState(() {
//           _containerWidth = _containerKey.currentContext?.size?.width ?? 0.0;
//           _containerHeight = _containerKey.currentContext?.size?.height ?? 0.0;
//           _step = widget.step * _containerWidth / widget.maxSteps;
//         });
//       }
//     });

//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 500));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(StepProgressIndicator oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.step != widget.step) {
//       _animationController.duration = const Duration(milliseconds: 500);
//       _animation = Tween<double>(
//         begin: oldWidget.step * _containerWidth / widget.maxSteps,
//         end: widget.step * _containerWidth / widget.maxSteps,
//       ).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.linear),
//       )..addListener(() {
//           setState(() {
//             _step = _animation.value;
//           });
//         });
//       _animationController.forward(from: 0.0);
//     }
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2),
//         child: SizedBox(
//           key: _containerKey,
//           height: widget.height,
//           width: double.infinity,
//           child: Column(
//             children: [
//               Text(
//                 'data',
//                 style: TextStyle(color: Colors.black),
//               ),
//               CustomPaint(
//                 size: Size(
//                   _containerWidth / widget.maxSteps,
//                   _containerHeight,
//                 ),
//                 key: _indicatorKey,
//                 painter: _IndicatorPainter(
//                   radius: widget.radius,
//                   bgColor: widget.bgColor,
//                   indicatorColor: widget.indicatorColor,
//                   indicatorWidth: _containerWidth / widget.maxSteps,
//                   indicatorPosition: _step,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _IndicatorPainter extends CustomPainter {
//   _IndicatorPainter({
//     required this.radius,
//     required this.bgColor,
//     required this.indicatorColor,
//     required this.indicatorWidth,
//     required this.indicatorPosition,
//   });

//   final double radius;
//   final Color bgColor;
//   final Color indicatorColor;
//   final double indicatorWidth;
//   final double indicatorPosition;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double width = size.width;
//     final double height = size.height;

//     final bgPaint = Paint()
//       ..color = bgColor
//       ..style = PaintingStyle.fill;

//     final indicatorPaint = Paint()
//       ..color = indicatorColor
//       ..style = PaintingStyle.fill;

//     final RRect bgRect = RRect.fromRectAndRadius(
//       Rect.fromCenter(
//           center: Offset(width / 2, height / 2), width: width, height: height),
//       Radius.circular(radius),
//     );
//     canvas.drawRRect(bgRect, bgPaint);
//     final RRect indicatorRect = RRect.fromRectAndRadius(
//       Rect.fromCenter(
//         center: Offset(indicatorPosition + indicatorWidth / 2, height / 2),
//         width: indicatorWidth,
//         height: height,
//       ),
//       Radius.circular(radius),
//     );
//     canvas.drawRRect(indicatorRect, indicatorPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
