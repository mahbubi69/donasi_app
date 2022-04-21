import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/screen/home_screen.dart';
import 'package:donasi_app/view/screen/report_donasi_screen.dart';
import 'package:donasi_app/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class NavigationBarStyle extends StatefulWidget {
  const NavigationBarStyle({Key? key}) : super(key: key);

  @override
  State<NavigationBarStyle> createState() => _NavigationBarStyleState();
}

class _NavigationBarStyleState extends State<NavigationBarStyle> {
  int layoutPage = 0;

  // ignore: non_constant_identifier_names
  final List<Widget> ListLayout = [
    const HomeScreen(),
    const NotivocationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          ListLayout.elementAt(layoutPage),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: BottomNavigationBar(
                  selectedItemColor: pink,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  backgroundColor: kprimary,
                  currentIndex: layoutPage,
                  onTap: (int index) {
                    setState(() {
                      layoutPage = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications_outlined),
                        label: 'Notif'),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
