import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../core/shared_widgets/custom_appbar_widget.dart';

import '../../../../core/utils/sizes.dart';
import '../../../../views/forgort_password/forget_pass_screen.dart';
import '../widgets/txt_field_password.dart';

class ManagePasswordPage extends StatefulWidget {
  const ManagePasswordPage({super.key});

  @override
  State<ManagePasswordPage> createState() => _ManagePasswordPageState();
}

class _ManagePasswordPageState extends State<ManagePasswordPage> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isHidden1 = true;
  bool isHidden2 = true;
  bool isHidden3 = true;
  bool isFormValid = false;

  void checkFormValidity() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarContent(title: "Manage password", context: context),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          onChanged: checkFormValidity, // يتحقق من صحة الحقول عند أي تغيير
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // تأكد إنه min علشان المشكلة تتحل
            children: [
              Text("Old password"),
              spaceHeight(5),
              formField(
                validate: (value) => validatePassword(value, isOld: true),
                mycontroller: oldPasswordController,
                isHidden: isHidden1,
                toggleVisibility: () {
                  setState(() {
                    isHidden1 = !isHidden1;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgotPasswordScreen();
                  },));
                },
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple,
                  ),
                ),
              ),
              spaceHeight(5),
              Text("New password"),
              spaceHeight(5),
              formField(
                validate: (value) => validatePassword(value),
                mycontroller: newPasswordController,
                isHidden: isHidden2,
                toggleVisibility: () {
                  setState(() {
                    isHidden2 = !isHidden2;
                  });
                },
              ),
              spaceHeight(10),
              Text("Confirm password"),
              spaceHeight(5),
              formField(
                validate: (value) => validateConfirmPassword(value, newPasswordController.text),
                mycontroller: confirmPasswordController,
                isHidden: isHidden3,
                toggleVisibility: () {
                  setState(() {
                    isHidden3 = !isHidden3;
                  });
                },
              ),
              SizedBox(height: 100), // استبدال الـ Spacer هنا
              ElevatedButton(
                onPressed: isFormValid
                    ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Password updated successfully!")),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFormValid ? Colors.purple : Colors.grey,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: isFormValid ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          ),
        ),
      ),
    );
  }

  String? validatePassword(String? value, {bool isOld = false}) {
    if (value == null || value.isEmpty) {
      return isOld ? "Please enter your old password" : "Password cannot be empty";
    }
    if (!isOld && value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String newPassword) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != newPassword) {
      return "Passwords do not match";
    }
    return null;
  }
}