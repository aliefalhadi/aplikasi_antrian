import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPressed;
  final Color color;
  const CustomButton({
    Key key, @required this.label,@required this.onPressed,@required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation: 0,
        onPressed: onPressed,
        color: color,
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}