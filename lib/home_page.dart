import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workapi0/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome> Welcomes = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 110,
                    color: const Color.fromARGB(255, 15, 192, 33),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'user id: ${Welcomes[index].userId}',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'id: ${Welcomes[index].id}',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'Title id: ${Welcomes[index].title}',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'body id: ${Welcomes[index].body}',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Welcome>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        Welcomes.add(Welcome.fromJson(index));
      }

      return Welcomes;
    } else {
      return Welcomes;
    }
  }
}
