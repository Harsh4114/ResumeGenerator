import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final fontSizeProvider = StateProvider<double>((ref) {
  final box = Hive.box('settings');
  return box.get('fontSize', defaultValue: 16.0);
});

final fontColorProvider = StateProvider<Color>((ref) {
  final box = Hive.box('settings');
  int? color = box.get('fontColor');
  return color != null ? Color(color) : Colors.black;
});

final bgColorProvider = StateProvider<Color>((ref) {
  final box = Hive.box('settings');
  int? color = box.get('bgColor');
  return color != null ? Color(color) : Colors.white;
});

void saveSettings(double fontSize, Color fontColor, Color bgColor) {
  final box = Hive.box('settings');
  box.put('fontSize', fontSize);
  box.put('fontColor', fontColor.value);
  box.put('bgColor', bgColor.value);
}
