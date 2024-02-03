import 'package:flutter/material.dart';
import 'package:rest_api/models/GetProductModel.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key, required this.model}) : super(key: key);
  final GetProductModel model;

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 300,
                child: Image.network(
                  widget.model.image.toString(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Add more details or description widgets based on your model
              Center(
                child: Text(
                  widget.model.title.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Chip(
                  side: const BorderSide(width: 0),
                  elevation: 5,
                  backgroundColor: Colors.greenAccent,
                  label: Text(
                    'TK ' + widget.model.price.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  widget.model.description.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category : ' + widget.model.category.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rating : ' + widget.model.rating.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: MaterialButton(
                  elevation: 10,
                  onPressed: () {},
                  color: Colors.black,
                  child: Text(
                    'Buy it',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
