import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/common/widgets/main_container.dart';
import 'package:carlos_alejano_v2/pages/resume/resume_download.dart';
import 'package:carlos_alejano_v2/pages/resume/resume_skills.dart';
import 'package:carlos_alejano_v2/pages/resume/timeline/resume_timeline.dart';
import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      color: AppColors.secondary100,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: ResumeDownload(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: ResumeTimeline(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Skills(),
          ),
        ],
      ),
    );
  }
}
