*** Domain ***

Berikut penjelasan fungsi-fungsi file di dalam domain layer pada Clean Architecture Flutter:

1. Entities:

- Berisi kelas-kelas yang merepresentasikan model data domain.
- Kelas-kelas ini bersifat immutable dan tidak memiliki logika bisnis.

Contoh: kelas User untuk menyimpan informasi pengguna.

2. Use Cases:

- Mendefinisikan kasus penggunaan dan logika bisnis aplikasi.
- Berinteraksi dengan repository untuk mengambil dan menyimpan data.
- Mengubah data menjadi model domain dan sebaliknya.

Contoh: use case GetUser untuk mengambil data pengguna dari database.

3. Repositories:

- Mengabstraksikan akses ke sumber data eksternal (database, API, dll.).
- Menyediakan interface untuk CRUD (Create, Read, Update, Delete) data.

Contoh: repository UserRepository untuk mengelola data pengguna di database.

4. Contracts:

- Mendefinisikan interface untuk use cases dan repositories.
- Memastikan decoupling antar layer dan testabilitas.

Contoh: interface UserRepositoryContract untuk mendefinisikan operasi CRUD pada data pengguna.

5. Exceptions:

- Mendefinisikan custom exception untuk menangani error di domain layer.
- Membantu pengembang untuk melacak dan menangani error dengan lebih mudah.

Contoh: exception UserNotFoundException untuk menandakan bahwa pengguna tidak ditemukan di database.

6. Value Objects:

- Mewakili nilai-nilai kompleks yang tidak dapat direpresentasikan dengan tipe data dasar.
- Immutable dan memiliki nilai yang unik.

Contoh: value object Email untuk menyimpan alamat email pengguna.

7. Helpers:

- Menyediakan fungsi-fungsi utilitas yang digunakan di seluruh domain layer.

Contoh: fungsi parseDate untuk mengubah string menjadi objek DateTime.

```
domain/
├── entities/
│   ├── user.dart
│   └── ...
├── usecases/
│   ├── get_user.dart
│   └── ...
├── repositories/
│   ├── user_repository.dart
│   └── ...
├── contracts/
│   ├── user_repository_contract.dart
│   └── ...
├── exceptions/
│   ├── user_not_found_exception.dart
│   └── ...
├── value_objects/
│   ├── email.dart
│   └── ...
└── helpers/
    └── date_utils.dart

```
Kesimpulan:

Domain layer pada Clean Architecture Flutter bertanggung jawab untuk mendefinisikan model data, logika bisnis, dan akses ke sumber data. File-file di dalam domain layer diorganisir berdasarkan fungsinya untuk meningkatkan modularitas dan testabilitas.

Catatan:

Implementasi dan struktur file dapat berbeda-beda tergantung pada proyek dan preferensi pengembang.
Penting untuk mengikuti prinsip-prinsip Clean Architecture untuk membangun aplikasi yang scalable, maintainable, dan testable.


*** Data Layer ***

1. data_sources:

- Berisi kelas-kelas konkret yang berinteraksi dengan sumber data eksternal (database, API, dll.).
- Mengimplementasikan detail teknis untuk mengakses dan memanipulasi data.

Contoh:

DatabaseHelper untuk mengakses database lokal.

ApiService untuk melakukan panggilan ke API.

2. models:

- Berisi kelas-kelas yang merepresentasikan model data domain.
- Kelas-kelas ini bersifat immutable dan tidak memiliki logika bisnis.

Contoh:

User untuk menyimpan informasi pengguna.

Product untuk menyimpan informasi produk.

3. repository:

- Mengabstraksikan akses ke sumber data dan menyediakan interface untuk CRUD (Create, Read, Update, Delete) data.
- Berinteraksi dengan data_sources untuk mengambil dan menyimpan data.
- Mengubah data menjadi model domain dan sebaliknya.

Contoh:

UserRepository untuk mengelola data pengguna di database.

ProductRepository untuk mengelola data produk di API.

*** Presentation ***

1. Bloc:

- Tanggung jawab: Mengelola state dan business logic untuk bagian tertentu dari UI.

Karakteristik:
- Bersifat immutable dan thread-safe.
- Berkomunikasi dengan UI melalui events dan states.
- Mengubah events menjadi states dan memperbarui UI.

Contoh: 

UserBloc untuk mengelola state dan business logic terkait user.

2. Pages:

- Tanggung jawab: Menampung struktur layout dan navigasi untuk bagian tertentu dari UI.

Karakteristik:
- Biasanya merupakan StatelessWidget atau StatefulWidget.
- Mengatur bagaimana widgets ditampilkan dan diorganisir.
- Menangani navigasi antar halaman.

Contoh: HomePage untuk menampilkan daftar user.

3. Widgets:

- Tanggung jawab: Elemen UI terkecil yang dapat digunakan untuk membangun layout dan interaksi.

Karakteristik:
- Bersifat immutable dan stateless.
- Dapat digabungkan untuk membangun UI yang kompleks.
- Menangani interaksi pengguna dan menampilkan data.

Contoh: Text, Button, ListView, dan TextField.