import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextField({

  required String hintText,
  required IconData prefixIconData,
  required TextEditingController controller,
  required void Function(void Function()) reload,
  required VoidCallback onPressedSuffix,
  required VoidCallback prefixIconOnPressed,
  required fieldsType enumData,
  String selectedCurrency = "EGP",
  void Function(String?)? onCurrencyChanged,
  List<String>? dropdownItems,
  void Function(String?)? onItemSelected,
}) {
  InputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xffE3E3E5),
    ),
    borderRadius: BorderRadius.circular(20.0),
  );

  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "هذا الحقل مطلوب";
      }
      return null;
    },
    onChanged: (value) {
      reload(() {});
    },
    controller: controller,
    // readOnly: dropdownItems != null ||
    //     enumData ==
    //         fieldsType
    //             .currency,
    // keyboardType: enumData == fieldsType.currency
    //     ? TextInputType.none
    //     : TextInputType.text,
    decoration: InputDecoration(

      contentPadding: EdgeInsets.symmetric(
          vertical: 2.h, horizontal: 10.w),
      focusedErrorBorder: border,
      focusedBorder: border,
      enabledBorder: border,
      errorBorder: border,
      border: InputBorder.none,
      suffixIcon: dropdownItems != null
          ? PopupMenuButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey),
        onSelected: (String value) {
          controller.text = value;
        },
        itemBuilder: (BuildContext context) {
          return dropdownItems.map((String option) {
            return PopupMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList();
        },
      )
          : (enumData == fieldsType.jobLevel ||
          enumData == fieldsType.workingModel ||
          enumData == fieldsType.jobType)
          ? IconButton(
        onPressed: onPressedSuffix,
        icon: Icon(Icons.keyboard_arrow_down_outlined,
            color: Colors.grey),
      )
          : null,
      hintText: hintText,
      hintStyle: TextStyle(
        color: Color(0xff75757B),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon:
      enumData == fieldsType.currency || enumData == fieldsType.phoneNumber
          ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/emojione-v1_flag-for-egypt.png',
              width: 24,
              height: 16,
            ),
            SizedBox(width: 4),
            PopupMenuButton<String>(
              icon: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey),
              onSelected: (String value) {
                controller.text = value; // ✅ تحديث النص داخل الفيلد
              },
              itemBuilder: (BuildContext context) {
                return dropdownItems!.map((String option) {
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList();
              },
            ),
          ],
        ),
      )
          : IconButton(
        onPressed: prefixIconOnPressed,
        icon: Icon(prefixIconData, color: Color(0xff75757B)),
      ),
    ),
  );
}

enum fieldsType {
  jobType,
  jobLevel,
  jobTitle,
  workingModel,
  currency,
  description,
  requirement,
  aboutCompany,
  phoneNumber,
  personName
}
