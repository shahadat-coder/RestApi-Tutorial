import 'dart:convert';

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/models/GetProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/screens/description_screen.dart';

class GetProductScreen extends StatefulWidget {
  const GetProductScreen({super.key});

  @override
  State<GetProductScreen> createState() => _GetProductScreenState();
}

class _GetProductScreenState extends State<GetProductScreen> {
  @override
  Widget build(BuildContext context) {
    List<GetProductModel> productGet = [];
    Future<List<GetProductModel>> getProductFind() async {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map s in data) {
          productGet.add(GetProductModel.fromJson(s));
        }
        return productGet;
      } else {
        return productGet;
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('All Product'),
        ),
        body: Expanded(
            child: FutureBuilder(
                future: getProductFind(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const FadeShimmer(
                      height: 8,
                      width: 150,
                      radius: 4,
                      highlightColor: Color(0xffF9F9FB),
                      baseColor: Color(0xffE6E8EB),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: productGet.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) => DescriptionScreen(
                                            model: productGet[index])));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      productGet[index].image.toString(),
                                    ),
                                  ),
                                  title: Text(
                                    productGet[index].title.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        productGet[index].category.toString(),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Chip(
                                        side: const BorderSide(width: 0),
                                        elevation: 5,
                                        backgroundColor: Colors.greenAccent,
                                        label: Text(
                                          productGet[index].price.toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing:
                                      Text(productGet[index].rating.toString()),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                })));
  }
}
