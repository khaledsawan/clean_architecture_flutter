import 'package:flutter/material.dart';

class TextSpanCustom extends StatelessWidget {
  TextSpanCustom(
      {super.key, required this.body, required this.gool, required this.onTip});
final   String body;
 final  String gool;
final  Function? onTip;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          body,
          style: const TextStyle(
            color: Color(0xFF272739),
            fontSize: 15,
            fontFamily: 'Somar',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        GestureDetector(
          onTap: () => onTip!(),
          child: Text(
            gool,
            style: const TextStyle(
              color: Color(0xFFEB6440),
              fontSize: 15,
              fontFamily: 'Somar',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
