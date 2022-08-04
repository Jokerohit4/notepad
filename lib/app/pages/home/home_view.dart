import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/app/app.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  CollectionReference notes =
  FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomBar(),
      drawer: const DrawerHome(),
      body: SafeArea(
        child: ListView(
          children:  [
            const CustomAppBar(),
             SearchBar(),
            const ListButtonContainer(),
            ListData(),
          ],
        ),
      ),
    );
  }
}
