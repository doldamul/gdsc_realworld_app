import 'package:flutter/material.dart';

class TagLabels extends StatelessWidget {
  List<String> tags;

  static const font_chip = TextStyle(
    fontSize: 14,
    color: Colors.black38,
  );

  TagLabels({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.end,
      spacing: 6,
      children: [
      for (var tag in tags)
         Chip(
           label: Text(tag),
           labelStyle: font_chip,
           side: const BorderSide(color: Colors.black12),
           shape: const StadiumBorder(),
           padding: EdgeInsets.zero,
           backgroundColor: Colors.transparent,
           visualDensity: VisualDensity(vertical: -4),
         ),
      ],
    );
  }
}
