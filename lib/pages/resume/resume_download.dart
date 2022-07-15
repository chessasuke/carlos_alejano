import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/common/constants/till_remote_config_is_set.dart';
import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:carlos_alejano_v2/common/utils/utils.dart';
import 'package:carlos_alejano_v2/generated/i18n.dart';
import 'package:flutter/material.dart';

class ResumeDownload extends StatelessWidget {
  const ResumeDownload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () async =>
          await Utils.launchURL(TillRemoteConfigIsSet.pdfResumeLink),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).resumeOpenPdf,
            style: TextStyles.underlinedTextButtonTextStyle.copyWith(
              fontSize: TextStyles.heading02FontSize,
              color: AppColors.linkBlue,
            ),
          ),
          const SizedBox(width: 8),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(Icons.picture_as_pdf, color: AppColors.linkBlue),
          ),
        ],
      ),
    );
  }
}