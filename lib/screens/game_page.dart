import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class game_page extends StatefulWidget {
  String? user, user2, win;

  game_page({this.user, this.user2, this.win});

  @override
  State<game_page> createState() => _game_pageState();
}

class _game_pageState extends State<game_page> {
  var data;

  var _javobController = TextEditingController();

  
 

  int i = 0;
  int javob = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Savollar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: FutureBuilder(
                    future: savolniolibkel(context),
                    builder: (context, AsyncSnapshot<List> snap) {
                      data = snap.data;
                      if (snap.hasData) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.only(left: 80, right: 70),
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: 70),
                                alignment: Alignment.center,
                                child: Text(
                                  "${data[index + i]['savol']}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                            itemCount: 1,
                          ),
                        );
                      } else {
                        return Center();
                      }
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _javobController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.green[300],
                  labelText: "Javob",
                  hintText: "javob",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  onPressed: () {
                    setState(() {
                      i += 1;
                      javob += 5;
                    });
                     
                  },
                  child: Text("Keyingisi")),
              SizedBox(
                height: 30,
              ),
              Text(
                "Balingizni hisoblab boring",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Har 5 ta savoldan keyin o'yinchilar o'rin almashishlari shart !",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }

  Future<List> savolniolibkel(context) async {
    var kelganJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/savollar.json");
    List savolList = jsonDecode(kelganJson.toString());
    return savolList;
  }
}
