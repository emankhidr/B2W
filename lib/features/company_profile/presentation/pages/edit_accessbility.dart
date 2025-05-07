  import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';
import '../../../../core/shared_widgets/custom_buttom.dart';

class EditAccessibilityFeaturesPage extends StatefulWidget {
  @override
  _EditAccessibilityFeaturesPageState createState() => _EditAccessibilityFeaturesPageState();
}

class _EditAccessibilityFeaturesPageState extends State<EditAccessibilityFeaturesPage> {
  List<Map<String, dynamic>> features = [
    {'name': 'Wheelchair-accessible Workplace', 'icon': Icons.accessible, 'selected': false},
    {'name': 'Parking for People with Disabilities', 'icon': Icons.local_parking, 'selected': false},
    {'name': 'Flexible Work Hours', 'icon': Icons.work, 'selected': false},
    {'name': 'Wheelchair Ramp Access', 'icon': Icons.ramp_right, 'selected': true},
    {'name': 'Elevator Access', 'icon': Icons.elevator, 'selected': true},
    {'name': 'Remote Work Option', 'icon': Icons.home, 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarContent(title: "Edit Accessibility Features", context: context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                itemCount: features.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        features[index]['selected'] = !features[index]['selected'];
                      });
                    },
                    child: Container(width: 171,
                      height: 144,
                      decoration: BoxDecoration(
                        color: features[index]['selected'] ? Colors.purple.withOpacity(0.1) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: features[index]['selected'] ? Colors.purple : Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(features[index]['icon'],
                              color: features[index]['selected'] ? Colors.purple : Colors.grey, size: 30),
                          SizedBox(height: 8),
                          Text(
                            features[index]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            customButtom(title: "Update", onTap: (){}),
          ],
        ),
      ),
    );
  }
}

