import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/app/app.dart';
import 'package:notepad/app/pages/add_todo_edit/add_todo_edit_controller.dart';

class AddTodoEditView extends StatefulWidget {
  final id;
   AddTodoEditView({Key? key, this.id}) : super(key: key);
  @override
  _AddTodoEditViewState createState() => _AddTodoEditViewState();
}

class _AddTodoEditViewState extends State<AddTodoEditView> {
  AddTodoEditController controller = AddTodoEditController();
var titleEdit = '';
var paraEdit = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.push_pin_outlined,
            ),
          ),
          IconButton(onPressed: (){
            controller.deleteNote('id');
          }, icon: const Icon(Icons.delete_outline)),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dashboard_outlined,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 8.0,
          ),
        ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                 controller.updateUser(widget.id, titleEdit, paraEdit);
                 Navigator.of(context).pushNamed(
                   RoutePaths.home,
                 );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          spreadRadius: 2.0,
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      Icons.check,
                    ),
                  ),
                ),
                const Spacer(),
               ColorBoxes(),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
    future: FirebaseFirestore.instance
        .collection('notes')
        .doc(widget.id)
        .get(),
    builder: (_, snapshot) {
    if (snapshot.hasError) {
    print('Something Went Wrong');
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
    child: CircularProgressIndicator(),
    );
    }
    var data = snapshot.data!.data();
    var title = data!['title'];
    var para = data['para'];
    titleEdit = title;
    paraEdit = para;
    return SafeArea(
    child: Column(
    children: [
    //title
    TextFormField(
    onChanged: (value){
    titleEdit = value;
    },
      initialValue: title,
    style: const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    ),
    decoration: const InputDecoration(
    hintText: "Enter title",
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    ),
    ),
    ),
    TextFormField(
    onChanged: (value){
    paraEdit = value;
    },
      initialValue: para,
    style: const TextStyle(fontSize: 16, color: Colors.black),
    decoration: const InputDecoration(
    hintText: "Enter description",
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    ),
    ),
    ),
    ],
    ),
    );
    }
      ),
    );
  }

  Padding colorSelection(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
           //   color: products[index].color,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
