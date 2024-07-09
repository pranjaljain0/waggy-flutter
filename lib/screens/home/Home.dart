import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/screens/home/Health/HealthPane.dart';
import 'package:waggy/screens/home/NGOs/NGOPane.dart';
import 'package:waggy/screens/home/Profile/ProfilePane.dart';
import 'package:waggy/screens/home/Recommendation/Recommendation.dart';
import 'package:waggy/screens/home/events/Events.dart';
import 'package:waggy/utils/DataHandler.dart';

import 'package:waggy/widgets/BottomNav.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  static var _authScreenContext;

  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  var pages = [
    const Recommendation(),
    const Events(),
    const HealthPane(),
    const NGOPane(),
    const ProfilePane(),
  ];

  locationService() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    location.onLocationChanged.listen((currentLocation) {});
  }

  _setSelectedIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    locationService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.LIGHT_YELLOW_COLOR,
        body: pages[_selectedIndex],
        bottomNavigationBar: CustomBottomNavigation(
            selectedIndex: _selectedIndex,
            setSelectedIndex: _setSelectedIndex));
  }
}
