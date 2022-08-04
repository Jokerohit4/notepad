import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController{

  final titleController = TextEditingController();
  final paraController = TextEditingController();
String colour = Colors.blue.toString();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    paraController.dispose();
    super.dispose();
  }

  clearText() {
    titleController.clear();
    paraController.clear();
  }

  // Adding Notes
  CollectionReference notes =
  FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String title, String para) {
    return notes
        .add({'title': title, 'para': para,'color':colour})
        .then((value) => print('Notes Added'))
        .catchError((error) => print('Failed to Add notes: $error'));
  }

  addColor(Color color) {
    colour =  color.toString();
  }

}