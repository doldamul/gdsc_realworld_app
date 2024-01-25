import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  static const font_title = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  static const font_content = TextStyle(fontSize: 14, color: Colors.black);
  static const font_author = TextStyle(fontSize: 16, color: Colors.white);
  static const font_date = TextStyle(fontSize: 14, color: Colors.white60);
  static const font_chip = TextStyle(fontSize: 14, color: Colors.black38);

  static const mock_tags = [
    'apple',
    'banana',
    'cake',
    'donut',
    'egg',
    'french fry',
    'grape',
    'hot dog',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.deepPurple,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(style: font_title, 'title'),
                    ),
                    // duplicate of article_listitem(TODO: convert to profile item widget)
                    Row(
                      children: [
                        Expanded(
                          child: InkWell (
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(style: font_author, 'author'),
                                  Text(style: font_date, 'creation date'),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(style: font_content, 'content'),
                  ),
                  // duplicate of tag_labels file
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    spacing: 6,
                    children: [
                      for (var tag in mock_tags)
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
                  ),
                ],
              )
            ),
            Divider(height: 1),
            // duplicate of article_listitem
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.deepPurple,
                              ),
                              'author'
                          ),
                          Text(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                            ),
                            'creation date',
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Placeholder(),
            )
          ],
        ),
      )
    );
  }
}
