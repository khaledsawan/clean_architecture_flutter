import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class VerySmallText extends StatelessWidget {
  VerySmallText(
      {super.key, required this.body, this.color = AppColors.textColor});
  final String body;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontFamily: 'Somar',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ],
    );
  }
}
