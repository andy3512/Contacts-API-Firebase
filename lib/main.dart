import 'package:contacts/contact_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'post_data.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Get contacts",
    initialRoute: 'postData',
    routes: {
      'postData' : (context) => PostData(),
      'ContactPage': (context) => ContactsPage(),

    },
  ));
}

