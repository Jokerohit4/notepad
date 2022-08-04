import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/app/app.dart';
import 'package:notepad/app/pages/add_todo_edit/add_todo_edit_view.dart';

class ListData extends StatelessWidget {
   ListData({
    Key? key,
  }) : super(key: key);
  final Stream<QuerySnapshot> notesStream =
  FirebaseFirestore.instance.collection('notes').snapshots();

HomeController controller = new HomeController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: notesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storeDocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storeDocs.add(a);
            a['id'] = document.id;
          }).toList();
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: storeDocs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) =>
                  ListCard(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTodoEditView(id: storeDocs[index]['id']),
                        ),
                      );
                    },
                    para:
                    title: storeDocs[index]['title'], color: storeDocs[index]['color'],
                  ),
            ),
          );
        }
      );
    }
  }

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.title,
    required this.press, required this.para, required this.color,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final String para;
  final String color ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue ,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
            const SizedBox(
             height: 20,
            ),
            Text(
              para,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
