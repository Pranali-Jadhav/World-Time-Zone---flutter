import 'package:flutter/material.dart';
import 'package:world_time/loading.dart';
import 'home.dart';
import 'choose_location.dart';


void main() => runApp(MaterialApp(

     initialRoute: '/',
  routes:{
       '/': (context) =>Loading(),
       '/home': (context) =>Home(),
    '/location': (context)=>ChooseLocation(),
  },
));


