import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatefulWidget {
  final TextEditingController
      colorController; // Controller to update color in text field

  const ColorPickerWidget({super.key, required this.colorController});

  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  Color currentColor = Colors.blue; // Default color

  // Open the full color picker dialog
  void openFullColorPicker() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Pick a Color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor, // Initially selected color
            onColorChanged: (color) {
              setState(() {
                currentColor = color;
                widget.colorController.text = colorToHex(
                    currentColor); // Update the color code in text field
              });
            },
            showLabel: true, // Show the color code
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Done'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      ),
    );
  }

  // Convert color to hex string (e.g., #FF5733)
  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          openFullColorPicker();
        },
        child: Icon(Icons.palette));
  }
}
