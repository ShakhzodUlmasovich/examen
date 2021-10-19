import 'dart:math';

import 'package:examen/screens/game_page.dart';
import 'package:flutter/material.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  var _nameController = TextEditingController();

  var _name2Controller = TextEditingController();

  String? _color;
  Color? color;
  String win = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "O'yinchilar ro'yxatdan o'tishingiz mumkin",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text!.length < 2) {
                        return "Ismingizni to'liq kiriting";
                      }
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.grey[300],
                      labelText: " 1- user ismingiz",
                      hintText: "Name",
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.green,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _nameController.clear();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RadioListTile(
                    activeColor: Colors.red,
                    title: Text("Qizil"),
                    subtitle: Text(
                        "Qura tashlash uchun birinchi o'yinchining tanlovi"),
                    value: 'red',
                    groupValue: _color,
                    onChanged: (v) {
                      setState(() {
                        _color = v.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    activeColor: Colors.blue,
                    title: Text("Ko'k"),
                    subtitle: Text(
                        "Qura tashalash uchun birinchi o'yinchining tanlovi"),
                    value: 'blue',
                    groupValue: _color,
                    onChanged: (v) {
                      setState(() {
                        _color = v.toString();
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text!.length < 2) {
                        return "Ismingizni to'liq kiriting";
                      }
                    },
                    controller: _name2Controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.grey[300],
                      labelText: "2- user ismmingiz",
                      hintText: "Name",
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.green,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _name2Controller.clear();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: color == null ? Colors.black : color,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.teal),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Random random = Random();
                        int randomnum = random.nextInt(2 + 1);
                        setState(() {
                          if (randomnum == 1) {
                            color = Colors.red;
                          } else {
                            color = Colors.blue;
                          }
                        });
                        setState(() {
                          if (_color == 'red') {
                            win = _name2Controller.text;
                          } else {
                            win = _nameController.text;
                          }
                        });
                      },
                      child: Text(
                        "Tanlash",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "$win siz birinchi boshlaysiz",
                    style: TextStyle(
                      fontSize: 15,
                      color: color,
                    ),
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "O'yinni boshlash ->",
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.orange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.orange),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => game_page(
                                  user: _nameController.text,
                                  user2: _name2Controller.text,
                                  win: win,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(color: color, fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
