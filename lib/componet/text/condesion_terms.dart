import 'package:flutter/material.dart';

class CondesionTerms extends StatelessWidget {
  const CondesionTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'متابعتك تعني موافقتك على',
              style: TextStyle(
                color: Color(0xFF272739),
                fontSize: 13,
                fontFamily: 'Somar',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(
                color: Color(0xFFEB6440),
                fontSize: 13,
                fontFamily: 'Somar',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            TextSpan(
              text: 'الشروط والأحكام',
              style: TextStyle(
                color: Color(0xFFEB6440),
                fontSize: 13,
                fontFamily: 'Somar',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(
                color: Color(0xFFEB6440),
                fontSize: 13,
                fontFamily: 'Somar',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            TextSpan(
              text: 'وسياسة الخصوصية',
              style: TextStyle(
                color: Color(0xFFEB6440),
                fontSize: 13,
                fontFamily: 'Somar',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
