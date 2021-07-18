import 'package:beginner/src/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({Key? key}) : super(key: key);

  @override
  _Exercise2State createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  TextEditingController _textFieldName = TextEditingController();
  TextEditingController _textFieldPrice = TextEditingController();

  String _nameValue = '';
  String _priceValue = '';

  var _textFieldNameError;
  var _textFieldPriceError;
  int _count = 0;

  bool _addButton = true;
  String _idUpdate = '';

  final List<Transaction> transactions = [
    Transaction(id: 's1', name: 'Trai Cam', price: 6.69, date: DateTime.now()),
    Transaction(id: 's2', name: 'Trai Buoi', price: 10.58, date: DateTime.now()),
    Transaction(id: 's3', name: 'Trai Quat', price: 3.33, date: DateTime.now()),
  ];

  @override
  void initState() {
    super.initState();
    _count = transactions.length;
  }

  void checkNameAndPriceInfo(String name, double price) {
    setState(() {
      if (name.isEmpty) {
        _textFieldNameError = "Name is not null";
      } else {
        _textFieldNameError = null;
      }
      if (price <= 0) {
        _textFieldPriceError = "Price must be greater than 0";
      } else {
        _textFieldPriceError = null;
      }
      if (_textFieldNameError == null && _textFieldPriceError == null) {
        addProduct(name, price);
      }
    });
  }

  void addProduct(String name, double price) {
    final newProduct = Transaction(
        id: DateTime.now().toString(),
        name: name,
        price: price,
        date: DateTime.now());

    setState(() {
      transactions.add(newProduct);
      _count = transactions.length;
    });
  }

  void deleteProduct(String id) {
    setState(() {
      transactions.removeWhere((item) => item.id == id);
      _count = transactions.length;
      _nameValue = '';
      _priceValue = '';
      _addButton = true;
    });
  }

  void updateProduct(String id, String name, double price) {
    setState(() {
      transactions.forEach((item) {
        if (item.id == id) {
          item.name = name;
          item.price = price;
        }
      });
      _nameValue = '';
      _priceValue = '';
      _addButton = true;
    });
  }

  void clickUpdateIcon(String id, String name, double price) {
    setState(() {
      _nameValue = name;
      _priceValue = price.toString();
      _addButton = false;
      _idUpdate = id;
    });
  }

  void clickCancelButton() {
    setState(() {
      _nameValue = '';
      _priceValue = '';
      _addButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _textFieldName..text = _nameValue,
                  decoration: InputDecoration(
                      icon: Icon(Icons.create_outlined),
                      labelText: "Name",
                      errorText: _textFieldNameError),
                ),
                TextField(
                  controller: _textFieldPrice..text = _priceValue,
                  decoration: InputDecoration(
                      icon: Icon(Icons.attach_money_rounded),
                      labelText: "Price",
                      errorText: _textFieldPriceError),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 50,
                          child: Text(_count.toString() + " product(s)")),
                      Container(
                        child: _addButton
                            ? Expanded(
                                flex: 50,
                                child: OutlinedButton(
                                    onPressed: () {
                                      checkNameAndPriceInfo(_textFieldName.text,
                                          double.parse(_textFieldPrice.text));
                                    },
                                    child: Text("Add")),
                              )
                            : Expanded(
                                flex: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedButton(
                                        onPressed: () {
                                          clickCancelButton();
                                        },
                                        child: Text("Cancel")),
                                    OutlinedButton(
                                        onPressed: () {
                                          updateProduct(
                                              _idUpdate,
                                              _textFieldName.text,
                                              double.parse(
                                                  _textFieldPrice.text));
                                        },
                                        child: Text("Update")),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Name"),
                      Text("Price"),
                      Text("Date"),
                      Text("Update"),
                      Text("Delete")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 340,
                    child: SingleChildScrollView(
                      child: Column(
                        children: transactions.map((data) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(data.name),
                                  ),
                                  Text(data.price.toStringAsFixed(2)),
                                  Text(DateFormat.yMd().format(data.date)),
                                  IconButton(
                                    icon: Icon(Icons.system_update_alt_rounded),
                                    onPressed: () {
                                      clickUpdateIcon(
                                          data.id, data.name, data.price);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete_forever),
                                    onPressed: () {
                                      deleteProduct(data.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
