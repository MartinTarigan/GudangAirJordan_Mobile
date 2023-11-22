import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/screens/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gudang_air_jordan/models/item.dart';
import 'package:gudang_air_jordan/widgets/nav_drawer.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {


  Future<List<AirJordan>> fetchItem() async {
    var url = Uri.parse('https://martin-marcelino-tugas.pbp.cs.ui.ac.id/json/');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Database Item'),
          backgroundColor: const Color(0xFF2f3169),
          foregroundColor: Colors.white,
        ),
        drawer: const NavDrawer(),
        body: FutureBuilder(
          future: fetchItem(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Column(
                  children: [
                    Text(
                      "Tidak ada data item.",
                      style:
                          TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Material(
                        color: const Color(0xFF53558c),
                        child: Column(
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
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(snapshot.data![index]))),
                              child: const Text("Lihat Detail")),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  )
                );
            }
          }
        }
      )
    );
  }
}