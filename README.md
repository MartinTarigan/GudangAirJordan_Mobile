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

## Tugas 8
<details>
<summary>Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!</summary>

- Navigator.push()
    - Metode ini digunakan untuk menavigasi ke halaman baru dan menambahkannya ke tumpukan halaman (stack). Ketika pengguna menekan tombol kembali, mereka akan kembali ke halaman sebelumnya.

- Navigator.pushReplacement()
    - Metode ini juga digunakan untuk menavigasi ke halaman baru, tetapi halaman sebelumnya akan dihapus dari tumpukan. Jadi, ketika pengguna menekan tombol kembali, mereka tidak akan kembali ke halaman sebelumnya.

- Secara umum, Navigator.push() digunakan ketika Anda ingin pengguna dapat kembali ke halaman sebelumnya, sedangkan Navigator.pushReplacement() digunakan ketika Anda tidak ingin pengguna kembali ke halaman sebelumnya, seperti dalam kasus login ke halaman utama aplikasi.
</details>

<details>
<summary>Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!</summary>

- Single-child layout widgets:
    - Align: Widget yang menyesuaikan posisi child-nya dalam dirinya sendiri dan secara opsional menyesuaikan ukurannya berdasarkan ukuran child.
    - AspectRatio: Widget yang mencoba mengukur child dengan rasio aspek tertentu.
    - Baseline: Container yang menempatkan child-nya sesuai dengan baseline child.
    - Center: Widget yang memusatkan child-nya dalam dirinya sendiri.
    - ConstrainedBox: Widget yang memberikan batasan tambahan pada child-nya.
    - Container: Widget yang menggabungkan widget pengecatan, penempatan, dan ukuran yang umum.
    - CustomSingleChildLayout: Widget yang menunda layout child tunggalnya ke delegasi.
    - Expanded: Widget yang memperluas child dari Row, Column, atau Flex.
    - FittedBox: Widget yang menyesuaikan skala dan posisi child-nya dalam dirinya sendiri sesuai dengan fit.
    - FractionallySizedBox: Widget yang mengukur child-nya menjadi sebagian dari ruang total yang tersedia.
    - IntrinsicHeight: Widget yang mengukur child-nya ke tinggi intrinsik child.
    - IntrinsicWidth: Widget yang mengukur child-nya ke lebar intrinsik child.
    - LimitedBox: Kotak yang membatasi ukurannya hanya ketika tidak dibatasi.
    - Offstage: Widget yang meletakkan child seolah-olah berada di pohon, tetapi tanpa melukis apa pun.
    - OverflowBox: Widget yang memberikan batasan yang berbeda pada child-nya daripada yang diterimanya dari orang tuanya.
    - Padding: Widget yang memasukkan child-nya dengan padding yang diberikan.
    - SizedBox: Kotak dengan ukuran tertentu.
    - SizedOverflowBox: Widget yang berukuran tertentu tetapi melewati batasan aslinya ke child-nya.
    - Transform: Widget yang menerapkan transformasi sebelum melukis child-nya.

- Multi-child layout widgets:
    - Column: Menyusun daftar child widget dalam arah vertikal.
    - CustomMultiChildLayout: Widget yang menggunakan delegasi untuk mengukur dan menempatkan beberapa child.
    - Flow: Widget yang mengimplementasikan algoritma layout flow.
    - GridView: Daftar grid terdiri dari pola sel yang berulang yang disusun dalam layout vertikal dan horizontal.
    - IndexedStack: Stack yang menunjukkan satu child dari daftar child.
    - LayoutBuilder: Membangun pohon widget yang dapat bergantung pada ukuran widget orang tua.
    - ListBody: Widget yang menyusun child-nya secara berurutan sepanjang sumbu tertentu.
    - ListView: Daftar scrollable, linear dari widget.
    - Row: Menyusun daftar child widget dalam arah horizontal.
    - Stack: Kelas ini berguna jika Anda ingin menumpuk beberapa child dengan cara yang sederhana.
</details>

<details>
<summary>Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!</summary>

- TextFormField untuk Nama: Input ini digunakan untuk memasukkan nama AirJordan. Validasi memastikan bahwa nama tidak boleh kosong dan harus berupa kata, bukan angka, yang masuk akal karena nama biasanya terdiri dari huruf, bukan digit.
- TextFormField untuk Jumlah: Input ini digunakan untuk memasukkan jumlah produk. Validasi pada input ini memastikan bahwa jumlah tidak boleh kosong dan harus berupa angka, yang penting untuk manajemen inventaris.
- TextFormField untuk Deskripsi: Input ini digunakan untuk memasukkan deskripsi produk. Ini memungkinkan teks bebas namun memastikan bahwa deskripsi tidak boleh kosong dan tidak boleh berupa angka, karena deskripsi harus berupa kalimat atau frase yang menjelaskan produk.
- TextFormField untuk Gambar: Input ini digunakan untuk memasukkan URL gambar produk. Validasi memastikan bahwa bidang ini tidak boleh kosong dan memeriksa jika inputan tidak boleh berupa angka, implisitnya harus berupa URL yang valid.
- TextFormField untuk Harga: Input ini digunakan untuk memasukkan harga produk. Seperti input jumlah, ini harus berupa angka dan tidak boleh kosong, yang penting untuk penentuan harga produk.
- TextFormField untuk Kategori: Input ini digunakan untuk memasukkan kategori produk. Validasi memastikan bahwa kategori tidak boleh kosong dan harus berupa kata.

