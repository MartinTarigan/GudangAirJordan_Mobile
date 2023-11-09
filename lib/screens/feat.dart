import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/screens/add_form.dart';
import 'package:gudang_air_jordan/widgets/nav_drawer.dart';
import 'package:gudang_air_jordan/screens/list_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.search, Color(0xFF8284ac)),
    ShopItem("Tambah Item", Icons.add_box_rounded, Color(0xFF53558c)),
    ShopItem("Logout", Icons.logout_rounded, Color(0xFF2f3169)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GudangAirJordan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F1D2B),
        foregroundColor: Colors.white,
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Center(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Feature',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, i) => ShopCard(items[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  const ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            if (item.name == "Tambah Item") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddFormPage()),
              );
            } else if (item.name == "Lihat Item") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListItem()),
              );
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(item.name, style: const TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
