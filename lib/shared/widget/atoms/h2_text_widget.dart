import 'package:fic5_ecatalog_asrafilll/shared/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class H2TextWidget extends StatelessWidget {
  const H2TextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.h2TextStyle,
    );
  }
}
