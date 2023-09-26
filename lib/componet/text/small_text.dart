import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class SmallText extends StatelessWidget {
  SmallText({super.key, required this.body, this.color = AppColors.textColor});
 final String body;
final  Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontFamily: 'Somar',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ],
    );
  }
}
