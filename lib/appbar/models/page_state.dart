import 'package:carlos_alejano_v2/pages/app_bar_menu_page_item.dart';
import 'package:flutter/material.dart';

class PageState extends ChangeNotifier {
  PageState() {
    _currentPage = AppbarMenuPageItem.about;
  }

  late AppbarMenuPageItem _currentPage;
  AppbarMenuPageItem get currentPage => _currentPage;

  void setPage({required AppbarMenuPageItem clickedPage, bool notify = true}) {
    if (clickedPage != _currentPage) {
      _currentPage = clickedPage;
      if (notify) {
        notifyListeners();
      }
    }
  }
}
