/// If decide to go with vertical page switch


// import 'package:flutter/material.dart';

// class WidgetSwitcher extends StatelessWidget {
//   const WidgetSwitcher({
//     required this.child,
//     this.isReverseAnimation = false,
//     this.isHorizontalTransition = true,
//     Key? key,
//   }) : super(key: key);

//   final Widget child;
//   final bool isReverseAnimation;
//   final bool isHorizontalTransition;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 200),
//       transitionBuilder: (Widget child, Animation<double> animation) {
//         if (animation.status == AnimationStatus.completed) {
//           if (isReverseAnimation) {
//             return _getSlideTransition(
//               isEnter: true,
//               child: child,
//               animation: animation,
//               isHorizontalTransition: isHorizontalTransition,
//             );
//           } else {
//             return _getSlideTransition(
//               isEnter: false,
//               child: child,
//               animation: animation,
//               isHorizontalTransition: isHorizontalTransition,
//             );
//           }
//         } else {
//           if (isReverseAnimation) {
//             return _getSlideTransition(
//               isEnter: false,
//               child: child,
//               animation: animation,
//               isHorizontalTransition: isHorizontalTransition,
//             );
//           } else {
//             return _getSlideTransition(
//               isEnter: true,
//               child: child,
//               animation: animation,
//               isHorizontalTransition: isHorizontalTransition,
//             );
//           }
//         }
//       },
//       switchInCurve: const Interval(0.3, 1, curve: Curves.easeOutQuart),
//       switchOutCurve: const Interval(0.7, 1),
//       child: child,
//     );
//   }

//   SlideTransition _getSlideTransition({
//     required bool isEnter,
//     required bool isHorizontalTransition,
//     required Widget child,
//     required Animation<double> animation,
//   }) {
//     if (isEnter) {
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: isHorizontalTransition
//               ? const Offset(1.0, 0.0 )
//               : const Offset(0.0, 1.0),
//           end: Offset.zero,
//         ).animate(animation),
//         child: child,
//       );
//     } else {
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: isHorizontalTransition
//               ? const Offset(-1.0, 0.0)
//               : const Offset(0.0, -1.0),
//           end: Offset.zero,
//         ).animate(animation),
//         child: child,
//       );
//     }
//   }
// }
