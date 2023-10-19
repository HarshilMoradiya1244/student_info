import 'package:flutter/material.dart';

import '../modal/student_modal.dart';
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
          backgroundColor: Colors.amberAccent,
          title: const Text(
            "Data Add",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, '/');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: txtgrid,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter GRID",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: txtname,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Name",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: txtstd,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Std",
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      StudentModel details = StudentModel(
                          grid: int.tryParse(txtgrid.text),
                          name: txtname.text,
                          std: txtstd.text);
                      Global.g1.stdlist.add(details);
                      Navigator.pop(
                          context, [txtgrid.text, txtname.text, txtstd.text]);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width*0.20,
                      decoration:BoxDecoration(
                      color: Colors.amberAccent,borderRadius:BorderRadius.circular(10)
                      ),
                      child: Align(alignment: Alignment.center,
                        child: const Text(
                          "Submit",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
