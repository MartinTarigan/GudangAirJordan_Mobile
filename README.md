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




