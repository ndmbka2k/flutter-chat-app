import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StoryBubble extends StatelessWidget {
  const StoryBubble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: AppSize.storySize,
          width: AppSize.storySize,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadiusRounded),
            border: Border.all(color: const Color(0xfff7f7fc)),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF7F7Fc),
              borderRadius: BorderRadius.circular(AppSize.borderRadiusRounded),
            ),
            child: const Icon(FontAwesomeIcons.plus),
          ),
        ),
        const Text('Your Story'),
      ],
    );
  }
}
