
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.dart';

class RecentsCard extends StatefulWidget {
  final String text;

  const RecentsCard({Key? key, required this.text}) : super(key: key);

  @override
  _RecentsCardState createState() => _RecentsCardState();
}

class _RecentsCardState extends State<RecentsCard> {
  late String currentText;

  @override
  void initState() {
    super.initState();
    currentText = widget.text;
  }

  void _changeText() {
    setState(() {
      currentText = currentText == widget.text ? "Updated!" : widget.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  currentText,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _changeText,
                child: Icon(Icons.close, color: AppColors.grey, size: 18),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Divider(
            color: AppColors.grey,
            thickness: 1,
            height: 1,
            indent: 40,      // space from the left
            endIndent: 40,
          ),
        ],
      ),
    );
  }
}
