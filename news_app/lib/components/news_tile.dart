import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/business.jpeg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            cacheWidth: (MediaQuery.of(context).size.width * pixelRatio)
                .round(),
            cacheHeight: (200 * pixelRatio).round(),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Business News Headline Goes Heresaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Latest updates on market trends and economic news',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
