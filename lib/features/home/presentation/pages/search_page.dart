import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../upload_jobs/presentation/widgets/custom_tabs_widget.dart';
import '../widgets/search_widgets/build_search_result.dart';
import '../widgets/search_widgets/buildrecentusers.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  bool isSearching = false;

  List<Map<String, String>> recentUsers = [
    {
      'name': 'Murad Mohamed',
      'role': 'Product manager',
      'image': 'assets/image/Ellipse 189(1).png'
    },
    {
      'name': 'Albert Flores',
      'role': 'President of Sales',
      'image': 'assets/image/Ellipse 189(2).png'
    },
    {
      'name': 'Darrell Steward',
      'role': 'Marketing Coordinator',
      'image': 'assets/image/Ellipse 189(3).png'
    },
  ];

  List<Map<String, String>> searchResults = [
    {'name': 'Elsie Cronin', 'role': 'Product manager'},
    {'name': 'Elsir Kronin', 'role': 'President of Sales'},
  ];

  final List<Map<String, String>> accounts = [
    {
      'name': 'Elsie Cronin',
      'role': 'Product manager',
      'image': 'assets/image/Ellipse 189(1).png'
    },
    {
      'name': 'Elsir kronin',
      'role': 'President of Sales',
      'image': 'assets/image/Ellipse 189(3).png'
    },
  ];

  final List<Map<String, String>> companies = [
    {
      'name': 'Murad',
      'role': 'Media agency',
      'image': 'assets/image/Ellipse 189(2).png'
    },
    {
      'name': 'Elsie Cronin',
      'role': 'Media agency',
      'image': 'assets/image/Ellipse 189(3).png'
    },
  ];
  final List<Map<String, String>> tags = [
    {
      'name': 'Elsie Cronin',
      'role': 'Media agency',
      'image': 'assets/image/Ellipse 189(1).png'
    },
  ];
  final List<Map<String, String>> allUsers = [
    {
      'name': 'Elsie Cronin',
      'role': 'Media agency',
      'image': 'assets/image/Ellipse 189(2).png'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: 304,
          height: 42,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: Color(0xFF7F00FF).withOpacity(0.8), width: 1),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                isSearching = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: AppColors.primary),
              suffixIcon: isSearching
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          isSearching = false;
                        });
                      },
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                    )
                  : Icon(Icons.mic, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 6),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 8),
        child: isSearching
            ? buildSearchResults(
                tabController: _tabController,
                accounts: accounts,
                companies: companies,
                tags: tags,
                allUser: allUsers,
              )
            : buildRecentUsers(recentUsers: recentUsers),
      ),
    );
  }
}
