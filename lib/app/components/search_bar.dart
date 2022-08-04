import 'package:flutter/material.dart';
import 'package:notepad/app/app.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
  }) : super(key: key);
String toBeSearched =' ';
HomeController controller = new HomeController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: TextFormField(
          onChanged: (value){
            toBeSearched = value;
            controller.getSearch(toBeSearched);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