- Selain itu, ada elemen ElevatedButton yang digunakan untuk mengirim form setelah semua validasi terpenuhi. Ketika tombol ditekan, form akan memvalidasi inputan, dan jika semuanya benar, informasi produk akan disimpan ke daftar produk dan menampilkan dialog konfirmasi.

- Semua elemen input ini dipilih karena mereka memungkinkan pengguna untuk memasukkan berbagai jenis data yang dibutuhkan untuk menciptakan entri produk yang lengkap dan valid. Validasi pada setiap bidang memastikan bahwa data yang dimasukkan sesuai dengan tipe data yang diperlukan untuk setiap atribut produk.
</details>

<details>
<summary>Bagaimana penerapan clean architecture pada aplikasi Flutter?</summary>

- Clean Architecture adalah prinsip desain perangkat lunak yang mempromosikan pemisahan tanggung jawab dan bertujuan untuk menciptakan basis kode yang modular, dapat diskalakan, dan dapat diuji. Penerapan Clean Architecture pada Flutter melibatkan pembagian kode menjadi beberapa lapisan dengan tujuan utama adalah menciptakan sistem yang terorganisir dengan baik di mana setiap bagian memenuhi peran yang bermakna dan intuitif sambil memaksimalkan kemampuannya untuk beradaptasi dengan perubahan.

- Berikut adalah lapisan-lapisan dalam Clean Architecture:
    - Data Layer: Lapisan ini bertanggung jawab atas pengambilan data, baik itu dari database lokal, API, atau sumber lain.
    - Domain Layer: Lapisan ini berisi semua aturan bisnis. Biasanya, ini adalah model dan repositori.
    - Presentation Layer: Lapisan ini berisi kode yang berkaitan dengan UI2. Biasanya, ini adalah widget dan BLoC (Business Logic Component).
    - Resource Layer: Lapisan ini berisi sumber daya seperti string, gambar, tema, dan lainnya.
    - Shared Library Layer: Lapisan ini berisi kode yang dapat digunakan kembali di seluruh aplikasi.
</details>

<details>
<summary>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)</summary>

<details>

<summary>Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru 
</summary>

- Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.

    - Pertama-tama, developer membuat sebuah class yang merupakan StatefulWidget karena formulir ini akan berubah-ubah state-nya ketika user melakukan input. Class AddFormPage ini akan menjadi kerangka untuk halaman formulir.

    - Di dalam State dari AddFormPage, developer mendefinisikan beberapa variabel yang akan menampung nilai dari setiap TextFormField yang sesuai dengan atribut model pada aplikasi Django yang telah dibuat sebelumnya.

    - Developer menggunakan GlobalKey untuk FormState untuk mengontrol form dari luar widget form itu sendiri, misalnya untuk melakukan validasi form.


- Memiliki sebuah tombol Save.
    - Setelah semua input telah diisi dan divalidasi, tombol 'Save' akan memicu dialog yang menampilkan informasi yang telah diinput dan menyimpannya ke dalam list item 

- Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut: Setiap elemen input tidak boleh kosong, Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

    - Setiap TextFormField memiliki validator yang memastikan bahwa field tersebut tidak boleh kosong dan harus sesuai dengan tipe data atribut modelnya. Sebagai contoh, untuk nama yang harus berupa string, validator akan menolak nilai yang merupakan angka.

</details>

<details>
<summary>Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.</summary>

- Untuk mengarahkan pengguna ke halaman form tambah item baru saat tombol "Tambah Item" ditekan pada halaman utama, developer telah membuat sebuah ShopCard widget yang merupakan StatelessWidget. Di dalam widget ini, InkWell digunakan untuk menangani ketukan, dan menggunakan Navigator.push untuk berpindah halaman.

- Ketika InkWell di-tap, kondisi dicek untuk nama item. Jika nama item adalah "Tambah Item", maka aplikasi akan melakukan navigasi ke AddFormPage yang merupakan halaman formulir untuk menambah item baru. Jika nama item adalah "Lihat Item", maka akan navigasi ke ListItem yang mungkin merupakan halaman untuk menampilkan daftar item. Untuk kondisi lainnya, sebuah SnackBar akan ditampilkan memberitahukan pengguna bahwa mereka telah menekan tombol dengan nama item tersebut. Berikut code nya:

