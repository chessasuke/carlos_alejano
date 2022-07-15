import 'package:carlos_alejano_v2/appbar/providers/app_bar_providers.dart';
import 'package:carlos_alejano_v2/appbar/widgets/appbar_menu_item.dart';
import 'package:carlos_alejano_v2/pages/app_bar_menu_page_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarRowItems extends ConsumerWidget {
  const AppBarRowItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(pageItemProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final item in AppbarMenuPageItem.values)
          AppBarMenuItem(
            text: item.capName,
            isSelected: currentPage == item,
            onTap: () {
              ref.read(pageClickNotifier).setPage(clickedPage: item);
            },
          ),
      ],
    );
  }
}
