import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text-field.dart';
import '../../../widget/app/app_text.dart';

class AddNewProject extends StatefulWidget {
  const AddNewProject({super.key});

  @override
  State<AddNewProject> createState() => _AddNewProjectState();
}

class _AddNewProjectState extends State<AddNewProject> {
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
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
            "Add New Project",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Project Title',color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextField
                (hint: 'EX :  bookind app',

                keyboardType: TextInputType.text,
                validator: (value)
                {
                  if (value!.isEmpty)
                  {
                    return 'Organization name must not be empty';

                  }
                  return null;

                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Description',color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
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
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Media',color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
                ],
              ),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: _selectedImage == null
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 40, color: AppColors.darkGrey),
                      SizedBox(height: 8),
                      Text(
                        'Upload your image (JPEG, PNG only) by clicking here',
                        style: TextStyle(color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                      : Image.file(
                    File(_selectedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: double.infinity,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.lightGrey,
                    ),

                  ),
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: AppColors.inputText,
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
    );
  }
}
