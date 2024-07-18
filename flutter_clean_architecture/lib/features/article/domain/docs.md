Di dalam pola desain Clean Architecture, lapisan domain memiliki struktur yang terdiri dari tiga sub-lapisan utama: entities, repository, dan usecases. Mari kita bahas fungsi masing-masing dari sub-lapisan ini:

1. Entities

Entities atau entitas merupakan bagian dari domain model yang merepresentasikan objek-objek utama yang digunakan dalam aplikasi. Entitas-entitas ini biasanya berisi definisi dari objek bisnis atau domain yang dibahas dalam aplikasi.

Fungsi Entities:

Representasi Objek Bisnis: Menyediakan representasi objek-objek bisnis murni tanpa terpengaruh oleh implementasi teknis atau infrastruktur.
Memodelkan Data: Mendefinisikan atribut dan perilaku dari objek-objek yang ada di dalam domain aplikasi.

Independen dari Teknologi: Tidak terikat dengan teknologi atau infrastruktur tertentu, sehingga dapat digunakan secara bebas di seluruh lapisan aplikasi.

Contoh Entities:

Misalnya, dalam aplikasi berita, entitas seperti Article, User, atau Comment dapat didefinisikan di dalam lapisan ini dengan atribut-atribut yang sesuai dengan kebutuhan bisnis.

2. Repository

Repository bertanggung jawab untuk mengelola sumber daya data dan menyediakan antarmuka untuk mengakses data dari berbagai sumber, seperti database, API, atau penyimpanan lokal lainnya. Repositori menyediakan cara untuk mengakses dan memanipulasi data tanpa harus mengetahui detail implementasi dari mana data tersebut berasal.

Fungsi Repository:

Abstraksi Sumber Data: Menyediakan antarmuka yang abstrak untuk mengakses data, memungkinkan lapisan domain untuk berinteraksi dengan sumber data tanpa mengetahui detail teknisnya.

Pemisahan dari Infrastruktur: Memisahkan logika bisnis dari infrastruktur penyimpanan data, sehingga memungkinkan fleksibilitas dalam penggunaan berbagai jenis sumber data.

Menyediakan Kontrak: Menyediakan kontrak atau API yang jelas untuk mengakses dan memanipulasi data, memungkinkan pengembang untuk mengimplementasikan metode akses data sesuai kebutuhan aplikasi.

Contoh Repository:

Dalam aplikasi berita, ArticleRepository dapat menyediakan metode untuk mengambil artikel dari API, menyimpan artikel ke dalam database lokal, dan menyediakan antarmuka umum untuk interaksi dengan data artikel.

3. Usecases

Usecases atau interaksi adalah bagian dari domain layer yang mengimplementasikan logika bisnis spesifik dari aplikasi. Usecases mengatur bagaimana operasi-operasi bisnis harus dilakukan dengan menggabungkan logika dari beberapa entitas dan menggunakan repositori untuk mengakses data.

Fungsi Usecases:

Mengimplementasikan Logika Bisnis: Menyediakan implementasi dari fitur atau kasus pengguna tertentu, menggabungkan berbagai operasi bisnis yang diperlukan untuk mencapai tujuan tersebut.

Memfasilitasi Interaksi: Menggunakan repositori dan entitas untuk mengeksekusi operasi-operasi yang kompleks atau spesifik dari aplikasi.

Independen dari Infrastruktur: Seperti entitas, usecases tidak tergantung pada teknologi atau infrastruktur tertentu, fokus pada implementasi logika bisnis.

Contoh Usecases:

Dalam aplikasi berita, GetNewsArticlesUseCase dapat memuat daftar artikel dari repositori, menerapkan logika bisnis untuk mengatur data tersebut, dan kemudian mengirimkannya kembali ke lapisan presentasi atau infrastruktur.

Kesimpulan

Masing-masing sub-lapisan dalam domain layer memiliki peran dan tanggung jawab yang jelas dalam mengorganisir dan mengelola logika bisnis serta representasi data dalam aplikasi. Dengan menggunakan pola desain Clean Architecture dan memisahkan secara jelas antara entitas, repository, dan usecases, aplikasi dapat menjadi lebih mudah untuk dikelola, diuji, dan dikembangkan secara fleksibel sesuai dengan kebutuhan bisnis.

----------------------------------------

Pertimbangan untuk Urutan Pembuatan Layer Domain:

Entities:

Penentuan Model Bisnis: Entitas merupakan representasi dari objek-objek utama dalam domain aplikasi. Pembuatan entitas umumnya dilakukan di awal karena mereka membentuk kerangka kerja dari seluruh logika bisnis aplikasi.
Ketergantungan Minim: Entitas harus independen dari teknologi atau infrastruktur tertentu, sehingga mereka bisa digunakan di seluruh lapisan aplikasi tanpa modifikasi yang signifikan.

Repository:

Kontrak Akses Data: Repository menyediakan kontrak atau antarmuka untuk mengakses data. Pembuatan repository dapat dilakukan setelah entitas, karena mereka membutuhkan entitas sebagai bagian dari definisi kontraknya.
Abstraksi Sumber Data: Repository membantu dalam memisahkan logika bisnis dari implementasi teknis sumber data seperti API, database, atau penyimpanan lokal.

Usecases:

Implementasi Logika Bisnis: Usecases atau interaksi adalah tempat di mana logika bisnis spesifik dari aplikasi diimplementasikan. Pembuatan usecases biasanya terjadi setelah entitas dan repository, karena mereka bergantung pada keduanya untuk melakukan operasi-operasi yang dibutuhkan.
Integrasi Operasi Bisnis: Usecases menggabungkan operasi-operasi yang didefinisikan di repository untuk menyelesaikan tugas-tugas atau fitur-fitur aplikasi.