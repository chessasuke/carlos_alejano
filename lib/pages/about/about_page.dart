import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/common/constants/display_properties.dart';
import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:carlos_alejano_v2/common/widgets/main_container.dart';
import 'package:carlos_alejano_v2/generated/i18n.dart';
import 'package:carlos_alejano_v2/pages/about/profile_card.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late Size screenSize;

  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      color: AppColors.neutral200,
      child: _AboutContent(screenSize: screenSize),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent({
    required this.screenSize,
    Key? key,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return screenSize.width > 600
        ? SizedBox(
            height: screenSize.height - DisplayProperties.kAppBarSize,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileCard(
                  size: Size(
                    screenSize.width * 0.45,
                    screenSize.width * 0.9,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(child: _Text()),
              ],
            ),
          )
        : Column(
            children: [
              ProfileCard(
                  size: Size(
                screenSize.width * 0.8,
                screenSize.width * 1.6,
              )),
              const SizedBox(height: 32),
              const _Text(),
            ],
          );
  }
}

class _Text extends StatelessWidget {
  const _Text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Until remote config is set
        Text(
          S.of(context).aboutHello,
          style: TextStyles.heading01,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 32),
        Text(
          S.of(context).aboutDescription,
          style: TextStyles.body01,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
