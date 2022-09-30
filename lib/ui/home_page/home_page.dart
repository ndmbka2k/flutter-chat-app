import 'package:flutter/material.dart';
import 'package:flutter_login_app/ui/directory_page/directory_page.dart';
import 'package:flutter_login_app/ui/home_page/messenger_page.dart';
import 'package:flutter_login_app/ui/setting_page/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MessengerPage(),
          DirectoryPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Directory',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Setting',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        _controller.jumpToPage(index);
      },
    );
  }
}
