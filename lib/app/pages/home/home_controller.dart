import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
late String toBeSearch = ' ';
Future queryData(){
return FirebaseFirestore.instance
    .collection('notes')
    .where('para', isGreaterThanOrEqualTo: toBeSearch)
    .get();
    //.then(...);
}

 getSearch(String toBeSearched){
  toBeSearch = toBeSearched;
}

get getSearched
{
  return toBeSearch;
}

toBeDisplayed(int index,String para ){
  if (para == toBeSearch && toBeSearch!= ' '){
return para;
  }
  else

}

}