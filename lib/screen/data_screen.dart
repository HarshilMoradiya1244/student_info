import 'package:flutter/material.dart';

import '../utils/global.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  TextEditingController txtgrid = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("add data",style: TextStyle(color: Colors.black),),
          leading:IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.amberAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                    children: [
                      TextField(
                        controller: txtgrid,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border:OutlineInputBorder(borderSide:BorderSide(color: Colors.black)),
                            hintText: 'grid',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                      TextField(
                        controller: txtname,
                        decoration: const InputDecoration(
                            border:OutlineInputBorder(borderSide:BorderSide(color: Colors.black)),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Map m1 = {"grid": txtgrid.text, "name": txtname.text,"std":txtstd};
            Global.g1.studentList.add(m1);
            Navigator.pop(context, [txtgrid.text, txtname.text, txtstd.text]);
          },
          backgroundColor: Colors.amberAccent,
          child: const Icon(Icons.save,color: Colors.black,),
        ),
      ),
    );
  }
}