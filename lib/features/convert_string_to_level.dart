import 'package:flutter/material.dart';
import 'package:taskati/core/model/task.dart';

Level convertStringToLevel(String level){

    switch (level) {
      case 'Level.green':
        return Level.green;
      case 'Level.yellow':
        return Level.yellow;
      case 'Level.red':
        return Level.red;
      default:
        throw Exception('Invalid level: $level');

  }


}