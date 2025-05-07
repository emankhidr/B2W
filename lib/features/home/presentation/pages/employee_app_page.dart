
import 'package:b2w/features/home/presentation/pages/user_profile_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/sizes.dart';
import '../widgets/employee_app_widgets/custom_buttom.dart';
import '../widgets/employee_app_widgets/txt_fields.dart';

class ApplicationDetailsScreen extends StatefulWidget {
  final Map<String, String> applicant;

  ApplicationDetailsScreen({required this.applicant});

  @override
  State<ApplicationDetailsScreen> createState() =>
      _ApplicationDetailsScreenState();
}

class _ApplicationDetailsScreenState extends State<ApplicationDetailsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _commentController = TextEditingController();
  String? cvName;

  Future<void> pickCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        cvName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarContent(
          title: '${widget.applicant['name']!}', context: context),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorManger.lavender,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(widget.applicant['image']!),
                  ),
spaceWidth(12),                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.applicant['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.applicant['role']!,
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff7F00FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text("View Profile",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Application Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            buildDetailField(
                hintText: 'Full Name : ${widget.applicant['name']!}',
                controller: _nameController),
            SizedBox(
              height: 10,
            ),
            buildDetailField(
                hintText: 'Email : Alaa@gmail.com',
                controller: _emailController),
            SizedBox(
              height: 5,
            ),
            buildCVField(cvName: ' my cv.pdf', pickCVFile: () {}),
            buildCommentField(),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: customElevatedButtom(onTap: () {  }, title: 'Accept',   buttonColor: Colors.green)
                ),
                SizedBox(width: 10),
                Expanded(
                    child: customElevatedButtom(onTap: () {  }, title: 'Reject',   buttonColor: Colors.red)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
