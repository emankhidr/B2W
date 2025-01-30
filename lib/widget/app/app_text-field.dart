
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/utils/colors.dart';
import 'app_text.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
     this.label,
    this.hint,
    this.keyboardType,
    this.width,
    this.validator,
    this.secure = false,
    this.leading,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? Function(String? v)? validator;
  final bool secure;
  final Widget? leading;
  final double? width;
  final  keyboardType;


  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool secure = false;

  @override
  void initState() {
    secure = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if(widget.label != null)...[
          AppText(
            title: widget.label!,
            fontWeight: FontWeight.w400,
            color: AppColors.inputText,
            fontSize: 24,
          ),
          SizedBox(height: 8),

        ],
        TextFormField(
          cursorColor: AppColors.lightGrey,
          validator: widget.validator,
          keyboardType: TextInputType.text  ,
          obscureText: secure,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.leading,
            fillColor: AppColors.lightGrey,
            filled: true ,

            suffixIcon: widget.secure ? InkWell(
              onTap: () => setState(() => secure = !secure),
              child: Icon(
                secure ? FontAwesomeIcons.solidEyeSlash : FontAwesomeIcons.solidEye,
                size: 16.h,
                color: AppColors.grey,

              ),
            ) : SizedBox(),
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
            ),
            enabledBorder: getBorder(color: Colors.transparent),
            focusedBorder: getBorder(color: AppColors.lightGrey),
            errorBorder: getBorder(color: AppColors.red),
            focusedErrorBorder: getBorder(color: AppColors.red),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder getBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: color,

      ),
    );
  }
}