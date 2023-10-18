import 'package:flutter/material.dart';
import 'package:student_info/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "All Data",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.amberAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: Global.g1.studentList
                  .map(
                    (e) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("grid : ${e['grid']}"),
                                Spacer( ),
                                Text("name : ${e['name']}"),
                                Spacer( ),
                                Text("std : ${e['std']}"),
                              ],
                            ),
                            Spacer( ),
                            IconButton(onPressed: (){
                              setState(() {
                                Global.g1.studentList.remove(e);
                              });

                            }, icon: Icon(Icons.delete,color: Colors.black,))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'data').then((value) {
              setState(() {});
            });
          },
          backgroundColor:Colors.amberAccent,
          child: const Icon(Icons.add,color: Colors.black,),
        ),
      ),
    );
  }
}
