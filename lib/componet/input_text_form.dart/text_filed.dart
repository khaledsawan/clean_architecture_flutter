import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../text/very_small_text.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool enable;
  final String? prefixIcon;
  final TextInputType keyboardType;
  final Function? validator;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    required this.labelText,
    required this.hintText,
    this.enable = true,
    this.obscureText = false,
    this.prefixIcon,
    required this.keyboardType,
    required this.validator,
    required this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool show;
  @override
  void initState() {
    show = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enable,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.textColor2,
          fontSize: 12,
          fontFamily: 'Somar',
          fontWeight: FontWeight.w200,
          height: 0,
        ),
        prefixIcon: widget.prefixIcon!.isNotEmpty
            ? Image.asset(
                widget.prefixIcon!,
              )
            : null,
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    show = !show;
                  });
                },
                child: const Icon(
                  Icons.remove_red_eye_outlined,
                ),
              )
            : null,
      ),
      obscureText: show,
      keyboardType: widget.keyboardType,
      validator: (_) {
        widget.validator!(_);
        return null;
      },
      onChanged: widget.onChanged,
    );
  }
}

class CustomTextFieldV extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool enable;
  final String prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function? validator;
  final ValueChanged<String> onChanged;

  const CustomTextFieldV({
    required this.labelText,
    required this.hintText,
    this.enable = true,
    this.obscureText = false,
    required this.prefixIcon,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    required this.onChanged,
  });

  @override
  _CustomTextFieldVState createState() => _CustomTextFieldVState();
}

class _CustomTextFieldVState extends State<CustomTextFieldV> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Image.asset(
                  widget.prefixIcon,
                ),
                VerySmallText(body: widget.hintText),
              ],
            ),
            VerySmallText(body: widget.hintText)
          ],
        ),
        Divider()
      ],
    );
  }
}
