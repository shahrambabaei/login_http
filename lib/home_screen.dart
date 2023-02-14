import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_mamad/logindata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<LoginData> postData(
      String userName, String password, bool isRememberMe) async {
    var url = Uri.parse('http://84.241.34.41:7007/api/v1/AuthApi/LoginAsync');
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        },
        body: jsonEncode(<String, dynamic>{
          'userName': userName,
          'password': password,
          'isRememberMe': isRememberMe
        }));

    if (response.statusCode == 200) {
      return LoginData.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception();
    }
  }

  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<LoginData>? _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Json'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  buildColumn() {
    return Center(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.black)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(label: Text('username')),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(label: Text('password')),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futureAlbum = postData(_userController.text,
                            _passwordController.text, true);
                      });
                    },
                    child: const Text('Submit'))
              ]),
            )));
  }

  FutureBuilder<LoginData> buildFutureBuilder() {
    return FutureBuilder(
        future: _futureAlbum,
        builder: (c, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.result.pages.length,
                itemBuilder: (c, i) {
                  return ElevatedButton(
                      onPressed: () {},
                      child: Text(snapshot.data!.result.pages[i].name));
                });
           
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
