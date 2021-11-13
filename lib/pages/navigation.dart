import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/pages/home_page/home_page.dart';
import 'package:memorybox/pages/profile/profile_page.dart';
import 'package:memorybox/pages/recording/recording_page.dart';
import 'package:memorybox/pages/collection/collections_page.dart';
import 'package:memorybox/pages/audio_recordings/audio_recordings_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    const HomePage(),
    const Collections(),
    const Recording(),
    const AudioRecordings(),
    const Profile(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _itemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    'Аудиосказки',
                    style: TextStyle(
                      color: black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Меню',
                    style: TextStyle(
                      color: grey,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/Home.svg',
                  color: black,
                ),
                title: const Text(
                  'Главня',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _itemTapped(_selectedIndex = 0);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/Profile.svg',
                  color: black,
                ),
                title: const Text(
                  'Профиль',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _itemTapped(_selectedIndex = 4);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/Category.svg',
                  color: black,
                ),
                title: const Text(
                  'Подборки',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _itemTapped(_selectedIndex = 1);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  color: black,
                ),
                title: const Text(
                  'Поиск',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => const AboutSideMenu(),
                  //   ),
                  // );
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/Delete.svg',
                  color: black,
                ),
                title: const Text(
                  'Недавно удаленные',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => const AboutSideMenu(),
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/Wallet.svg',
                  color: black,
                ),
                title: const Text(
                  'Подписка',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => const AboutSideMenu(),
                  //   ),
                  // );
                },
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/Edit.svg',
                  color: black,
                ),
                title: const Text(
                  'Написать в поддержку',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => const AboutSideMenu(),
                  //   ),
                  // );
                },
              ),
              //const Divider(),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 8.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: background,
            selectedItemColor: purple,
            unselectedItemColor: black,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: _selectedIndex,
            onTap: _itemTapped,
            items: [
              BottomNavigationBarItem(
                label: 'Главная',
                activeIcon: SvgPicture.asset(
                  'assets/icons/Home.svg',
                  color: purple,
                ),
                icon: SvgPicture.asset(
                  'assets/icons/Home.svg',
                  color: black,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Подборки',
                activeIcon: SvgPicture.asset(
                  'assets/icons/Category.svg',
                  color: purple,
                ),
                icon: SvgPicture.asset(
                  'assets/icons/Category.svg',
                  color: black,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: SvgPicture.asset(
                  'assets/icons/Component.svg',
                  color: rose,
                  
                ),
                icon: SvgPicture.asset(
                  'assets/icons/Component.svg',
                ),
              ),
              BottomNavigationBarItem(
                label: 'Аудиозаписи',
                activeIcon: SvgPicture.asset(
                  'assets/icons/Paper.svg',
                  color: purple,
                ),
                icon: SvgPicture.asset(
                  'assets/icons/Paper.svg',
                  color: black,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Профиль',
                activeIcon: SvgPicture.asset(
                  'assets/icons/Profile.svg',
                  color: purple,
                ),
                icon: SvgPicture.asset(
                  'assets/icons/Profile.svg',
                  color: black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
