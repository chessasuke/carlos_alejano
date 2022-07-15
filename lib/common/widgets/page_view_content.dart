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

  late final GlobalKey _aboutSectionKey;

  late final AppbarMenuPageItem currentPage;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _aboutSectionKey = GlobalKey();
    _scrollController = ScrollController();

    _pages = [
      AboutPage(key: _aboutSectionKey),
      const ResumePage(),
    ];

    ref.read(pageClickNotifier).addListener((_tapAppbarListener));
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onNotification,
      child:

          /// USING [SingleChildScrollView] WE CAN FORCE TO BUILD ALL THE CHILDREN
          /// AND WE CAN GET THE CONTEXT FOR NOT VISIBLE CHILDREN BUT IS VERY BAD
          /// PERFORMANCE WISE
          /// THERE IS NO OTHER WAY TO SCROLL TO A WIDGET THAT IS NOT VISIBLE
          /// BUT SINCE WE ONLY HAVE TWO, AND ON INIT THE FIRST ONE IS ALWAYS VISIBLE
          /// WE CAN GET THE SIZE OF THE FIRST ONE TO GET THE POSITION OF THE SECOND PAGE
          /// THIS WAY AVOID TO USE [SingleChildScrollView] WHICH MAKES BROWSING IN MOBILE
          /// VERY LAGGY

          // SingleChildScrollView(
          //   controller: _scrollController,
          //   child: Column(
          //     children: _pages,
          //   ),
          // ),

          CustomScrollView(
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
        _scrollToPosition(0);
        break;
      case AppbarMenuPageItem.resume:
        final aboutHeight = _getWidgetSize(_aboutSectionKey);
        _scrollToPosition(aboutHeight);
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

  double? _getWidgetSize(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    double? position = box?.size.height;
    return position;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
