// repositori -> abstract class

import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticleRepository {
  // API methods
  // Metode untuk mengambil daftar artikel dari sumber data eksternal (API). Mengembalikan Future yang berisi DataState yang berisi daftar ArticleEntity.
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Database methods
  // getSavedArticles(): Metode untuk mengambil daftar artikel yang tersimpan dalam database lokal. Mengembalikan Future yang berisi daftar ArticleEntity.
  Future<List<ArticleEntity>> getSavedArticles();

// getSavedArticles(): Metode untuk mengambil daftar artikel yang tersimpan dalam database lokal. Mengembalikan Future yang berisi daftar ArticleEntity.
  Future<void> saveArticle(ArticleEntity article);

// removeArticle(ArticleEntity article): Metode untuk menghapus artikel dari database lokal. Menerima ArticleEntity sebagai parameter dan tidak mengembalikan nilai (void).
  Future<void> removeArticle(ArticleEntity article);
}
