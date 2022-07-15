import 'package:carlos_alejano_v2/appbar/widgets/appbar_row_items.dart';
import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
import 'package:carlos_alejano_v2/common/widgets/page_view_content.dart';
import 'package:carlos_alejano_v2/services/analytics/events/actions_events.dart';
import 'package:carlos_alejano_v2/services/analytics/models/event.dart';
import 'package:carlos_alejano_v2/services/analytics/providers/analytics_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  late Size screenSize;

  @override
  void initState() {
    super.initState();
    _trackEnableNotifications(Event(name: ActionsEvents.appInitialized.name));
  }

  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.of(context).size;
    // if (screenSize.width > 600) {
    //   WidgetsBinding.instance
    //       .addPostFrameCallback((_) => ref.read(isDrawerOpenProvider).close());
    // }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.brandColorCream,
        // appBar: AppAppBar(isSmallScreen: screenSize.width <= 600),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: screenSize.height,
                child: const Padding(
                  padding: EdgeInsets.only(top: DisplayProperties.kAppBarSize),
                  child: AppPageView(),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              height: DisplayProperties.kAppBarSize,
              width: screenSize.width,
              child: const AppBarRowItems(),
            ),
          ],
        ),
        // Stack(
        //   children: const [
        //     // const MainContent(),
        //     // if (screenSize.width <= 600) const AppBarDrawer(),
        //   ],
        // ),
      ),
    );
  }

  void _trackEnableNotifications(Event event) {
    ref.read(analyticsProvider).trackEvent(event);
  }
}
