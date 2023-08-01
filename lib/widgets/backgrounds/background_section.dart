import 'package:flutter/material.dart';

class SingleSection extends StatelessWidget {
  final List<Widget> children;
  final String title;
  const SingleSection({Key key, this.children = const [], this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        SizedBox(
          child: Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        const Divider(color: Colors.grey),
        Column(children: children)
      ],
    );
  }
}
