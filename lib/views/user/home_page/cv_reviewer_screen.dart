import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/home_page/upload_overlay.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CvReviewerScreen extends StatelessWidget {
  Future<void> _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UploadOverlay()),
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
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40,),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Resume Reviewer",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h ,
              ),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     AppText(title: 'Upload Your ',color: AppColors.black,fontWeight: FontWeight.w700,fontSize: 24,),
                     AppText(title: ' Resume',color: AppColors.primary,fontWeight: FontWeight.w700,fontSize: 24,),
                     AppText(title: ' for Review',color: AppColors.black,fontWeight: FontWeight.w700,fontSize: 24,),

                   ],
                 ),
               ),
             ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: AppText(title: 'Get feedback to improve your resume and career opportunities',color: AppColors.grey,fontWeight: FontWeight.w400,fontSize: 12,)),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),

             Container(
               width: double.infinity,
               height: 350,
               decoration: BoxDecoration(
                 color: AppColors.white,
                 borderRadius: BorderRadius.circular(10.r)
               ),
               child: Column(
                 children: [
                   SizedBox(
                     height: 30.h,
                   ),
                   Row(mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset('Upload-amico 1'.assetPNG,width: 150,height: 150,)
                     ],
                   ),
                   SizedBox(
                     height: 8.h,
                   ),
                   Center(
                     child: Container(
                       width: 200,
                       height: 40,
                       decoration: BoxDecoration(
                           color: AppColors.primary,
                           borderRadius: BorderRadius.circular(10.r)
                       ),
                       child: InkWell(
                         onTap: () => _pickFile(context),


                         child: Padding(

                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,

                             children: [
                               Icon(Icons.file_upload_outlined,color: AppColors.white,size: 18,),
                               SizedBox(
                                 width: 4.w,
                               ),
                               AppText(title: 'Upload your cv',color: AppColors.white,fontSize: 16,fontWeight: FontWeight.w700,)
                             ],
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 8.h,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Center(child: AppText(title: 'Supported formats: PDF, DOCX | Max size: 5MB',color: AppColors.grey,fontWeight: FontWeight.w400,fontSize: 12,)),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
