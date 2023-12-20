import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  final String apiUrl = 'https://reqres.in/api/users?page=2';

  Future<List<dynamic>> fetchData() async {
    var result = await http.get(Uri.parse(apiUrl));
    return jsonDecode(result.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Chat'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<dynamic>>(
          future: fetchData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data![index]['avatar']),
                    ),
                    title: Text(
                      '${snapshot.data![index]['first_name']} ${snapshot.data![index]['last_name']}',
                    ),
                    subtitle: Text(snapshot.data![index]['email']),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: chat(),
  ));
}






