import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget openJobTab() {
  final List<Map<String, dynamic>> jobs = [
    {
      'image': 'assets/images/Ellipse 13.png',
      "title": "Senior UX Designer",
      "salary": "\$50-70K",
      "location": "New York, NY",
      "time": "5 days ago",
      "contract": ["Part-time", "Remotely"],
    },
    {
      'image': 'assets/images/Ellipse 13.png',
      "title": "Junior UI Designer",
      "salary": "\$40-50K",
      "location": "Los Angeles, CA",
      "time": "2 weeks ago",
      "contract": ["Full-time", "In-office"],
    },
    {
      'image': 'assets/images/Ellipse 13.png',
      "title": "Digital Marketing Specialist",
      "salary": "\$60-80K",
      "location": "Chicago, IL",
      "time": "3 days ago",
      "contract": ["Full-time", "Hybrid"],
    },
  ];
  return ListView.builder(
    padding: EdgeInsets.all(16),
    itemCount: jobs.length,
    itemBuilder: (context, index) {
      final job = jobs[index];

      return Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

            color: Colors.white,border: Border.all(color: Colors.grey)),
        margin: EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                 Image.asset(jobs[index]["image"],height: 55,width: 55,),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Digital Creative Agency",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(job["time"],
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  Icon(Icons.edit, color: Colors.grey),
                ],
              ),
              SizedBox(height: 8),
              Text(job["title"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 8),
              Row(
                children: job["contract"]
                    .map<Widget>((contract) => Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Container(
                            child: Center(child: Text(contract,style: TextStyle(fontSize: 12),)),
                            height: 22,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Color(0xffF2E5FF),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height:15),
              Center(
                child: Container(
                  width: 191,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.purple
                      ], // عكس التدرج
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              Text(job["salary"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(job["location"],
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("More Details...",
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],)


            ],
          ),
        ),
      );
    },
  );
}
