import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  const LabelTextField({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 4),
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}