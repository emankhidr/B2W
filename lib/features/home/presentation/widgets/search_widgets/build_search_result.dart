
import 'package:b2w/features/home/presentation/widgets/search_widgets/tabs/accounts_tab.dart';
import 'package:b2w/features/home/presentation/widgets/search_widgets/tabs/all_tab.dart';
import 'package:b2w/features/home/presentation/widgets/search_widgets/tabs/company_tab.dart';
import 'package:b2w/features/home/presentation/widgets/search_widgets/tabs/tags_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

Widget buildSearchResults({
  required TabController tabController,
  required List<Map<String, String>> accounts,
  required List<Map<String, String>> companies,
  required List<Map<String, String>> tags,
  required List<Map<String, String>> allUser,
}) {
  return Column(
    children: [
      TabBar(
        controller: tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        tabs: [
          Tab(child: SizedBox(width: double.infinity, child: Center(child: Text("All")))),
          Tab(child: SizedBox(width: double.infinity, child: Center(child: Text("Accounts")))),
          Tab(child: SizedBox(width: double.infinity, child: Center(child: Text("Company")))),
          Tab(child: SizedBox(width: double.infinity, child: Center(child: Text("Tags")))),
        ],
      ),
      Expanded(
        child: TabBarView(
          controller: tabController,
          children: [
            alluser(allUser: allUser),
            accountTab(accounts: accounts),
            companyTab(companies: companies),

            tagsTab(tags:tags)
          ],
        ),
      ),
    ],
  );
}
