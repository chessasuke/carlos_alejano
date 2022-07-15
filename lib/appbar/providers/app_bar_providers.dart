import 'package:carlos_alejano_v2/appbar/models/page_state.dart';
import 'package:carlos_alejano_v2/pages/app_bar_menu_page_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final isDrawerOpenProvider = ChangeNotifierProvider.autoDispose<DrawerState>(
//   (ref) => DrawerState(),
// );

final pageItemProvider = StateProvider<AppbarMenuPageItem>(
  (ref) => AppbarMenuPageItem.about,
);

final pageClickNotifier = ChangeNotifierProvider<PageState>(
  (ref) => PageState(),
);
