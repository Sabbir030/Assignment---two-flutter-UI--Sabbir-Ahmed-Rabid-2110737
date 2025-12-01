import 'package:flutter/material.dart';
import 'package:uni_assignment/ui/profile.dart';
import 'package:uni_assignment/ui/setting.dart';
import 'summary.dart';
import 'homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = const [
    PageHome(),
    PageSummary(),
    PageSetting(),
    PageProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.purple),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_online, color: Colors.blue),
            label: 'Summary',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings, color: Colors.red),
            label: 'Setting',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle, color: Colors.green),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
