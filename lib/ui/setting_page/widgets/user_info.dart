import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xffededed),
          child: Icon(Icons.person,
          color: Colors.grey,),
        ),
        const Gap(20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Long NHH'),
                Text('0234222222')
            ],
          ),
        ),
        const Gap(16),
        Icon(FontAwesomeIcons.chevronRight)
      ],
    );
  }
}