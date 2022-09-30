import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_size.dart';
import 'package:flutter_login_app/ui/chat_page/widgets/message_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemBuilder: (context, index) => MessageItem(
                isSentByMe: (index % 2 == 0) ? true : false,
              ),
              itemCount: 10,
              separatorBuilder: (context, index) => const Gap(12),
            ),
          ),
          _buildChatTextField(),
        ],
      ),
    );
  }

  Material _buildChatTextField() {
    return Material(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(FontAwesomeIcons.ellipsis),
            const Gap(16),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  fillColor: const Color(0xfff7f7fc),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      AppSize.borderRadiusRoundedMedium,
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                minLines: 1,
                maxLines: 6,
              ),
            ),
            const Gap(16),
            const Icon(FontAwesomeIcons.paperPlane),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: Navigator.of(context).pop,
        child: const Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
      ),
      titleSpacing: 0,
      title: const Text(
        'Minh ND',
        style: TextStyle(color: Colors.black),
      ),
      actions: const [
        Icon(
          FontAwesomeIcons.video,
          color: Colors.black,
        ),
        Gap(16),
        Icon(
          Icons.phone,
          color: Colors.black,
        ),
        Gap(16),
      ],
    );
  }
}
