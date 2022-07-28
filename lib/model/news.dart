class news {
  late String title;
  late String author;
  late String description;
  late String url;
  late String urlToImage;
  late String content;

  news(
      {required this.title,
      required this.author,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content});

  factory news.fromJson(Map<String, dynamic> json) {
    return news(
        title: json['title'] ?? '',
        author: json['author'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        content: json['content'] ?? '');
  }
}
