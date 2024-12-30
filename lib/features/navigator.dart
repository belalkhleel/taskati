import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

push(BuildContext context,{required Widget page}){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page,));
}

pushWithReplacement(BuildContext context,{required Widget page}){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page,));
}

pushAndRemoveUntil(BuildContext context,{required Widget page}){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page,),(route) => false,);
}