import 'package:flutter/material.dart';

class PageIndexSwitcher extends StatelessWidget {
  int count;

  static const font_label = TextStyle(
    color: Colors.deepPurple,
  );

  PageIndexSwitcher({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 5,
      alignment: WrapAlignment.center,
      runSpacing: -10,
      children: [
        for (var i=1; i<=count; i++)
            ActionChip(
              label: SizedBox(
                width: 56,
                child: Text(
                    style: font_label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    i.toString(),
                ),
              ),
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              shape: StadiumBorder(),
              side: BorderSide.none,
              elevation: 1,
              shadowColor: Colors.deepPurple,
              onPressed: () {},
            ),

      ],
    );
  }
}