```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding dan styling untuk card
      child: Container(
        // Container untuk styling card
        child: InkWell(
          onTap: () {
            // Ini adalah bagian yang menangani ketukan pada card
            if (item.name == "Tambah Item") {
              // Jika nama item adalah "Tambah Item"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddFormPage()));
                // Mengarahkan pengguna ke AddFormPage
            } else if (item.name == "Lihat Item") {
              // Jika nama item adalah "Lihat Item"
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ListItem()));
                // Mengarahkan pengguna ke ListItem
            } else {
              // Untuk nama item lainnya
              ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")));
                  // Menampilkan SnackBar dengan nama item
            }
          },
          // Child untuk InkWell yang berisi Icon dan Text
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Styling untuk icon dan text
          ),
        ),
      ),
    );
  }
}
```
</details>

<details>
<summary>Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
</summary>

- Setelah semua input telah diisi dan divalidasi, tombol 'Save' akan memicu dialog yang menampilkan informasi yang telah diinput dan menyimpannya ke dalam list item. Berikut code nya:

```dart
Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF8284ac)),
        ),
        onPressed: () {
            if (_formKey.currentState!.validate()) {
            listItem.add(AirJordan(_name, _amount, _description,
                _category, _price, _image));
            showDialog(
                context: context,
                builder: (context) {
                    return AlertDialog(
                    title: const Text(
                        'AirJordan berhasil tersimpan',
                        style: TextStyle(
                        color: Colors.white,
                        ),
                    ),
                    content: SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                            Text('Name: $_name'),
                            Text('Amount: $_amount'),
                            Text('Description: $_description'),
                            Image.network(_image),
                            Text('Price: $_price'),
                            Text('Category: $_category'),
                        ],
                        ),
                    ),
                    actions: [
                        TextButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const DashboardPage(),)
                        ),
                        child: const Text('OKAY')
                        )
                    ],
                    );
                }
                );
            _formKey.currentState!.reset();
            }
        },
        child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
        ),
        ),
    ),
),
```

</details>

<details>
<summary>Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut: Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item, Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama, Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.</summary>

- Untuk membuat sebuah drawer yang memungkinkan pengguna untuk navigasi antar halaman dalam aplikasi Flutter, developer dapat menggunakan widget Drawer. Di dalam Drawer, kita memasukkan ListView yang berisi ListTile untuk setiap opsi navigasi. Berikut code nya:

```dart
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @Override
  Widget build(BuildContext context) {
    return Drawer(
      // Styling untuk Drawer
      backgroundColor: const Color(0xFF2f3169),
      child: ListView(
        // ListView untuk item-item di dalam Drawer
        children: [
          const SizedBox(
            // Drawer header dengan informasi aplikasi atau branding
          ),
          ListTile(
            // ListTile untuk navigasi ke Halaman Utama
            tileColor: const Color(0xFF2f3169),
            leading: const Icon(
              // Icon untuk Halaman Utama
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text(
              // Teks untuk Halaman Utama
              'Halaman Utama',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              // Ketika ListTile ini ditekan, navigasikan ke DashboardPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                )
              );
            }
          ),
          ListTile(
            // ListTile untuk navigasi ke halaman form tambah item baru
            tileColor: const Color(0xFF2f3169),
            leading: const Icon(
              // Icon untuk Tambah Item
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            title: const Text(
              // Teks untuk Tambah Item
              'Tambah Item',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () {
              // Ketika ListTile ini ditekan, navigasikan ke AddFormPage
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFormPage()));
            }
          ),
          // Anda bisa menambahkan lebih banyak ListTile untuk opsi lain
        ],
      ),
    );
  }
}
```

- Dalam kode di atas, Navigator.pushReplacement digunakan untuk navigasi ke DashboardPage yang menggantikan halaman saat ini sehingga tidak kembali ke drawer ketika pengguna menekan tombol kembali. Sementara itu, Navigator.push digunakan untuk menambah halaman ke stack navigasi, yang memungkinkan pengguna untuk kembali ke halaman sebelumnya dengan tombol kembali.

</details>

<details>
<summary>Penjelasan Bonus</summary>

- Pertama, developer membuat class AirJordan untuk membuat object AirJordan sebagai item. Kemudian developer juga membuat sebuah list yang menyimpan object-object AirJordan. Berikut codenya:

    ```dart
    List<AirJordan> listItem = [];

    class AirJordan {
        final String name;
        final int amount;
        final String description;
        final String category;
        final int price;
        final String image;

        AirJordan(this.name, this.amount, this.description, this.category, this.price,
            this.image);
    }
    ```

- Kemudian, developer membuat page baru untuk menampilkan item-item. Untuk menampilkan item-item, developer mengiterasikan setiap item yang merupakan object AirJordan (penjelasan bagaimana implementasi penyimpanan object telah dijelaskan di checklist sebelumnya). Berikut code nya

