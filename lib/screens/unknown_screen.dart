import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:carlos_alejano_v2/navigator/page_manager.dart';
import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '404!',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => PageManager.of(context).resetToHome(),
              child: Text(
                'Take Me Home',
                style: TextStyles.heading02.copyWith(
                  color: AppColors.linkBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
