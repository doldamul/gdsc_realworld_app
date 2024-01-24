import 'package:flutter/material.dart';

class TagToggles extends StatelessWidget {
  List<String> tags;

  static const font_chip = TextStyle(
    fontSize: 14,
    color: Colors.deepPurple,
  );

  TagToggles({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 6,
      children: [
        for (var tag in tags)
          FilterChip(
            label: Text(tag),
            labelStyle: font_chip,
            shape: StadiumBorder(side: BorderSide(color: Colors.deepPurple)),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            visualDensity: VisualDensity(vertical: -4),
            onSelected: (newValue) {},
          ),
      ],
    );
  }
}
