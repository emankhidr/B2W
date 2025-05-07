import 'package:flutter/material.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/freepik--speech-bubble--inject-59.png"),
              SizedBox(height: 16),

               Text(
                "Do you want to log out now?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We’ll be here when you return!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 16),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// زر الإلغاء
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.purple),
                        ),
                      ),
                      child: Text("Cancel"),
                    ),
                  ),
                  SizedBox(width: 10),

                   Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                       },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text("Log out"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
