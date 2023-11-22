import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/screens/add_form.dart';
import 'package:gudang_air_jordan/screens/dj_item_all.dart';
import 'package:gudang_air_jordan/screens/dj_item_user.dart';
import 'package:gudang_air_jordan/screens/feat.dart';
import 'package:gudang_air_jordan/screens/list_item.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2f3169),
      child: ListView(
        children: [
          const SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
              color: Color(0xFF2f3169),
              ),
              child: Column(
                children: [
                  Text(
                    'Gudang\nAirJordan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Jangan lupa simpan AJ mu",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            tileColor: const Color(0xFF2f3169),
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Halaman Utama',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardPage(),
              )
            )
          ),
          ListTile(
            tileColor: const Color(0xFF2f3169),
            leading: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            title: const Text(
              'Tambah Item',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFormPage()))
          ),
          ListTile(
            tileColor: const Color(0xFF2f3169),
            leading: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: const Text(
              'Lihat Item',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListItem()))
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            title: const Text(
              'Daftar Item',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () =>
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ItemPage()),
              )
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            title: const Text(
              'Daftar Item User',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () =>
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserItemPage()),
              )
          ),
        ],
      ),
    );
  }
}