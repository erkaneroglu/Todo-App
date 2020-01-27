import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoappwithjson/Mission.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime mTime = DateTime.now();
  Future<List<Mission>> _gorevGetir() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((tekGorev) => Mission.fromMap(tekGorev))
          .toList();
    } else {
      throw Exception("Baglanilamadi! ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO App"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _gorevGetir(),
        builder: (BuildContext context, AsyncSnapshot<List<Mission>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].userId.toString()),
                        trailing: Icon(Icons.check_box,color: snapshot.data[index].completed ? Colors.green : Colors.red),
                        leading: CircleAvatar(
                          radius: 25,
                          child: Text(mTime.day.toString() +"\n"+ tarihGetir(),style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  String tarihGetir(){
    if(mTime.month == 1){
      return "Ocak";
    }else if(mTime.month == 2){
      return "Subat";
    }else if(mTime.month == 3){
      return "Mart";
    }else if(mTime.month == 4){
      return "Nisan";
    }else if(mTime.month == 5){
      return "Mayis";
    }else if(mTime.month == 6){
      return "Haziran";
    }else if(mTime.month == 7){
      return "Temmuz";
    }else if(mTime.month == 8){
      return "Agustos";
    }else if(mTime.month == 9){
      return "Eylul";
    }else if(mTime.month == 10){
      return "Ekim";
    }else if(mTime.month == 11){
      return "Kasim";
    }else if(mTime.month == 12){
      return "Aralik";
    }else{
      return "Belirsiz!";
    }
  }
}
