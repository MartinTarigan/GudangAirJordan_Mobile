# Gudang Air Jordan Mobile App

## Tech Stack
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=green) 

## Tugas 7
<details>
<summary>Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</summary>

- Stateless Widget
    - StatelessWidget adalah widget yang nilai state-nya tidak dapat berubah (immutable) maka widget tersebut lebih bersifat statis dan memiliki interaksi yang terbatas.

- Stateful Widget
    - Kebalikan dari StatelessWidget, StatefulWidget ialah widget yang state-nya dapat berubah-ubah nilainya, yang berarti StatefulWidget bersifat dinamis dan memiliki interaksi yang tak terbatas.
</details>
<details>
<summary>Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.</summary>

- Berikut adalah daftar widget yang saya gunakan dalam tugas ini:

    - MaterialApp: Widget root yang mengonfigurasi Material Design dan menyertakan tema, navigasi, dan lainnya.
    - ThemeData: Digunakan untuk mendefinisikan tema aplikasi, seperti warna, font, dan lainnya.
    - TextTheme: Digunakan untuk mendefinisikan gaya teks yang berbeda dalam aplikasi.
    - TextStyle: Digunakan untuk mendefinisikan gaya teks seperti warna, ukuran font, dll.
    - ColorScheme: Digunakan untuk mendefinisikan skema warna yang akan digunakan dalam aplikasi.
    - Scaffold: Menyediakan struktur visual tingkat atas yang mencakup toolbar, drawer, bottom sheet, dll.
    - AppBar: Menampilkan toolbar di bagian atas aplikasi.
    - Text: Widget untuk menampilkan teks.
    - SingleChildScrollView: Memungkinkan kontennya dapat di-scroll jika melebihi ruang yang tersedia.
    - Padding: Menambahkan padding di sekitar widget anaknya.
    - Column: Menyusun anak-anaknya dalam arah vertikal.
    - SizedBox: Digunakan untuk memberikan ukuran tetap pada widget anaknya.
    - ListView.builder: Digunakan untuk membuat daftar item yang dapat di-scroll secara horizontal.
    - Container: Digunakan untuk membuat kotak model visual dan dapat menampung widget lainnya.
    - InkWell: Digunakan untuk menambahkan efek sentuhan pada widget.
    - Icon: Menampilkan ikon dari galeri ikon material.
    - BorderRadius: Digunakan untuk membuat sudut lengkung pada widget.
</details>

<details>
<summary>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)</summary>

<details>
<summary>Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.</summary>

- Developer menggunakan ide aplikasi inventory yang sama dengan aplikasi web sebelumnya, yaitu GudangAirJordan, sebuah aplikasi yang dapat menyimpan sepatu-sepatu AirJordan
</details>

<details>
<summary>Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item, Menambah item,  Logout</summary>

- Developer menggunakan pendekatan lain, yaitu ListViewBuilder. ListViewBuilder memungkinkan setiap card dapat tersusun menyamping (Row) dan card tersebut dapat di-swipe. Berikut codenya:

```dart
SizedBox(
    height: 300,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, i) {
            return ShopCard(items[i]);
    },
),
),
```

- Untuk class object Card nya sendiri, developer membuat class baru (mirip seperti tutorial) dengan atribut tambahan, yaitu Color (akan dijelaskan pada section penjelasan bonus). 

- Kemudian developer membuat class yang merupakan stateless widget untuk membentuk suatu card widget. Struktur kurang lebih mirip, hanya saja perbedaan nya adalah developer menggunakan sizedbox sebagai container dan juga sebagai pemberi jarak antar widget.
</details>

<details>
<summary>Memunculkan Snackbar dengan tulisan:
 "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
 "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
 "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.</summary>

- Developer menggunakan arrow function untuk pengimplementasian SnackBar. Developer menyadari bahwa sebenarnya tidak perlu menggunakan function `hideCurrentSnackBar` sehingga action dari onTap hanyalah satu, yaitu `showSnackBar`. Karena hanya satu action, maka developer menggunakan arrow function. Berikut codenya:

```dart
InkWell(
    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Kamu telah menekan tombol ${item.name}"))
),)
```
</details>

</details>

<details>
<summary>
Penjelasan Bonus
</summary>

- Developer menambahkan atribut baru yaitu color untuk menyimpan warna sehingga tiap object memiliki warna yang unik. Berikut code penambahan atribut dan pengimplementasiannya:

```dart
// Berada di dalam widget Dashboard
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.search, const Color(0xFF8284ac)),
    ShopItem("Tambah Item", Icons.add_box_rounded, const Color(0xFF53558c)),
    ShopItem("Logout", Icons.logout_rounded, const Color(0xFF2f3169)),
  ];

// Class untuk menginstansiasi object
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

// Implementasi
Container(
    width: 240,
    decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(10), 
    ),
)
```
</details>

