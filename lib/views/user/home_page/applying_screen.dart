
import 'dart:io';

import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/job_screen/applying1_screen.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text-field.dart';

class ApplyingScreen extends StatefulWidget {

  @override
  State<ApplyingScreen> createState() => _ApplyingScreenState();
}

class _ApplyingScreenState extends State<ApplyingScreen> {
  String? uploadedFileName;
  String? uploadedFilePath;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  bool get isFormValid =>
      _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          uploadedFileName != null &&
          _commentController.text.isNotEmpty;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      String fileName = result.files.single.name;

      // ✅ Place this setState block right here
      setState(() {
        uploadedFileName = fileName;
        uploadedFilePath = filePath; // <-- Add this variable to your state
      });


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Uploaded: ${result.files.single.name}')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Applying for UX position",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onChanged: () {
              setState(() {}); // Refresh to enable button if form becomes valid
            },
            child: Column(
              children: [
                AppTextField(
                  controller: _nameController,
                  hint: 'Full name',
                  label: 'Full Name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) return 'Name must not be empty';
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                AppTextField(
                  controller: _emailController,
                  hint: 'Example@gmail.com',
                  label: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) return 'Email must not be empty';
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    AppText(
                      title: 'Upload your resume (CV)',
                      color: AppColors.inputText,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(height: 4.h),
                GestureDetector(
                  onTap: _pickFile,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: 358.w,
                    height: 167.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: uploadedFileName == null
                          ? Image.asset(
                        'upload'.assetPNG,
                        height: 48.h,
                        width: 48.w,
                        fit: BoxFit.contain,
                      ):
                      uploadedFileName!.endsWith('.pdf')
                          ? SfPdfViewer.file(File(uploadedFilePath!)) // 👈 This shows PDF inline!
                          : Text(
                        uploadedFileName!,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                  ),
                ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    AppText(
                      title: 'Any comment ?',
                      color: AppColors.inputText,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 170.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.grey,
                    )
                  ),
                  child: TextField(
                    controller: _commentController,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: 'type here ..',
                      helperStyle: TextStyle(color: AppColors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: isFormValid
                      ? () {
                    // Your action when everything is filled
                   RouteUtils.push(context, Applying1Screen());

                    // You can also clear the form if you want
                    // _nameController.clear();
                    // _emailController.clear();
                    // _commentController.clear();
                    setState(() {
                     uploadedFileName = null;
                    });
                  }
                      : null,
                  child: Container(
                    width: 358.w,
                    height: 48.h,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isFormValid ? AppColors.primary : AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: isFormValid ? AppColors.white : AppColors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}