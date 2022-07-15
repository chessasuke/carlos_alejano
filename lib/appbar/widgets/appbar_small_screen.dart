/// Commented out for now until more menu items are added to the appbar
/// and wont get enough space

// import 'package:carlos_alejano_v2/appbar/providers/app_bar_providers.dart';
// import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AppBarSmallScreen extends StatelessWidget implements PreferredSizeWidget {
//   const AppBarSmallScreen({Key? key}) : super(key: key);

//   @override
//   Size get preferredSize =>
//       const Size.fromHeight(DisplayProperties.kAppBarSize);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       iconTheme: const IconThemeData(color: Colors.black),
//       leadingWidth: 100,
//       toolbarHeight: DisplayProperties.kAppBarSize,
//       backgroundColor: Colors.transparent,
//       elevation: 0.0,
//       automaticallyImplyLeading: false,
//       actions: const [_DrawerIcon()],
//     );
//   }
// }

// class _DrawerIcon extends ConsumerWidget {
//   const _DrawerIcon({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isOpen = ref.watch(isDrawerOpenProvider).isOpen;
//     return IconButton(
//         onPressed: () => ref.read(isDrawerOpenProvider).toggle(),
//         icon: Icon(isOpen ? Icons.clear : Icons.menu));
//   }
// }
