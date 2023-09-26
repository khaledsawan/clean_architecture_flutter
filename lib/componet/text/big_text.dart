import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class BigText extends StatelessWidget {
  BigText({super.key, required this.body});
  final  body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          body,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontFamily: 'Somar',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ],
    );
  }
}
