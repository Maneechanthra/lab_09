import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab09/screen/display.dart';
import 'package:lab09/screen/formscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:
          "AIzaSyADgER0p4e-6yhnBK9ry-lv89XY6RY53Do", //  ==   current_key in google-services.json file
      appId:
          "1:9130045207:android:be8382df59aac7c2961152", // ==  mobilesdk_app_id  in google-services.json file
      messagingSenderId:
          "9130045207", // ==   project_number in google-services.json file
      projectId:
          "lab09-755af", // ==   project_id   in google-services.json file
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [FormScreen(), Display()],
        ),
        bottomNavigationBar: TabBar(tabs: [
          Tab(text: 'บันทึกอุณหภูมิ'),
          Tab(text: 'รายชื่อนักเรียน'),
        ]),
        backgroundColor: Colors.green,
      ),
    );
  }
}
