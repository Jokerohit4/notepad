import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoEditController extends GetxController{
  final titleController = TextEditingController();
  final paraController = TextEditingController();

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
  CollectionReference notes =
  FirebaseFirestore.instance.collection('notes');

  Future<void> updateUser(id, title, para) {
    return notes
        .doc(id)
        .update({'title': title, 'para': para,})
        .then((value) => print("Notes Updated"))
        .catchError((error) => print("Failed to update notes: $error"));
  }

  Future<void> deleteNote(id) {
    return notes
        .doc(id)
        .delete()
        .then((value) => print('Notes Deleted'))
        .catchError((error) => print('Failed to delete Notes : $error'));
  }


}