import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  dynamic selectedIndex;
  dynamic setSelectedIndex;

  CustomBottomNavigation({Key? key, this.selectedIndex, this.setSelectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: AppColors.GRAY_COLOR,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.PRIMARY_COLOR,
          unselectedItemColor: AppColors.BLACK_COLOR,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage("assets/images/icon_home-selected.png")),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_calendar.png")),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_like.png")),
              label: "Likes",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_health.png")),
              label: "Health",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icon_profile.png")),
              label: "Profile",
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            setSelectedIndex(index);
          },
        ),
      ),
    );
  }
}
