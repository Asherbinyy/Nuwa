import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/styles/app_styles.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

import '../text/app_text.dart';

class CopyRightsTextBuilder extends StatelessWidget {
  const CopyRightsTextBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.0.toH()),
      child: AppText(
        'NUWA PEN B.V.',
        style: AppStyles.caption,
      ),
    );
  }
}
