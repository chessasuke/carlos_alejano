import 'package:carlos_alejano_v2/common/constants/app_colors.dart';
import 'package:carlos_alejano_v2/common/text/font_weights.dart';
import 'package:carlos_alejano_v2/common/text/text_style.dart';
import 'package:carlos_alejano_v2/common/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Text(
            'Skills',
            style: TextStyles.heading02,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
          child: Column(
            children: [
              for (final item in skillsDescription)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("• ", style: TextStyles.heading02.copyWith(height: 1)),
                    Expanded(child: Text(item, style: TextStyles.body01)),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 48,
          runSpacing: 16,
          children: [
            for (final item in skills)
              Card(
                  color: AppColors.neutral100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: GradientText(
                      text: item,
                      style: TextStyles.heading03.copyWith(
                        fontWeight: FontWeights.extraBold,
                      ),
                      gradient: getGradient(item),
                    ),
                  ))
          ],
        )
      ],
    );
  }

  Gradient getGradient(String text) {
    if (text == 'Flutter') {
      return const RadialGradient(colors: [
        AppColors.dataBlue01,
        AppColors.dataBlue02,
      ]);
    } else if (text == 'Firebase') {
      return const RadialGradient(colors: [
        AppColors.yellowPrimary,
        AppColors.yellowSecondary,
      ]);
    } else if (text == 'GraphQL') {
      return const RadialGradient(colors: [
        AppColors.darkRed,
        AppColors.error500,
      ]);
    } else {
      final rand = math.Random().nextInt(4);

      switch (rand) {
        case 0:
          return SweepGradient(
            colors: AppColors.gradientsBlue.toList(),
          );
        case 1:
          return SweepGradient(
            colors: AppColors.gradientsGreen.toList(),
          );
        case 2:
          return SweepGradient(
            colors: AppColors.gradientsPink.toList(),
          );
        default:
          return SweepGradient(
            colors: AppColors.gradients1.toList(),
          );
      }
    }
  }
}

const List<String> skillsDescription = [
  'Experience with Agile Methodologies and all steps of the Software Development Lifecycle.',
  'Familiar with different frameworks but strong focus on Flutter.',
  'Embrace teamwork with a positive mindset but can also work independently.',
  'Quick learner, always looking to expand skills and learn new technologies.'
];

const List<String> skills = [
  'Flutter',
  'Dart',
  'Firebase',
  'GraphQL',
  'Python',
  'C/C++',
  'SQL',
  'NoSQL',
  'OpenCV',
  'Keras',
  'Tensorflow',
  'Linux',
  'Bash',
];
