import 'package:flutter/material.dart';

import '../models/article_model.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            article.urlToImage ?? '',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            cacheWidth: (MediaQuery.of(context).size.width * pixelRatio)
                .round(),
            cacheHeight: (200 * pixelRatio).round(),
            headers: const {'User-Agent': 'Mozilla/5.0'},
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: const Icon(Icons.image, size: 48, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          article.description ?? 'No description available',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
