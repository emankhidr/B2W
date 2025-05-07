
import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/sizes.dart';
import '../../data/models/job_details_model.dart';
import '../widgets/custom_info_item_widget.dart';
import '../widgets/custom_tabs_widget.dart';

class JobDetailsScreen extends StatefulWidget {
  final JobDetails jobDetails;
  JobDetailsScreen({required this.jobDetails});
  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(-1.0, 1.0),
                child: Image.asset(
                  "assets/images/Rectangle 1.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  color: Color(0xffEADCF8),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon:
                          Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.black),
                    ),
                    Text(
                      "${widget.jobDetails.jobTitle}",
                      style: StyleManger.black20bold()
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit_outlined,
                          size: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/images/Ellipse 13.png"),
                        ),
spaceWidth(8),                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Digital Creative Agency",
                              style: StyleManger.darkGrey20w400(),
                            ),
                            Text("5 days ago",
                            style: StyleManger.coolGray10w400(),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.jobDetails.jobTitle,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        Text("Mansours"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildInfo(
                    Icons.bar_chart, "Level", "${widget.jobDetails.jobLevel}"),
                buildInfo(
                    Icons.work, "Job type", " ${widget.jobDetails.jobType}"),
                buildInfo(Icons.attach_money, "Salary",
                    "   ${widget.jobDetails.salaryRange.start.toInt()}k - ${widget.jobDetails.salaryRange.end.toInt()}k "),
                buildInfo(Icons.work_outline, "Working model",
                    "${widget.jobDetails.workingModel}"),
              ],
            ),
          ),

          SizedBox(height: 16),

          // التبويبات
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: [
              Tab(
                  child: SizedBox(
                      width: double.infinity,
                      child: Center(child: Text("Description")))),
              Tab(
                  child: SizedBox(
                      width: double.infinity,
                      child: Center(child: Text("Requirements")))),
              Tab(
                  child: SizedBox(
                      width: double.infinity,
                      child: Center(child: Text("Company")))),
            ],
          ),

           Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildTab(
                    text: '${widget.jobDetails.description}',
                    tabTitle: 'Description',
                    enumData: fieldsType.description),
                buildTab(
                    enumData: fieldsType.reqyuirment,
                    text: '${widget.jobDetails.requirements}',
                    tabTitle: 'Requirement'),
                buildTab(
                    enumData: fieldsType.company,
                    text: '${widget.jobDetails.aboutCompany}',
                    tabTitle: 'Company'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
