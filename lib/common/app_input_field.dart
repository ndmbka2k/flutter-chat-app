import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.elevation = 0,
    this.hintText,
    this.obscureText =false,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onEditingComplete,
  }) : super(key: key);

  final TextEditingController? controller;
  final double elevation;
  final Widget? prefixIcon;
  final String? hintText;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
