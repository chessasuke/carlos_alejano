import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlos_alejano_v2/common/constants/assets_paths.dart';
import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:carlos_alejano_v2/generated/i18n.dart';
import 'package:carlos_alejano_v2/map/map/geojson_vedado.dart';
import 'package:carlos_alejano_v2/pages/about/social_bar.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          GeoJsonVedado(size: Size(size.width, size.height)),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Expanded(child: _ProfileImage()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _ProfileText(text: S.of(context).profileCardName),
              ),
              _ProfileText(text: S.of(context).profileCardPosition),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: _ProfileText(text: S.of(context).profileCardLocation),
              ),
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: SocialBar(),
              ),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(AssetPath.profileImg),
          ),
        ),
      ),
    );
  }
}

class _ProfileText extends StatelessWidget {
  const _ProfileText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyles.heading02,
    );
  }
}
