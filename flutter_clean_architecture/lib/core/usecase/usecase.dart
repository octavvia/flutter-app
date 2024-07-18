// usecase
abstract class UseCase<Type,Params> {
  Future<Type> call({Params params});
}

// Fungsi: Layer ini mengimplementasikan logika bisnis aplikasi. Use case mewakili operasi spesifik yang dapat dilakukan di aplikasi, biasanya dalam bentuk fungsi yang memanggil repository atau service untuk mengelola data. Use case bertanggung jawab untuk mengorkestrasi data dari berbagai sumber dan menyiapkan data untuk presentasi di layer UI.