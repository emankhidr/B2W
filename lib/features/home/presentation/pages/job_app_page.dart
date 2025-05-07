 import 'package:flutter/material.dart';

import 'employee_app_page.dart';

class JobApplicationsScreen extends StatefulWidget {
  @override
  State<JobApplicationsScreen> createState() => _JobApplicationsScreenState();
}

class _JobApplicationsScreenState extends State<JobApplicationsScreen> {
  final List<Map<String, String>> applicants = [
    {'name': 'Alaa Mohamed', 'role': 'UI/UX designer', 'image': 'assets/images/Ellipse 189(1).png', 'email': 'alaa@gmail.com', 'cv': 'my_cv.pdf'},
    {'name': 'Jane Cooper', 'role': 'UI/UX designer', 'image': 'assets/images/Ellipse 189(2).png', 'email': 'jane@gmail.com', 'cv': 'jane_cv.pdf'},
    {'name': 'Cody Fisher', 'role': 'UI/UX designer', 'image': 'assets/images/Ellipse 189(3).png', 'email': 'cody@gmail.com', 'cv': 'cody_cv.pdf'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Senior UX Designer',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 12,
              child: Text(
                applicants.length.toString(),
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Applications (${applicants.length})',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: applicants.length,
                itemBuilder: (context, index) {
                  final applicant = applicants[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(applicant['image']!),
                    ),
                    title: Text(applicant['name']!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    subtitle: Text(applicant['role']!),
                    trailing: Icon(Icons.arrow_forward_outlined, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplicationDetailsScreen(applicant: applicant),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
