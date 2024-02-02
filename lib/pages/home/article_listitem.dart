import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realworld_app/pages/home/tag_labels.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({super.key});

  static const font_title = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const font_content = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54);
  static const font_author = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple);
  static const font_date = TextStyle(fontSize: 14, color: Colors.black38);

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
    return InkWell(
      onTap: () {
        context.push('/article');
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column (
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.push('/profile');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(style: font_author, 'author'),
                              Text(style: font_date, 'creation date'),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: OutlinedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.black87),
                        )
                      )
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                    label: const Text('count'),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(style: font_title, 'title'),
                Text(style: font_content, 'note'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Read more...',
                          style: const TextStyle(fontSize: 12, color: Colors.black38),
                        ),
                      ),
                      Expanded(
                        child: TagLabels(tags: mock_tags),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}