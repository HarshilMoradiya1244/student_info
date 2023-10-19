import 'package:flutter/material.dart';
import 'package:student_info/utils/global.dart';

import '../modal/student_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController txtgrid = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          title: const Text(
            "All Student Data",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            StudentModel student = Global.g1.stdlist[index];
            return Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GRID : ${student.grid}",
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          "Name : ${student.name}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              ),
                        ),
                        Text(
                          "Std : ${student.std}",
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    Spacer( ),
                    IconButton(
                      onPressed: () {
                        StudentModel s1 = Global.g1.stdlist[index];
                        txtname.text = s1.name!;
                        txtgrid.text = s1.grid.toString();
                        txtstd.text = s1.std!;
                        updateDialog(index);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Global.g1.stdlist.removeAt(index);
                        });
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: Global.g1.stdlist.length,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'data').then((value) {
                setState(() {});
              });
            },
            backgroundColor: Colors.amberAccent,
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 25,
            )),
      ),
    );
  }

  Future<dynamic> updateDialog(int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtgrid,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "GRID"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtstd,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Std"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Global.g1.stdlist[index] = StudentModel (name: txtname.text,std: txtstd.text,grid: int.tryParse(txtgrid.text));
                });
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}