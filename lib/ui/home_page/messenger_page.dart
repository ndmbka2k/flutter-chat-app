import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_color.dart';
import 'package:flutter_login_app/common/app_input_field.dart';
import 'package:flutter_login_app/common/app_size.dart';
import 'package:flutter_login_app/ui/home_page/widgets/chat_box.dart';
import 'package:flutter_login_app/ui/home_page/widgets/story_bubble.dart';
import 'package:gap/gap.dart';

class MessengerPage extends StatelessWidget {
  const MessengerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Messenger',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: AppSize.storyListHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const StoryBubble();
                }
              ),
            ),
            const Gap(16),
            const Divider(color: AppColor.dividerColor),
            const Gap(16),
            const AppInputField(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            const Gap(16),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const ChatBox(),
                itemCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
