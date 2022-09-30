import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_size.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, required this.isSentByMe}) : super(key: key);
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppSize.borderRadiusRoundedMedium),
            topRight: const Radius.circular(AppSize.borderRadiusRoundedMedium),
            bottomLeft: isSentByMe ? const Radius.circular(AppSize.borderRadiusRoundedMedium) : Radius.zero,
            bottomRight: isSentByMe ? Radius.zero : const Radius.circular(AppSize.borderRadiusRoundedMedium),
          )
          
        ),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: const Text('Hellooooooooasdsadsadsajdhsajkhfjksdhajkhadsfjkao'),
      ),
    );
  }
}
