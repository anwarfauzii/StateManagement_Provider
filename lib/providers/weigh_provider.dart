import 'package:flutter/material.dart';

class WeighProvider extends ChangeNotifier {
  int weight = 10;

  void changeWeight(int newWeight) {
    weight = newWeight;
    notifyListeners();
  }

  void changeWeightbyButton(String kondisi) {
    if (kondisi == 'add') {
      weight++;
    } else {
      weight--;
    }
    notifyListeners();
  }

  void changeWeightbyInput(int value){
    weight = weight + value;
    notifyListeners();
  }
}
