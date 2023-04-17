import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {

  Color? color;
  Color? textcolor;
  String? text;
  VoidCallback? onTap;

  MyButton({this.color, this.text, this.textcolor, this.onTap}) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: color,
            child: Center(
              child: Text('${text}', style: TextStyle(
                color: textcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