```dart
class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Item",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: const Color(0xFF2f3169),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Column(
                children: listItem.map((AirJordan item) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ItemCard(item)
                  );
                }).toList(),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final AirJordan item;

  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
          color: const Color(0xFF53558c),
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Image.network(item.image),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Rp${item.price.toString()}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Amount: ${item.amount.toString()}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
    );
  }
}

```
</details>

</details>

## Tugas 9

<details><summary>Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?</summary>
Menurut saya, hal tersebut bisa dilakukan. Setiap value dari json dapat disimpan di dalam variabel global. Hanya saja praktik seperti itu tidak mengikuti best practice. Menurut saya lebih baik menggunakan pendekatan Object Oriented Programming dengan model.
</details>

<details><summary>Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.</summary>

- CookieRequest dalam konteks Flutter dan integrasi dengan web service (seperti Django) merupakan kelas yang memfasilitasi pengelolaan cookies dalam permintaan HTTP. Ini sangat berguna, terutama dalam kasus-kasus seperti autentikasi dan sesi pengguna, di mana cookies digunakan untuk mempertahankan status sesi antara klien (aplikasi Flutter) dan server (misalnya, backend Django).

- Fungsi CookieRequest:

  - Pengelolaan Sesi 
    CookieRequest memungkinkan aplikasi untuk mengelola sesi pengguna. Saat pengguna login, server biasanya mengirim cookie yang berisi token sesi atau identifikasi unik lainnya. CookieRequest membantu menyimpan dan mengirimkan cookie ini kembali ke server pada permintaan berikutnya, memungkinkan server untuk mengenali dan memvalidasi sesi pengguna.

  - Kemudahan dalam Permintaan HTTP
    Dengan CookieRequest, pengembang tidak perlu secara manual menangani cookies untuk setiap permintaan HTTP. Kelas ini secara otomatis menangani penyimpanan dan penambahan cookies ke header permintaan, membuat kode lebih bersih dan lebih mudah untuk dijaga.

  - Keamanan
    Pengelolaan cookie yang tepat penting untuk menjaga keamanan aplikasi. CookieRequest membantu memastikan bahwa cookies dihandle dengan cara yang aman, mengurangi risiko kebocoran informasi atau penyalahgunaan sesi.

- Pentingnya Membagikan CookieRequest ke Semua Komponen:
  - Konsistensi Sesi
    Dengan membagikan instance CookieRequest yang sama ke seluruh aplikasi, kita memastikan bahwa semua permintaan HTTP memiliki akses ke informasi sesi yang sama. Ini penting untuk menjaga konsistensi status login dan informasi pengguna di seluruh aplikasi.

  - Pengurangan Duplikasi
    Tanpa pembagian instance CookieRequest, setiap komponen atau layar mungkin perlu membuat instance sendiri dan mengelola cookies-nya sendiri. Ini bisa menyebabkan duplikasi kode dan kesulitan dalam pengelolaan sesi yang konsisten.

  - Manajemen Sumber Daya
    Dengan menggunakan satu instance CookieRequest melalui mekanisme seperti Provider, aplikasi dapat mengelola sumber dayanya secara lebih efisien. Ini mengurangi beban memori dan memastikan bahwa pengelolaan cookie dilakukan secara terpusat.

  - Integrasi dengan State Management
    Dalam aplikasi Flutter yang lebih besar, pengelolaan state adalah aspek penting. Menggunakan Provider untuk membagikan CookieRequest memudahkan integrasi dengan sistem manajemen state aplikasi, memungkinkan perubahan state (seperti status login) untuk diteruskan secara efisien ke seluruh aplikasi.

- Secara keseluruhan, CookieRequest memainkan peran penting dalam mengelola interaksi antara aplikasi Flutter dan backend web service, memudahkan autentikasi dan pengelolaan sesi, serta memastikan integrasi yang mulus dan efisien di seluruh komponen aplikasi.
</details>

<details><summary>Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.</summary>

Mekanisme pengambilan data dari JSON dan menampilkannya pada Flutter melibatkan beberapa langkah penting. Berikut adalah proses umum yang diikuti:

1. Melakukan Permintaan HTTP

    Pertama, aplikasi Flutter perlu mengirim permintaan HTTP ke web service atau API yang menyediakan data dalam format JSON. Ini biasanya dilakukan menggunakan package http, yang memungkinkan pengiriman permintaan GET (atau POST, tergantung pada API) untuk mengambil data.
  
2. Menerima dan Mengurai Respons JSON

    Setelah permintaan terkirim dan mendapat respons, data yang diterima biasanya dalam format JSON. Langkah selanjutnya adalah mengurai atau mendekode JSON tersebut menjadi struktur data Dart yang dapat digunakan oleh aplikasi.

3. Mendefinisikan Model Data

    Untuk memudahkan manipulasi data di Flutter, sering kali dibuat model data yang mencerminkan struktur JSON. Model ini adalah kelas Dart yang memiliki properti untuk setiap bidang data yang relevan dalam JSON.
  
