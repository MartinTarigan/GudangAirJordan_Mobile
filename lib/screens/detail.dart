import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/models/item.dart';

class Detail extends StatelessWidget {
  final AirJordan item;

  const Detail(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Item",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2f3169),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ItemCard(item.fields),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Fields item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Material(
        color: const Color(0xFF53558c),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(item.linkImage),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 5,),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Description:"),
                    const SizedBox(height: 5,),
                    SizedBox(width: 300, child: Text(item.description)),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(width: 300, child: Text("Category: ${item.category}")),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(width: 300, child: Text("Stored date: ${item.dateAdded.toString().split(' ')[0]}")),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}
