import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_button.dart';
import 'package:flutter_login_app/common/app_input_field.dart';
import 'package:flutter_login_app/config/app_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Messenger',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(
            FontAwesomeIcons.message,
            color: Colors.black,
          ),
          Gap(8),
          Icon(
            FontAwesomeIcons.listCheck,
            color: Colors.black,
          ),
          Gap(16),
        ],
      ),
      body: Column(
        children: [
          const AppInputField(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
          AppButton(
            title: 'Logout',
            onPressed: () async {
              final _navigator = Navigator.of(context);
              await FirebaseAuth.instance.signOut();
              _navigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
