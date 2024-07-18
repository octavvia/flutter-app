// entities bisa di generate dari quicktype.io

import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable{
  final int ? id;
  final String ? author;
  final String ? title;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? content;

  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List < Object ? > get props {
    return [
      id,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}

// pada bagian ini biasanya dibuat sesuai dengan bentuk dari api responnya, contohnya 
// {
//   "id": 1,
//   "author": "John Doe",
//   "title": "Sample Article",
//   "description": "This is a sample article description.",
//   "url": "https://example.com/sample-article",
//   "urlToImage": "https://example.com/sample-article.jpg",
//   "publishedAt": "2024-07-18T12:34:56Z",
//   "content": "This is the content of the sample article."
// }
