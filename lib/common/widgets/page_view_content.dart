import 'package:carlos_alejano_v2/appbar/providers/app_bar_providers.dart';
import 'package:carlos_alejano_v2/pages/about/about_page.dart';
import 'package:carlos_alejano_v2/pages/app_bar_menu_page_item.dart';
import 'package:carlos_alejano_v2/pages/resume/resume_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppPageView extends ConsumerStatefulWidget {
  const AppPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<AppPageView> createState() => _AppPageViewState();
}

class _AppPageViewState extends ConsumerState<AppPageView> {
  late final ScrollController _scrollController;

  late final GlobalKey aboutSectionKey;
  late final GlobalKey resumeSectionKey;

  late final AppbarMenuPageItem currentPage;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    aboutSectionKey = GlobalKey();
    resumeSectionKey = GlobalKey();
    _scrollController = ScrollController();

    _pages = [
      AboutPage(key: aboutSectionKey),
      ResumePage(key: resumeSectionKey),
    ];

    ref.read(pageClickNotifier).addListener((_tapAppbarListener));
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onNotification,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              _pages,
            ),
          )
        ],
      ),
    );
  }

  bool _onNotification(ScrollNotification scrollNotification) {
    final currentPage = ref.read(pageItemProvider);
    if (scrollNotification.metrics.pixels >= 450 &&
        currentPage != AppbarMenuPageItem.resume) {
      ref.read(pageItemProvider.notifier).state = (AppbarMenuPageItem.resume);
      ref
          .read(pageClickNotifier)
          .setPage(clickedPage: AppbarMenuPageItem.resume);
    } else if (scrollNotification.metrics.pixels < 450 &&
        currentPage != AppbarMenuPageItem.about) {
      ref.read(pageItemProvider.notifier).state = (AppbarMenuPageItem.about);
      ref
          .read(pageClickNotifier)
          .setPage(clickedPage: AppbarMenuPageItem.about);
    }
    return false;
  }

  void _tapAppbarListener() {
    final itemClicked = ref.read(pageClickNotifier).currentPage;

    switch (itemClicked) {
      case AppbarMenuPageItem.about:
        _scrollToPosition(_getWidgetYPosition(aboutSectionKey));
        break;
      case AppbarMenuPageItem.resume:
        final position = _getWidgetYPosition(resumeSectionKey);
        _scrollToPosition(position);
        break;
    }
  }

  void _scrollToPosition(double? offset) async {
    if (_scrollController.hasClients && offset != null) {
      await _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  double? _getWidgetYPosition(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    Offset position = box?.localToGlobal(Offset.zero) ?? Offset.zero;
    return position.dy;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_tapAppbarListener);
    _scrollController.dispose();
    super.dispose();
  }
}
