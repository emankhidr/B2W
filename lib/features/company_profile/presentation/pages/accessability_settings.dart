
import 'package:flutter/material.dart';

import '../../../../core/utils/sizes.dart';

class AccessibilitySettingsPage extends StatefulWidget {
  @override
  _AccessibilitySettingsPageState createState() =>
      _AccessibilitySettingsPageState();
}

class _AccessibilitySettingsPageState
    extends State<AccessibilitySettingsPage> {
  String _fontSize = 'Medium';
  bool _lineHeight = false;
  bool _wordSpacing = true;
  bool _contrastMode = false;
  bool _darkMode = false;

  final Map<String, bool> defaultFontSizes = {
    "Large": false,
    "Medium": true,
    "Small": false,
  };

  Map<String, bool> fontSizes = {
    "Large": false,
    "Medium": true,
    "Small": false,
  };

   bool get isChanged {
    return !defaultFontSizes.entries.every((entry) =>
    fontSizes[entry.key] == entry.value) ||
        _lineHeight != false ||
        _wordSpacing != true ||
        _contrastMode != false ||
        _darkMode != false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Accessibility Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/images/Vector(3).png"),
                spaceWidth(5),
                Text('Fonts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: fontSizes.keys.map((size) {
                return buildCheckbox(size);
              }).toList(),
            ),



            buildSwitchTile('Line Height', _lineHeight, (value) {
              setState(() {
                _lineHeight = value;
              });
            }),
            buildSwitchTile('Word Spacing', _wordSpacing, (value) {
              setState(() {
                _wordSpacing = value;
              });
            }),



            Row(
              children: [
                Image.asset("assets/images/Vector(4).png"),
                spaceWidth(5),
                Text('Colors',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),

            buildSwitchTile('Contrast Mode', _contrastMode, (value) {
              setState(() {
                _contrastMode = value;
              });
            }),
            buildSwitchTile('Dark Mode', _darkMode, (value) {
              setState(() {
                _darkMode = value;
              });
            }),

            Spacer(),

            SizedBox(
              width: double.infinity, // يجعل الزر يأخذ العرض بالكامل
              child: ElevatedButton(
                onPressed: isChanged ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isChanged ? Colors.purple : Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15), // ضبط الارتفاع فقط
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckbox(String size) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            value: fontSizes[size],
            activeColor: Colors.purple,
            shape: CircleBorder(),
            onChanged: (bool? value) {
              setState(() {
                fontSizes.updateAll((key, _) => false);
                fontSizes[size] = value ?? false;
              });
            },
          ),
        ),
        SizedBox(width: 8),
        Text(size, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      activeColor: Colors.purple,
      onChanged: (newValue) {
        setState(() {
          onChanged(newValue);
        });
      },
    );
  }
}
