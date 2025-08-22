import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> pickColor(BuildContext context, Color currentColor) async {
  Color selectedColor = currentColor;
  return showDialog<Color>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: const Text("Pick a color"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) => selectedColor = color,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(selectedColor),
            child: const Text("Select"),
          ),
        ],
      );
    },
  );
}