4. Konversi JSON ke Objek Model

    Data JSON yang didekode kemudian diubah menjadi objek-objek model. Jika respons JSON adalah sebuah array, Anda akan mengubah setiap item dalam array menjadi objek model.

5. Menampilkan Data pada UI

    Terakhir, data yang telah dikonversi ke dalam model Flutter kini siap untuk ditampilkan dalam UI. FutureBuilder atau StreamBuilder sering digunakan untuk menunggu data yang dimuat secara asinkron dan membangun widget berdasarkan data tersebut.
</details>

<details><summary>Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.</summary>

1. Input Data Akun pada Flutter

    Pengguna memasukkan kredensialnya (biasanya username dan password) melalui sebuah form login pada aplikasi Flutter.

2. Mengirim Permintaan Autentikasi ke Django

    Setelah mengisi form, pengguna menekan tombol login, yang memicu aplikasi Flutter untuk mengirimkan permintaan HTTP ke server Django. Permintaan ini biasanya berupa permintaan POST dengan kredensial yang disertakan dalam body permintaan.

3. Memproses Permintaan di Django

    Di sisi server Django, permintaan diterima dan diproses. Django memeriksa kredensial yang dikirimkan melawan database penggunanya. Jika kredensial benar, Django akan membuat sesi untuk pengguna dan mengirimkan respons yang sesuai kembali ke aplikasi Flutter. Respons ini biasanya mencakup token atau cookie sesi.

4. Menerima dan Menangani Respons di Flutter

    Aplikasi Flutter kemudian menerima respons dari server Django. Jika autentikasi berhasil, aplikasi mungkin menyimpan token atau cookie sesi yang diterima untuk digunakan dalam permintaan berikutnya.

5. Menampilkan Menu atau Halaman Utama

    Setelah autentikasi berhasil, aplikasi Flutter akan menavigasi pengguna ke menu utama atau halaman utama aplikasi. Di sini, pengguna dapat mengakses fitur-fitur yang tersedia setelah login, seperti melihat profil, mengubah pengaturan, atau melakukan aktivitas lain yang memerlukan autentikasi.
</details>

<details><summary>Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.</summary>

Menurut saya hanya ada dua widget baru untuk tugas ini

- FutureBuilder

    Berfungsi untuk membangun widget berdasarkan hasil terbaru dari Future. Dalam konteks fetching data, digunakan untuk membangun UI setelah data diterima dari permintaan HTTP.

- CircularProgressIndicator

    Berfungsi untuk menampilkan indikator loading berputar, digunakan untuk memberi tahu pengguna bahwa aplikasi sedang menunggu proses (misalnya, memuat data).

</details>

<details><summary>Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).</summary>

<details><summary>Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.</summary>

