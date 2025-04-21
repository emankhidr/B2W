import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/home_page/cv_reviewer1.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadOverlay extends StatefulWidget {
  const UploadOverlay({super.key});

  @override
  State<UploadOverlay> createState() => _UploadOverlayState();
}

class _UploadOverlayState extends State<UploadOverlay> {
  bool isDownloading = false;
  bool isDownloaded = false;

  void _downloadFile() {
    setState(() {
      isDownloading = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isDownloading = false;
        isDownloaded = true;
      });
      RouteUtils.push(context, CvReviewer1());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
              children: [
                Image.asset(
                  isDownloaded ? 'assets/images/Complete.png' : 'assets/images/Upload-amico 1.png',
                  width: 100,
                ),
                SizedBox(height: 14.h),
                if (isDownloaded)
                  Text(
                    "Your CV has been uploaded successfully.",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black),
                  ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: '          My cv',color: AppColors.black,fontWeight: FontWeight.w500,fontSize: 14,),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 250.w,
                  height: 8.h,

                  decoration: BoxDecoration(
                      color: isDownloaded ? AppColors.primary : (isDownloading ?AppColors.primary : AppColors.grey),
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                if (isDownloaded)
                  Icon(Icons.check_box_sharp, color: Colors.green, size: 30),
              ],
            ),
            SizedBox(height: 20),
            !isDownloaded?
            Container(

              width: 70.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                borderRadius: BorderRadius.circular(15.r)
              ),
              child: InkWell(

                onTap: isDownloaded ? () {
                  RouteUtils.push(context, CvReviewer1());
                } : _downloadFile,
                child: Center(
                  child: Text(isDownloaded ? "Done" : "Download",style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),),
                ),
              ),
            ): const SizedBox(),

          ],
        ),
      ),
    );
  }
}
