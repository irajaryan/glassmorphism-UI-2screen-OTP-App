import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonName;
  final double paddingH;
  const CustomButton({
    this.buttonName,
    this.paddingH = 20,
  });

  @override
  _CustomButtonState createState() =>
      _CustomButtonState(buttonName: this.buttonName, paddingH: this.paddingH);
}

class _CustomButtonState extends State<CustomButton> {
  final String buttonName;
  final double paddingH;
  _CustomButtonState({this.buttonName, this.paddingH});
  Color _color = Colors.white;
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (f) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (f) {
        setState(() {
          isHover = false;
        });
      },
      child: GestureDetector(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: this.paddingH,
          ),
          decoration: BoxDecoration(
              color: isHover ? _color : null,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              )),
          child: Text(
            this.buttonName,
            style: TextStyle(
                color: isHover ? Colors.black : Colors.white,
                fontSize: 20.0,
                fontFamily: "TTNorm"),
          ),
        ),
      ),
    );
  }
}
