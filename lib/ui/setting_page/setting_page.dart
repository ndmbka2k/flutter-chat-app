import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_button.dart';
import 'package:flutter_login_app/config/app_config.dart';
import 'package:flutter_login_app/ui/setting_page/widgets/panel_template.dart';
import 'package:flutter_login_app/ui/setting_page/widgets/user_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const UserInfo(),
            const Gap(32),
            for (Widget panel in _infoPanels) ...[
              const Gap(16),
              panel,
              const Gap(16),
            ],
            AppButton(
              title: 'Logout',
              onPressed: () async {
                final navigator = Navigator.of(context);
                // await FirebaseAuth.instance.signOut();
                navigator.pushReplacementNamed(AppConfig.loginPage);
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<Widget> _infoPanels = const [
    PanelTemplate(
      prefixIcon: Icon(Icons.person),
      title: 'Account',
    ),
    PanelTemplate(
      prefixIcon: Icon(FontAwesomeIcons.message),
      title: 'Chat',
    ),
    PanelTemplate(
      prefixIcon: Icon(FontAwesomeIcons.lightbulb),
      title: 'Appearance',
    ),
    PanelTemplate(
      prefixIcon: Icon(FontAwesomeIcons.bell),
      title: 'Notification',
    ),
    PanelTemplate(
      prefixIcon: Icon(FontAwesomeIcons.shieldHalved),
      title: 'Privacy',
    ),
    PanelTemplate(
      prefixIcon: Icon(FontAwesomeIcons.folder),
      title: 'Data Usage',
    ),
    PanelTemplate(
      prefixIcon: Icon(FontAwesomeIcons.circleQuestion),
      title: 'Help',
    ),
    PanelTemplate(
      prefixIcon: Icon(FontAwesomeIcons.mailchimp),
      title: 'Invite Your Friend',
    ),
  ];
}
