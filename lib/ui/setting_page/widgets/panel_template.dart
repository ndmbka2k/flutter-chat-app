import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class PanelTemplate extends StatelessWidget {
  const PanelTemplate({
    Key? key,
    this.prefixIcon,
    required this.title,
  }) : super(key: key);

  final Icon? prefixIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(prefixIcon != null) prefixIcon!,
        Expanded(
          child: Text(title),
        ),
        Gap(8),
        Icon(FontAwesomeIcons.chevronRight),
      ],
    );
  }
}
