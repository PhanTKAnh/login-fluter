import 'package:flutter/material.dart';

class AppEleventButton extends StatelessWidget {
  const AppEleventButton(
      {super.key,
      this.onPressed,
      this.height = 48.0,
      this.textColor = Colors.white,
      this.color = Colors.amber,
      this.boderColor = Colors.black12,
      required this.text});
  final Function()? onPressed;
  final double height;
  final Color textColor;
  final Color color;
  final Color boderColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: boderColor,
              width: 1.2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.amber,
                  offset: Offset(0.0, 0.6),
                  blurRadius: 4.6),
            ]),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
