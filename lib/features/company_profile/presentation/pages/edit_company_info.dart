import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';
import '../../../../core/shared_widgets/custom_buttom.dart';
import '../widgets/edit_company_info_widget/txt_fields.dart';

class EditCompanyScreen extends StatefulWidget {
  const EditCompanyScreen({super.key});

  @override
  _EditCompanyScreenState createState() => _EditCompanyScreenState();
}

class _EditCompanyScreenState extends State<EditCompanyScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController companyWorkController = TextEditingController();
  TextEditingController webSiteLinkController = TextEditingController();
  TextEditingController socialMediaController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final List<String> fieldsOfWork = [
    "Digital Products",
    "Marketing",
    "Software Development",
    "Consulting",
    "E-commerce"
  ];
  final List<String> locations = [
    "6 October",
    "Mansoura",
    "Cairo",
    "Alex",
    "Giza"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarContent(title: "Edit Company Information", context: context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                        const NetworkImage("assets/images/Ellipse 13.png"),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -15,
                    child: Container(

                      padding: const EdgeInsets. only(bottom: 5,right: 5),
                      decoration: BoxDecoration(

                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildTextField(
                "Company Name", emailAddressController, Icons.open_in_new),
            buildTextField(
                "Email Address", emailAddressController, Icons.open_in_new),
            buildTextFieldWithDropdown(
              label: "What is your company's field of work?",
              controller: companyWorkController,
              options: fieldsOfWork,
            ),
            buildTextField("Website link (if available)", webSiteLinkController,
                Icons.open_in_new),
            buildTextField(
                "Social media links ", socialMediaController, Icons.add,
                maxLines: 3),
            buildTextField(
                "Brief description of the company and its activities ",
                descriptionController,
                Icons.open_in_new,
                maxLines: 3),
            buildTextFieldWithDropdown(
              label: 'Company Location',
              controller: locationController,
              options: locations,
            ),
            const SizedBox(height: 20),
            customButtom(title: "Update", onTap: () {})
          ],
        ),
      ),
    );
  }
}
