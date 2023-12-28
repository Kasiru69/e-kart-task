import 'package:flutter/material.dart';
class Cart extends ChangeNotifier{
  List<int> _arr=[];
  List<String> _arr2=[];
  List<double> _arr3=[];
void  addtocart(int id,String name,double price){
  _arr.add(id);
  _arr2.add(name);
  _arr3.add(price);
  print(_arr);
  print(_arr2);
  print(_arr3);
  notifyListeners();
}
double Price()
{
  double val=0;
  for(double it in _arr3) val+=it;
  return val;
}
List<int> list1()
{
  return _arr;
}
List<String> list2()
{
  return _arr2;
}
List<double> list3()
{
  return _arr3;
}
void removefromcart(int id){
  int idx=-1,i;
  for(i=0;i<_arr.length;i++)
    {
      if(_arr[i]==id){ idx=i; break; }
    }
  _arr.removeAt(idx);
  _arr2.removeAt(idx);
  _arr3.removeAt(idx);
  print(_arr);
  print(_arr2);
}
bool ispresent(int id){
  int i;
  for(i=0;i<_arr.length;i++) if(_arr[i]==id) return true;
  return false;
}
}