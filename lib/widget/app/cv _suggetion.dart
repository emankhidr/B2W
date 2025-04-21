import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CvSuggestionsWidget extends StatelessWidget {
  final List<String> suggestions = [
    "Add work experience to strengthen your profile.",
    "Include more key skills related to your job role.",
    "Mention certifications to support your qualifications.",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.all(16),
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Suggestions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.inputText,
            ),
          ),
          const SizedBox(height: 12),
          ...suggestions.map((suggestion) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("• ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: AppColors.inputText,
                    )),
                Expanded(
                  child: Text(
                    suggestion,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color:AppColors.inputText,
                    ),
                    textAlign: TextAlign.start, //  Align paragraph start
                    softWrap: true,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