![](https://github.com/MartinTarigan/GudangAirJordan_App/assets/113441970/15b0135f-6b14-42e7-a46b-c417590cacc4)

proyek tgugas Django saya telah berjalan dengan baik dan dapat diakses pada http://martin-marcelino-tugas.pbp.cs.ui.ac.id/

*hanya saja saat ini web sedang tidak handle login, tetapi fungsioanalitas integrasi Flutter berjalan dengan baik
</details>

<details><summary>Membuat halaman login pada proyek tugas Flutter.</summary>
<br>
developer telah mengimplementasikan beberapa fitur penting:

- Impor Paket yang Diperlukan

  Developer mengimpor paket yang diperlukan seperti Material Design untuk UI, paket untuk autentikasi (pbp_django_auth), dan provider untuk state management.


- Pengaturan Aplikasi Login

  - Developer mendefinisikan class LoginApp yang merupakan StatelessWidget. Di sini, aplikasi didefinisikan dengan tema dasar dan halaman utama diatur ke LoginPage.

- Halaman Login

  LoginPage adalah StatefulWidget yang memungkinkan interaksi dengan pengguna dan perubahan state. Di dalamnya, developer mendefinisikan TextEditingController untuk mengendalikan input dari pengguna.

- Pengaturan UI

  - UI halaman login dibuat dengan widget Scaffold dan Container. Di dalamnya, terdapat TextField untuk input username dan password, serta ElevatedButton untuk proses login.

- Proses Login

  - Ketika tombol login ditekan, aplikasi akan mengambil teks dari TextEditingController dan mengirim permintaan login ke server Django menggunakan paket pbp_django_auth. Ini menunjukkan penggunaan async dan await untuk permintaan HTTP. Berikut code nya:

  - 
    ```dart
    onPressed: () async {
      String username = _usernameController.text;
      String password = _passwordController.text;

      final response =
          await request.login("http://martin-marcelino-tugas.pbp.cs.ui.ac.id/auth/login/", {
        'username': username,
        'password': password,
      });
    }
    ```

- Navigasi dan Feedback

  - Jika login berhasil, aplikasi akan menavigasi pengguna ke DashboardPage dan menampilkan SnackBar sebagai feedback. Jika gagal, aplikasi akan menampilkan AlertDialog. Berikut code nya:

  - 
    ```dart
    if (request.loggedIn) {
        String message = response['message'];
        loggedInUser = User(username: username, password: password);
        userDb.add(loggedInUser);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const DashboardPage()),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text(
                  "$message Selamat datang, ${loggedInUser.username}.")));
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: Text(response['message']),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }
    ```

- Navigasi ke Halaman Pendaftaran

  - Untuk pengguna yang belum memiliki akun, ada opsi untuk berpindah ke SignUpPage menggunakan GestureDetector. Berikut code nya:

  - 
    ```dart
    GestureDetector (
      onTap: () => Navigator.pushReplacement(
      context,
      MaterialPageRoute (
        builder: (context) => const SignUpPage(),
      )
      ),
      child: const Text(
        'Don\'t have an account yet?',
        style: TextStyle(
          color: Colors.blue
        ),
      ),
    )
    ```


<details><summary>Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.</summary>
</details>
<br>
Untuk mengintegrasikan sistem autentikasi Django dengan proyek Flutter Anda, developer telah mengambil langkah-langkah berikut:

- Di Sisi Flutter

  - Pengendalian Input Pengguna

    - Developer menggunakan TextEditingController untuk mengumpulkan input pengguna seperti username dan password.

    - 
      ```dart
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      String username = _usernameController.text;
      String password = _passwordController.text;
      ```

  - Permintaan HTTP untuk Autentikasi

    - Login

      - Menggunakan request.login dengan URL endpoint login Django. Data yang dikirim adalah username dan password pengguna.

      - 
        ```dart
        final response =
          await request.login("http://martin-marcelino-tugas.pbp.cs.ui.ac.id/auth/login/", {
          'username': username,
          'password': password,
          }
        );
        ```
  
    - SignUp
      Akan dijelaskan di bagian penjelasan bonus

    - Logout
      - Mengirim permintaan logout ke endpoint logout Django.

      - 
        ```dart
        else if (item.name == "Logout") {
          final response = await request.logout(
          "http://martin-marcelino-tugas.pbp.cs.ui.ac.id/auth/logout/");
          String message = response["message"];
        }
        ```
- Di Sisi Django

  - Endpoint Login

    - Menggunakan decorator @csrf_exempt untuk mengizinkan permintaan tanpa token CSRF, yang umum untuk aplikasi Flutter.

    - Fungsi login menerima POST request, mengekstrak username dan password, dan menggunakan authenticate untuk memverifikasi pengguna.

    - 
      ```python
      @csrf_exempt
      def login(request):
          print(request.body) #debug
          username = request.POST['username']
          password = request.POST['password']
          user = authenticate(username=username, password=password)
          if user is not None:
              if user.is_active:
                  auth_login(request, user)
                  # Status login sukses.
                  return JsonResponse({
                      "username": user.username,
                      "status": True,
                      "message": "Login sukses!"
                  }, status=200)
              else:
                  return JsonResponse({
                      "status": False,
                      "message": "Login gagal, akun dinonaktifkan."
                  }, status=401)

          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, periksa kembali email atau kata sandi."
              }, status=401)
   
      ```


    - Jika autentikasi berhasil, auth_login dipanggil untuk login pengguna dan mengembalikan respons JSON dengan status dan pesan.

  - Endpoint Logout

    - Fungsi logout memanggil auth_logout untuk logout pengguna dan mengirim respons JSON.

    - 
      ```python
      @csrf_exempt
      def logout(request):
          username = request.user.username

          try:
              auth_logout(request)
              return JsonResponse({
                  "username": username,
                  "status": True,
                  "message": "Logout berhasil!"
              }, status=200)
          except:
              return JsonResponse({
              "status": False,
              "message": "Logout gagal."
              }, status=401)
      ```

  - Endpoint SignUp

    Akan dijelaskan pada bagian penjelasan bonus

- Integrasi Keseluruhan

  - Autentikasi ini menggabungkan pengelolaan state di Flutter dengan validasi dan manajemen sesi di sisi Django. Flutter bertindak sebagai frontend yang mengirimkan permintaan ke backend Django.

  - Backend Django menangani autentikasi, pendaftaran, dan logout pengguna.

  - Komunikasi antara Flutter dan Django terjadi melalui HTTP requests, di mana Flutter mengirim data ke Django, dan Django memprosesnya dan mengirimkan respons.

<details><summary>Membuat model kustom sesuai dengan proyek aplikasi Django.</summary>

- Pertama, developer menjalankan endpoint JSON dan copy Json Response (response dari endpoint)

- Kemudian, developer menggunakan situs web http://app.quicktype.io/ untuk membuat model secara otomatis berdasarkan JSON

- Developer melakukan setup name menjadi AirJordan, source type JSON, dan languange dart. Setelah itu, developer paste JSON Response yang tadi telah di copy.

- Setelah mendapatkan snippet code dari Quicktype, developer copy paste seluruh code ke item.dart

</details>

<details><summary>Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.</summary>

- Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.

  Untuk membuat halaman yang menampilkan daftar semua item dari endpoint JSON Django, developer telah mengambil langkah-langkah penting berikut dalam kode Flutter:

  - Impor Paket yang Diperlukan

    - Developer mengimpor paket seperti http untuk permintaan HTTP, dart:convert untuk decoding data JSON, dan widget-widget Flutter yang diperlukan.

  - Class ItemPage

    - ItemPage adalah StatefulWidget yang akan mengelola state halaman item.

    - Developer menggunakan FutureBuilder untuk menangani data asinkron yang didapatkan dari permintaan HTTP.

  - Fungsi fetchItem

    - Fungsi ini mengirim permintaan HTTP ke endpoint JSON Django dan mengambil data item.

    - 
    ```python
    def show_json(request):
      data = AirJordan.objects.all()
      return HttpResponse(serializers.serialize("json", data), content_type="application/json")
    ```

    - Data yang diterima didekode dan diubah menjadi list objek AirJordan menggunakan AirJordan.fromJson.

  - UI Halaman Item
  
    - Di dalam FutureBuilder, developer mengecek status data.

      - Jika data belum ada, tampilkan CircularProgressIndicator untuk menunjukkan proses loading.

      - Jika data ada, gunakan ListView.builder untuk membuat daftar item.

    - Setiap item dalam daftar menampilkan name, amount, dan description.

    - 
      ```dart
      Column(
        children: [
          Image.network(
              "${snapshot.data![index].fields.linkImage}"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.0,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                      ),
                      Text(
                        "Rp${snapshot.data![index].fields.price}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  children: [
                    Text(
                      "Amount: ${snapshot.data![index].fields.amount}",
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 300,
            child: Text("${snapshot.data![index].fields.description}")
          ),
          const SizedBox(height: 20,)
        ],
      ),
      ```

    - Untuk setiap item, ada juga sebuah InkWell yang membungkus konten, memungkinkan navigasi ke halaman detail ketika di-tap.

    - 
      ```dart
      InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(snapshot.data![index]))),
      )
      ```
  - Penampilan Data Item

    - Di dalam ListView.builder, setiap item ditampilkan dalam format yang user-friendly.

    - Informasi seperti nama produk, harga, jumlah, dan deskripsi ditampilkan dengan menggunakan widget Text.

    - Gambar produk di-load dari URL menggunakan Image.network.
</details>

<details><summary>Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.</summary>
<br>
Untuk membuat halaman detail setiap item yang terdapat pada halaman daftar Item, developer telah menerapkan beberapa langkah penting:

- Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.

  - Dalam ItemPage, setiap item dalam ListView dibungkus dengan InkWell yang memiliki onTap event. Event ini memicu navigasi ke halaman Detail dengan mengirimkan data item yang relevan (AirJordan object) ke halaman tersebut.
  Berikut codenya:

  - 
    ```dart
    child: InkWell (
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(snapshot.data![index]))),
    )
    ```


- Tampilkan seluruh atribut pada model item kamu pada halaman ini.

  - Halaman Detail

    - Detail adalah StatelessWidget yang menerima objek AirJordan sebagai parameter.

    - Di dalamnya, terdapat AppBar yang menampilkan judul halaman.

    - Konten halaman dibungkus dalam SingleChildScrollView untuk memastikan halaman dapat discroll jika kontennya lebih panjang dari tinggi layar.

    - ItemCard digunakan untuk menampilkan detail item.

  - Komponen ItemCard

    - ItemCard juga merupakan StatelessWidget yang menerima objek Fields dari AirJordan sebagai parameter.

    - Widget ini mengatur bagaimana informasi detail item ditampilkan.

    - Setiap aspek dari item (seperti nama, harga, jumlah, deskripsi, kategori, dan tanggal penambahan) ditampilkan menggunakan widget Text.

    - Gambar item ditampilkan dengan Image.network.

  - Penampilan Atribut Item

    - Setiap atribut item (name, price, amount, description, category, date added) ditampilkan secara rinci.

    - Developer menggunakan Padding dan SizedBox untuk memberikan ruang dan memformat tampilan atribut tersebut agar mudah dibaca.

- Tambahkan tombol untuk kembali ke halaman daftar item.
  - Karena pengaksesesan halaman detail menggunakan `Navigator.push` maka pada halaman detail sudah secara otomatis terdapat tombol back menuju halaman daftar item berbentuk arrow yang terletak di ujung kiri atas
</details>

</details>

<details><summary>Penjelasan bonus</summary>

<details><summary>Mengimplementasikan fitur registrasi akun pada aplikasi Flutter.</summary>
<br>
Untuk mengimplementasikan fitur registrasi akun pada aplikasi Flutter Anda, developer telah menggunakan beberapa teknik penting:

1. Struktur Aplikasi dan UI

  - Developer mendefinisikan SignUpApp sebagai StatelessWidget yang menjalankan aplikasi Flutter dengan SignUpPage sebagai halaman utama.

  - SignUpPage adalah StatefulWidget, yang memungkinkan pembaruan state berdasarkan interaksi pengguna, penting untuk formulir pendaftaran.

  - UI dibuat menggunakan Scaffold dan Container, dengan TextField untuk memasukkan username, password, dan konfirmasi password.

2. Kontroler untuk Input Pengguna

  - Developer menggunakan TextEditingController untuk mengelola input pengguna, yang memungkinkan pengambilan data dari field input ketika pengguna menekan tombol pendaftaran.

3. Permintaan SignUp

  - Ketika tombol SignUp ditekan, aplikasi mengambil teks dari controller dan membuat permintaan HTTP ke server Django untuk proses pendaftaran menggunakan request.login.

  - Data yang dikirim adalah username, password1, dan password2.

4. Penanganan Respons

  - Developer menangani respons dari server dengan cara yang berbeda tergantung pada status pendaftaran:

    - Berhasil

      Jika pendaftaran berhasil (response["status"] true), navigasikan pengguna ke LoginPage.

    - Gagal

      Jika pendaftaran gagal, tampilkan AlertDialog dengan pesan kesalahan dari respons.

  - Di Sisi Flutter

    - Pengendalian Input Pengguna

      - Developer menggunakan TextEditingController untuk mengumpulkan input pengguna seperti username dan password.

    - Permintaan HTTP untuk Autentikasi

      - SignUp
        - Sama seperti login, tetapi endpointnya adalah untuk signup, dan data yang dikirim termasuk username, password1 (password), dan password2 (konfirmasi password).

  - Di Sisi Django

    - Endpoint SignUp

      - Menggunakan UserCreationForm untuk membuat akun pengguna baru.

      - Jika form valid dan pengguna berhasil dibuat, respons JSON dengan status dan pesan dikirimkan.

      - 
        ```python
        @csrf_exempt
        def signup(request):
            if request.method == "POST":
                user = UserCreationForm(request.POST)
                print(request.POST) #debug
                if user.is_valid():
                    user.save()
                    return JsonResponse({
                        "status": True,
                        "message": "Successfully Signed Up!",
                    }, status=200)
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Failed to Sign Up, Account Disabled."
                    }, status=401)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Failed to Sign Up, check your username/password."
                }, status=401)
        ```

5. Navigasi Alternatif

  - Terdapat opsi untuk pengguna yang sudah memiliki akun untuk langsung menuju ke LoginPage.
</details>

<details><summary>Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.</summary>
<br>
Developer telah mengimplementasikan fitur ini dengan menggunakan teknologi Flutter dan Django sebagai berikut:

- Di Sisi Flutter

  - Pengambilan Data Produk Berdasarkan Pengguna

    - Fungsi fetchItem mengirim permintaan HTTP ke endpoint Django yang khusus mengembalikan item-item terkait dengan pengguna tertentu.

    - URL yang digunakan menyertakan username dari loggedInUser untuk memastikan bahwa hanya item yang terkait dengan pengguna tersebut yang diambil.

    - Respon dari server Django kemudian didekode dan diubah menjadi list objek AirJordan.

    - 
      ```dart
      Future<List<AirJordan>> fetchItem() async {
        var url = Uri.parse('http://martin-marcelino-tugas.pbp.cs.ui.ac.id/json-user/${loggedInUser.username}');
        var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
        );

        var data = jsonDecode(utf8.decode(response.bodyBytes));

        List<AirJordan> listItem = [];
        for (var d in data) {
          if (d != null) {
            listItem.add(AirJordan.fromJson(d));
          }
        }
        return listItem;
      }
      ```

- Di Sisi Django

  - View show_json_by_user

    - View ini mengambil username dari URL dan mengidentifikasi objek User terkait di database Django.

    - Menggunakan filter pada model AirJordan untuk mendapatkan semua item yang terkait dengan pengguna tersebut.

    - Mengembalikan data tersebut dalam format JSON sebagai respon HTTP.

    -  
      ```python
      def show_json_by_user(request, username):
        print(request.body) #debug

        user = User.objects.get(username=username)
        data = AirJordan.objects.filter(user=user)

        response = HttpResponse(serializers.serialize("json", data), content_type="application/json")
        return response
      ```

- Integrasi dan Fungsi Keseluruhan

  - Saat pengguna login dan mengakses halaman daftar item di aplikasi Flutter, aplikasi tersebut membuat permintaan ke server Django dengan username pengguna.

  - Server Django kemudian mengembalikan hanya item-item yang terkait dengan pengguna tersebut, sesuai dengan logic pada view show_json_by_user.

  - Flutter menerima data ini dan membangun UI untuk menampilkan item-item tersebut kepada pengguna.

</details>

</details>


