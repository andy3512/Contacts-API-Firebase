import 'dart:ffi';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  final _firestore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('ContactID').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document){
              return ContactCard(name: document['ContactName'], acc: document['AccountName'],Fname: document['ContactName'][0],);
            }).toList(),
          );
        },
      )
    );
  }
}

class ContactCard extends StatelessWidget {
  
  ContactCard({required this.name,required this.acc,required this.Fname});
  final String name;
  final String acc;
  final String Fname;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
            width: 0.8,
            color: Colors.blueGrey
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  radius: 28,
                  child: Text(Fname.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700]
                    ),
                    ),
                    Text(acc,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700]
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

