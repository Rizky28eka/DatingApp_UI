import 'package:datingapp_ui/common/narrow_app_bar.dart';
import 'package:datingapp_ui/styleguide/colors.dart';
import 'package:datingapp_ui/styleguide/text_style.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NarrowAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
        trailing: Icon(Icons.edit, color: primaryColor),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Messages",
              style: headingTextStyle.copyWith(color: Colors.black),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search messages",
                  hintStyle: subTitleStyle.copyWith(color: hintTextColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: 10,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                indent: 80,
                color: Colors.grey.shade200,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/anne.jpeg",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (index % 3 == 0)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Anne", style: titleStyle.copyWith(fontSize: 18)),
                      Text("14:20", style: subTitleStyle.copyWith(fontSize: 12)),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "Hey, how was your day? Would you like to meet up sometime?",
                      style: subTitleStyle.copyWith(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  onTap: () {
                    // Navigate to individual chat
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
