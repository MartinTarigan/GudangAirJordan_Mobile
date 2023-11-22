import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/models/user.dart';
import 'package:gudang_air_jordan/screens/add_form.dart';
import 'package:gudang_air_jordan/screens/dj_item_all.dart';
import 'package:gudang_air_jordan/screens/dj_item_user.dart';
import 'package:gudang_air_jordan/screens/login_page.dart';
import 'package:gudang_air_jordan/widgets/nav_drawer.dart';
import 'package:gudang_air_jordan/screens/list_item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static const List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.search, Color(0xFF8284ac)),
    ShopItem("Tambah Item", Icons.add_box_rounded, Color(0xFF53558c)),
    ShopItem("Lihat Item User", Icons.search, Color.fromARGB(255, 48, 51, 116)),
    ShopItem("Lihat Semua Item", Icons.add_box_rounded,
        Color.fromARGB(255, 50, 51, 96)),
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
    final request = context.watch<CookieRequest>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
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
            } else if (item.name == "Lihat Item User") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserItemPage()));
            } else if (item.name == "Lihat Semua Item") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ItemPage()));
            } else if (item.name == "Logout") {
              final response = await request.logout(
                  "https://martin-marcelino-tugas.pbp.cs.ui.ac.id/auth/logout/");
              String message = response["message"];

              if (response['status']) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text("$message Sampai jumpa, ${loggedInUser.username}."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
              }
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              if (item.name == "Lihat Semua Item")
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Lihat Semua", style: TextStyle(fontSize: 30)),
                    Text("Item", style: TextStyle(fontSize: 30)),
                  ],
                )
              else if (item.name == "Lihat Item User")
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Lihat Item", style: TextStyle(fontSize: 30)),
                    Text("User", style: TextStyle(fontSize: 30)),
                  ],
                )
              else
                Text(item.name, style: const TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
