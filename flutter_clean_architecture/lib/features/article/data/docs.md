Dalam arsitektur bersih (clean architecture), folder data biasanya mengelola semua logika yang berhubungan dengan data, termasuk mengambil data dari sumber eksternal, mengubah data, dan menyediakan data tersebut untuk layer yang lebih tinggi. Berikut adalah fungsi masing-masing layer dalam folder data:

1. Data Sources (Sumber Data)
Fungsi:

Mengelola pengambilan data dari berbagai sumber, seperti API, database lokal, file, atau layanan eksternal lainnya.
Biasanya terdapat dua jenis data sources:
Remote Data Source: Mengambil data dari server atau API.
Local Data Source: Mengambil data dari cache lokal atau database lokal.

Contoh:

```
class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  Future<List<ArticleModel>> fetchArticles() async {
    final response = await dio.get('https://api.example.com/articles');
    return (response.data as List).map((json) => ArticleModel.fromJson(json)).toList();
  }
}

class LocalDataSource {
  final Database database;

  LocalDataSource(this.database);

  Future<List<ArticleModel>> getCachedArticles() async {
    final articles = await database.query('articles');
    return articles.map((json) => ArticleModel.fromJson(json)).toList();
  }
}
```

2. Models (Model)

Fungsi:

Mengubah (memetakan) data dari bentuk yang diterima dari data source ke bentuk yang lebih mudah digunakan dalam aplikasi (biasanya ke bentuk entity atau domain model).

Biasanya, model ini juga digunakan untuk serialisasi dan deserialisasi JSON.

Contoh:

```
class ArticleModel {
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleModel({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}
```

3. Repository

Fungsi:

Menyediakan abstraksi antara data sources dan use cases/domain layer.
Mengelola logika pengambilan data dari berbagai sumber dan memutuskan dari mana data tersebut akan diambil (misalnya, dari cache atau dari server).

Biasanya mengimplementasikan interface yang didefinisikan di domain layer.

Contoh:

```
abstract class ArticleRepository {
  Future<List<ArticleModel>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ArticleRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<ArticleModel>> getArticles() async {
    try {
      final articles = await remoteDataSource.fetchArticles();
      // Cache the articles locally for future use
      await localDataSource.cacheArticles(articles);
      return articles;
    } catch (e) {
      // If fetching from remote source fails, return cached articles
      return await localDataSource.getCachedArticles();
    }
  }
}
```

Kesimpulan:

Data Sources: Mengambil data dari berbagai sumber, baik itu remote maupun lokal.

Models: Mengubah data ke bentuk yang lebih mudah digunakan dalam aplikasi serta melakukan serialisasi dan deserialisasi data.

Repository: Menyediakan abstraksi antara data sources dan domain layer, mengelola logika pengambilan data, dan mengimplementasikan interface dari domain layer.

Dengan struktur ini, setiap bagian kode memiliki tanggung jawab yang jelas dan spesifik, memudahkan pengembangan dan pemeliharaan aplikasi.


langkah pada folder ini :
model - data sources - repository



