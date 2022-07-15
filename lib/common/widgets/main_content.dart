/// If decide to go with vertical page switch

// import 'package:carlos_alejano_v2/appbar/providers/app_bar_providers.dart';
// import 'package:carlos_alejano_v2/common/widgets/widget_switcher.dart';
// import 'package:carlos_alejano_v2/pages/about/about_page.dart';
// import 'package:carlos_alejano_v2/pages/app_bar_menu_page_item.dart';
// import 'package:carlos_alejano_v2/pages/resume/resume_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MainContent extends ConsumerWidget {
//   const MainContent({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AppbarMenuPageItem currentStep = ref.watch(pageItemProvider);

//     return Stack(
//       children: <Widget>[
//         if (currentStep == AppbarMenuPageItem.about)
//           _MainContentContainer(
//             currentStep: currentStep,
//             child: AboutPage(
//               key: ValueKey(currentStep.name),
//             ),
//           )
//         else if (currentStep == AppbarMenuPageItem.resume)
//           _MainContentContainer(
//             currentStep: currentStep,
//             child: ResumePage(
//               key: ValueKey(currentStep.name),
//             ),
//           )
//         // else if (currentStep == AppbarMenuPageItem.projects)
//         //   _MainContentContainer(
//         //     child: ProjectsScreen(
//         //       key: ValueKey(currentStep.name),
//         //     ),
//         //   ),
//       ],
//     );
//   }
// }

// class _MainContentContainer extends StatelessWidget {
//   const _MainContentContainer({
//     required this.child,
//     required this.currentStep,
//     Key? key,
//   }) : super(key: key);

//   final Widget child;
//   final AppbarMenuPageItem currentStep;

//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: Column(
//         children: [
//           Expanded(
//             child: WidgetSwitcher(
//               isReverseAnimation: currentStep == AppbarMenuPageItem.about,
//               isHorizontalTransition: false,
//               child: child,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
