import 'package:flutter/material.dart';

extension Measurement on BuildContext{
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidth() => MediaQuery.of(this).size.width;
}