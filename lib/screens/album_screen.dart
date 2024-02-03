
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api/models/AlbumModel.dart';
import 'package:http/http.dart' as http;
class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<AlbumModel> albumList = [];
  Future<List<AlbumModel>> getAlbumApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map e in data){
        albumList.add(AlbumModel.fromJson(e));
      }
      return albumList;
    }else{
      return albumList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getAlbumApi(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return const Text('Loading');
                  }else{
                    return ListView.builder(
                        itemCount: albumList.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              child: ListTile(
                               title: Text(albumList[index].id.toString()),
                                subtitle: Text(albumList[index].title.toString()),
                              ),
                            ),
                          );
                        });
                  }
                }
            ),
          )
        ],
      ),
    );
  }
}
