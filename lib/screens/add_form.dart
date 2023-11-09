import 'package:flutter/material.dart';
import 'package:gudang_air_jordan/screens/feat.dart';
import 'package:gudang_air_jordan/widgets/item.dart';

class AddFormPage extends StatefulWidget {
  const AddFormPage({super.key});
  @override
  State<AddFormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  String _image = "";
  int _price = 0;
  String _category = "";
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Storage Form',
          ),
        ),
        backgroundColor: const Color(0xFF2f3169),
        foregroundColor: color,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: color),
                  decoration: InputDecoration(
                    hintText: "Nama AirJordan",
                    labelText: "Nama AirJordan",
                    hintStyle: TextStyle(color: color),
                    labelStyle: TextStyle(color: color),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) => setState(() {
                    _name = value!;
                  }),
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Nama AirJordan tidak boleh kosong!"
                        : (int.tryParse(value) != null)
                            ? "Nama harus berupa kata!"
                            : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: color),
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    hintStyle: TextStyle(color: color),
                    labelStyle: TextStyle(color: color),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) => setState(() {
                    _amount = int.parse(value!);
                  }),
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Amount tidak boleh kosong!"
                        : (int.tryParse(value) == null)
                            ? "Amount harus berupa angka!"
                            : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: color),
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    hintStyle: TextStyle(color: color),
                    labelStyle: TextStyle(color: color),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Description tidak boleh kosong!"
                        : (int.tryParse(value) != null)
                            ? "Description harus berupa kata!"
                            : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: color),
                  decoration: InputDecoration(
                    hintText: "Image",
                    labelText: "Image",
                    hintStyle: TextStyle(color: color),
                    labelStyle: TextStyle(color: color),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) => setState(() {
                    _image = value!;
                  }),
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Image tidak boleh kosong!"
                        : (int.tryParse(value) != null)
                            ? "Image harus berupa URL!"
                            : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: color),
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    hintStyle: TextStyle(color: color),
                    labelStyle: TextStyle(color: color),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) => setState(() {
                    _price = int.parse(value!);
                  }),
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Price tidak boleh kosong!"
                        : (int.tryParse(value) == null)
                            ? "Price harus berupa angka!"
                            : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: color),
                  decoration: InputDecoration(
                    hintText: "Category",
                    labelText: "Category",
                    hintStyle: TextStyle(color: color),
                    labelStyle: TextStyle(color: color),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) => setState(() {
                    _category = value!;
                  }),
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Category tidak boleh kosong!"
                        : (int.tryParse(value) != null)
                            ? "Category harus berupa kata!"
                            : null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF8284ac)),
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
                                      onPressed: () =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const DashboardPage(),
                                              )),
                                      child: const Text('OKAY'))
                                ],
                              );
                            });
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
            ],
          ),
        ),
      ),
    );
  }
}
