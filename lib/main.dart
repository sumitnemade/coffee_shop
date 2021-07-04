import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/models/ExtraItem.dart';
import 'package:flutter/material.dart';

import 'models/CoffeeData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _quantity = 1;

  var _jsonData = {
    "id": 14557,
    "name": "Flat White",
    "price": 125,
    "before_sale_price": null,
    "description": "Freshly-ground beans and steamed milk",
    "full_description": "Freshly-ground beans and steamed milk",
    "order": 1,
    "category": {"id": 1727, "name": "Coffee"},
    "images": {
      "full_size":
          "https://res.cloudinary.com/ginja-co-ltd/image/upload/s--zHcUzne6--/c_fill,h_300,q_jpegmini,w_485/v1/vendors/the-coffee-club-205/products/flat-white-mug-14557",
      "thumbnail":
          "https://res.cloudinary.com/ginja-co-ltd/image/upload/s--sVm4XF-z--/c_fill,h_70,q_jpegmini,w_103/v1/vendors/the-coffee-club-205/products/flat-white-mug-14557"
    },
    "extras": [
      {"id": 1535, "name": "Milk Option", "min": "1", "max": "1"}
    ],
    "extra_items": [
      {"id": 6631, "name": "Full Milk", "extra_id": 1535, "price": "0"},
      {"id": 6632, "name": "Skim Milk", "extra_id": 1535, "price": "0"},
      {"id": 6633, "name": "Soy Milk", "extra_id": 1535, "price": "20"}
    ],
    "tags": [],
    "availability": "available"
  };

  CoffeeData? _data;

  ExtraItem? _selectedItem;

  double? _width;
  double? _height;

  @override
  void initState() {
    _data = CoffeeData.fromJson(_jsonData);
    print(_data?.toJson());
    super.initState();
  }

  Widget _details() {
    return Container(
      width: _width! * 0.50,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            _data!.name ?? "",
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _data!.description ?? "",
            style: TextStyle(fontSize: 13),
          ),
          Divider(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text("Rs.${_data!.price ?? ""}"),
                Spacer(),
                InkWell(
                    onTap: () {
                      if (_quantity > 1) {
                        _quantity--;
                        setState(() {});
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Text("$_quantity"),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      _quantity++;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _data?.extras?.length,
              itemBuilder: (context, i) {
                List<ExtraItem?>? _ext = _data?.extra_items
                    ?.where(
                        (element) => element.extra_id == _data?.extras?[i].id)
                    .toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Text("MILK OPTION"),
                          Text(" (REQUIRED)"),
                        ],
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        color: Colors.grey[100],
                        child: Row(
                          children: [
                            Text(
                              "Please select 1 item",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        )),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _ext?.length,
                        itemBuilder: (context, j) {
                          return RadioListTile(
                            value: _ext?[j]!,
                            groupValue: _selectedItem,
                            onChanged: (ExtraItem? val) {
                              _selectedItem = val;
                              setState(() {});
                            },
                            title: Text(_ext?[j]?.price != "0"
                                ? "${_ext?[j]?.name ?? ""} Rs.${_ext?[j]?.price}"
                                : "${_ext?[j]?.name ?? ""}"),
                          );
                        }),
                    TextButton(
                        onPressed: () {},
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              Text(
                                "ADD TO CART",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                  "Rs. ${(_quantity * ((_data?.price ?? 0) + (int.parse(_selectedItem?.price ?? "0"))))}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          color: Colors.brown,
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                        ))
                  ],
                );
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: _width! < 1000 ? _width : _width! * 0.5,
                      child: CachedNetworkImage(
                        imageUrl: _data!.images!.full_size!,
                        imageBuilder: (context, imageProvider) => Container(
                          height:
                              _width! < 1000 ? _width! * 0.45 : _width! * 0.32,
                          width: _width! < 1000 ? _width : _width! * 0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_width! > 1000) Spacer(),
                    if (_width! > 1000) _details()
                  ],
                ),
                if (_width! <= 1000) _details()
              ],
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
              ),
            )
          ],
        ));
  }
}
