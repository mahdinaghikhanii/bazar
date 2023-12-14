// ignore_for_file: deprecated_member_use
import 'package:bazar/data/api/api_client.dart';
import 'package:bazar/data/repo/home_repo.dart';
import 'package:bazar/pages/home/index.dart';
import 'package:bazar/pages/profile/profile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:svg_flutter/svg_flutter.dart';

import '../common/constans/images.dart';

const int profileIndex = 3;
const int notificationIndex = 2;
const int bookingIndex = 1;
const int homeIndex = 0;

class HomeNavigationPage extends StatefulWidget {
  final int? changeCurrentIndex;
  const HomeNavigationPage({super.key, this.changeCurrentIndex});

  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  // Key
  final GlobalKey<NavigatorState> _backupKey = GlobalKey();

  final GlobalKey<NavigatorState> _ticketKey = GlobalKey();
  final GlobalKey<NavigatorState> _walletKey = GlobalKey();
  final GlobalKey<NavigatorState> _gameKey = GlobalKey();

  late final map = {
    profileIndex: _backupKey,
    notificationIndex: _ticketKey,
    bookingIndex: _walletKey,
    homeIndex: _gameKey
  };
  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    if (widget.changeCurrentIndex != null) {
      setState(() {
        selectedScreenIndex = widget.changeCurrentIndex!;
      });
    }
  }

  // Controller inctance

  @override
  Widget build(BuildContext context) {
    Widget selectedScreen;
    switch (selectedScreenIndex) {
      case homeIndex:
        Get.put(HomeController(HomeRepo(ApiClient())));
        selectedScreen = const HomePage();
        break;
      case bookingIndex:
        // Get.put(BookingController(BookingRepo(ApiClient())));
        selectedScreen = const HomePage();
        break;
      case notificationIndex:
        // Get.put(NotificationController(NotiicationRepo(ApiClient())));
        // selectedScreen = const NotificationPage();
        selectedScreen = const HomePage();
        break;
      case profileIndex:
        // Get.put(ProfileController(ProfileRepo(ApiClient())));
        selectedScreen = const ProfilePages();
        break;
      default:
        selectedScreen = const SizedBox();
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          extendBody: true,
          body: selectedScreen,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Get.theme.colorScheme.primary,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Images.homeIcon,
                      color: selectedScreenIndex == 0
                          ? Get.theme.colorScheme.primary
                          : const Color(0xFF484C52)),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Images.categoryIcon,
                      color: selectedScreenIndex == 1
                          ? Get.theme.colorScheme.primary
                          : null),
                  label: "Category"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Images.cartIcon,
                      color: selectedScreenIndex == 2
                          ? Get.theme.colorScheme.primary
                          : null),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Images.profileIcon,
                      color: selectedScreenIndex == 3
                          ? Get.theme.colorScheme.primary
                          : null),
                  label: "Profile"),
            ],
            currentIndex: selectedScreenIndex,
            onTap: (selectIndex) {
              setState(() {
                selectedScreenIndex = selectIndex;
              });
            },
            type: BottomNavigationBarType.fixed,
          )),
    );
  }
}
