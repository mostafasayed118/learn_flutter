class ArticleModel {
  final String title;
  final String? description;
  final String? urlToImage;
  final String url;

  ArticleModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
