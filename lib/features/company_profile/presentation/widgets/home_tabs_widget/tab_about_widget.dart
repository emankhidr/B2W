import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/sizes.dart';
import '../../../../home/presentation/widgets/user_profile_widgets/profissional_info_tab.dart';

Widget aboutTab() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          buildSection(
              icon: Icons.account_box_outlined,
              title: 'about',
              child: Text(
                  '  At Digital Creative Agency, we specialize in crafting innovative digital solutions that bring your brand to life. From eye-catching designs to strategic marketing and development, our mission is to help businesses thrive in the ever-evolving digital landscape.'
                  ' With a team of creative thinkers and tech experts, we deliver tailored strategies that align with your vision and goals. Whether it’s building a strong online presence, designing captivating visuals, or driving impactful campaigns, we’re here to make it happen.'
                  ' Let’s work together to create something extraordinary and take your brand to the next level!'),
              pageName: 'COMPANY'),
          SizedBox(height: 20),
          buildSection(
            icon: Icons.place,
            title: 'Accessability',
            child: Column(children: [
              Row(
                children: [
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  spaceWidth(3),
                  Text("figma"),
                ],
              ),
              spaceHeight(5),
              Row(
                children: [
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  spaceWidth(3),
                  Text("figma"),
                ],
              ),
            ]),
            pageName: 'COMPANY',
          ),
        ],
      ),
    ),
  );
}
