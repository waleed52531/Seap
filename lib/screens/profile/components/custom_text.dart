import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({
    Key? key,
    required this.label,
    this.fontweight,
     this.softwrap,
     this.maxLines,
     this.overflow,

  }) : super(key: key);

  final String label;
  var fontweight;
  var softwrap;
  var maxLines;
  var overflow;


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 100, // Limit the height of the widget
      ),
      child: Text(
        label,
        softWrap: softwrap,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(fontSize: 18,
            fontWeight: fontweight,
        ),
      ),
    );
  }
}
