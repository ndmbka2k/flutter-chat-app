import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_color.dart';
import 'package:flutter_login_app/common/app_size.dart';
import 'package:flutter_login_app/config/app_config.dart';
import 'package:gap/gap.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppConfig.chatPage),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildThumbnail(),
          const Gap(12),
          _buildContent()
        ],
      ),
    );
  }

  Expanded _buildContent() {
    return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Athalia Putri'),
                Text('Today'),
              ],
            ),
            const Gap(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Good morning, did you sleep well?',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffd2d5f9),
                    borderRadius: BorderRadius.circular(
                      AppSize.borderRadiusCircular,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  child: const Text('1'),
                )
              ],
            ),
          ],
        ),
      );
  }

  Container _buildThumbnail() {
    return Container(
      height: AppSize.thumnailChatBoxSize,
      width: AppSize.thumnailChatBoxSize,
      alignment: Alignment.topRight,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppSize.borderRadiusRoundedMedium),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  'https://znews-photo.zingcdn.me/w660/Uploaded/qhj_yvobvhfwbv/2018_07_18/Nguyen_Huy_Binh1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10000),
              ),
              padding: const EdgeInsets.all(2),
              child: const CircleAvatar(
                radius: AppSize.activeSignRadius,
                backgroundColor: AppColor.activeSignColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
