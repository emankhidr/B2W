import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CvChecklistWidget extends StatelessWidget {
  final Map<String, bool> cvSections = {
    'Personal Information': true,
    'Experience': false,
    'Education': true,
    'Certifications': true,
    'Key Skills': false,
    'Languages': true,
  };

  @override
  Widget build(BuildContext context) {
    // Split into two columns for layout
    final entries = cvSections.entries.toList();
    final leftColumn = entries.sublist(0, (entries.length / 2).ceil());
    final rightColumn = entries.sublist((entries.length / 2).ceil());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChecklistColumn(leftColumn),
        SizedBox(width: 40),
        _buildChecklistColumn(rightColumn),
      ],
    );
  }

  Widget _buildChecklistColumn(List<MapEntry<String, bool>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((entry) => _buildChecklistItem(entry.key, entry.value)).toList(),
    );
  }

  Widget _buildChecklistItem(String title, bool isComplete) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isComplete ? Icons.check_circle : Icons.cancel,
            color: isComplete ? Colors.green : Colors.red,
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.inputText,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
