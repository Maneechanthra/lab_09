import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/student.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();
  final Future<FirebaseApp> flutter = Firebase.initializeApp();
  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('แบบฟอร์มบันทึกข้อมูล'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ชื่อ', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      onSaved: (value) {
                        myStudent.fname = value;
                      },
                    ),
                    SizedBox(height: 15),
                    Text('นามสกุล', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      onSaved: (value) {
                        myStudent.lname = value;
                      },
                    ),
                    SizedBox(height: 15),
                    Text('อีเมล', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      onSaved: (value) {
                        myStudent.email = value;
                      },
                    ),
                    SizedBox(height: 15),
                    Text('อุณหภูมิ', style: TextStyle(fontSize: 20)),
                    TextFormField(
                      onSaved: (value) {
                        myStudent.temp = value;
                      },
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text('บันทึก'),
                        style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20)),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await _studentCollection.add({
                              'fname': myStudent.fname,
                              'lname': myStudent.lname,
                              'email': myStudent.email,
                              'temp': myStudent.temp
                            });
                            formKey.currentState?.reset();
                          }
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
