import 'package:b2w/features/upload_jobs/presentation/pages/add_post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/utils/colors.dart';
import 'chats/presentation/pages/conversation_page.dart';
import 'home/presentation/pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    PostJobPage(),
    ConversationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x7F7F00FF).withOpacity(0.5),
                blurRadius: 35,
                spreadRadius: 15,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: BottomAppBar(
            height: 70,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navItem(Icons.home, "Home", 0),
                  SizedBox(width: 60), // ترك فراغ للزر العائم
                  navItem(Icons.chat, "Chats", 2),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: () => _onTabSelected(1),
                backgroundColor:AppColors.primary,
                shape: CircleBorder(),
                elevation: 12.0,
                child: Icon(Icons.add, color: Colors.white, size: 30),
              ),
              SizedBox(height: 4), // مسافة بين الزر والنص
              Text("Post", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? AppColors.primary : Colors.grey),
          Text(label, style: TextStyle(color: isActive ?AppColors.primary: Colors.grey)),
        ],
      ),
    );
  }
}
