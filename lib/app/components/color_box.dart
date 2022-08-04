import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notepad/app/app.dart';

class ColorBoxes extends StatelessWidget {
  //final onTap;
  ColorBoxes({Key? key,}) : super(key: key);
static List <Color> color = [
  Colors.red,
  Colors.limeAccent,
  Colors.blue,
  Colors.deepOrangeAccent,
  Colors.amberAccent,
  Colors.greenAccent,
  Colors.indigoAccent,
];

AddTodoController controller = AddTodoController();
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
            width:100,
            child: ListView.builder(
              itemCount: color.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: controller.addColor(color[index]),
                    child: Container(
                      decoration: BoxDecoration(
                          color: color[index],
                        border: Border.all(
                          color: Colors.black,
                        )
                      ),
                      width: 10,
                    height: 10,
                    ),
                  ),
                );
              }
            ),
          ),
        ],
    );
  }
}

