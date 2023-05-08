import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({
    Key? key,
    required this.label,
    this.fontweight,

  }) : super(key: key);

  final String label;
  var fontweight;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label,
        style: TextStyle(fontSize: 18,
            fontWeight: fontweight,
        ),
      ),
    );
  }
}
