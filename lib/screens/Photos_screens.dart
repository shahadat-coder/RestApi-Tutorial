import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api/models/PhotosModel.dart';
import 'package:http/http.dart' as http;

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {

  List<PhotosModel> photoList = [];

  Future<List<PhotosModel>> getPhotos()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
     for(Map s in data){
       photoList.add(PhotosModel.fromJson(s));
     }
     return photoList;
    }else{
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPhotos(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return const Text('Loading');
                  }else{
                    return ListView.builder(
                        itemCount: photoList.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(photoList[index].thumbnailUrl.toString()),
                                ),
                                title: Text(photoList[index].id.toString()),
                                subtitle: Text(photoList[index].title.toString()),
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
