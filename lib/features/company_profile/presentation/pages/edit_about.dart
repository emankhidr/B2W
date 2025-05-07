 import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';
import '../../../../core/shared_widgets/custom_buttom.dart';

class EditAboutPage extends StatefulWidget {
  @override
  _EditAboutPageState createState() => _EditAboutPageState();
}

class _EditAboutPageState extends State<EditAboutPage> {
  TextEditingController _controller = TextEditingController();
  int maxLength = 1000;

  @override
  void initState() {
    super.initState();
    _controller.text =
    "At Digital Creative Agency, we specialize in crafting innovative digital solutions that bring your brand to life. From eye-catching designs to strategic marketing and development, our mission is to help businesses thrive in the ever-evolving digital landscape.\n\nWith a team of creative thinkers and tech experts, we deliver tailored strategies that align with your vision and goals. Whether it’s building a strong online presence, designing captivating visuals, or driving impactful campaigns, we’re here to make it happen.\n\nLet's work together to create something extraordinary.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarContent(title: "about us", context: context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Us",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 342,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        maxLength: maxLength,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        onChanged: (text) {
                          setState(() {}); // لتحديث العداد
                        },
                      ),
                    ),
                    SizedBox(width: 10), // مسافة بين النص والأيقونة
                    Icon(Icons.open_in_new, color: Colors.grey, size: 20), // أيقونة بجانب النص
                  ],
                ),
              ),
            ),

            SizedBox(height: 5),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "${_controller.text.length}/$maxLength",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Spacer(),
            customButtom(title: 'Update', onTap: () {  }),
          ],
        ),
      ),
    );
  }
}
