import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeApi extends StatefulWidget {
  const HomeApi({Key? key}) : super(key: key);

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {
  final url = 'https://jsonplaceholder.typicode.com/posts';
  var postJson = [];
  void fetchApi() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        postJson = jsonData;
      });
    } catch (error) {
      const Text('something went wrong');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    fetchApi();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Api'),
      ),
      body: ListView.builder(
          itemCount: postJson.length,
          itemBuilder: (context, index) {
            final post = postJson[index];
            return Text("Title: ${post['title']}\n Body:${post['body']}\n\n");
          }),
    );
  }
}
