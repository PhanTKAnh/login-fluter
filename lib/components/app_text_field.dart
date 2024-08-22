import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.textInputAction,
    this.isPassWord = false,
  });
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? hintText;
  final TextInputAction? textInputAction;
  final bool isPassWord;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.amber, width: 1.2),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.amber,
              offset: Offset(0.0, 0.4),
              blurRadius: 6.4,
            )
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints(minWidth: 40.0)),
        obscureText: isPassWord,
        textInputAction: textInputAction,
      ),
    );
  }
}
