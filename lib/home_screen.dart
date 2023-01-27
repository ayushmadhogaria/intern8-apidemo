import 'dart:convert';

import 'package:flutter/material.dart';
import 'model_data.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ModelData> modelData = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 241, 236, 236),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Note ID: ${modelData[index].id}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 77, 42, 42)),
                        ),
                        Text('User ID: ${modelData[index].userId}'),
                        Text('${modelData[index].title}'),
                        Text('${modelData[index].body}'),
                      ],
                    ),
                  ),
                );
              },
              itemCount: modelData.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<ModelData>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        modelData.add(ModelData.fromJson(index));
      }
      return modelData;
    } else {
      return modelData;
    }
  }
}
