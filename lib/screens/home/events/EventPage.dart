import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waggy/constants/Colors.dart';
import 'package:waggy/widgets/Common/Heading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
    setState(() {
      _kGooglePlex = CameraPosition(
        target: LatLng(_locationData.latitude!, _locationData.longitude!),
        zoom: 14.4746,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    locationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 420,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/event_page_hero.png"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 20 + 32,
                  left: 20,
                  child: ClipOval(
                    child: Material(
                      color: AppColors.GRAY_COLOR, // button color
                      child: InkWell(
                        splashColor: AppColors.BLACK_COLOR, // inkwell color
                        child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.chevron_left)),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Dog adoption event",
                          style: TextStyle(
                              color: AppColors.WHITE_COLOR,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on,
                              size: 18,
                              color: AppColors.WHITE_COLOR,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "2km away",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.WHITE_COLOR),
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
                              size: 18,
                              color: AppColors.WHITE_COLOR,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "02 March",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.WHITE_COLOR),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20,
            ),
            child: Row(
              children: [
                const Text("Cash & 20 other are attending this event")
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Heading(label: "About"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tempus lacus in quam laoreet, eget finibus orci pharetra. Sed molestie leo eget urna egestas tristique. Pellentesque habitant morbi tristique seneds netus..."),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Heading(label: "Location"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: 120,
                    width: MediaQuery.of(context).size.width - 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GoogleMap(
                        myLocationEnabled: false,
                        myLocationButtonEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Heading(label: "Contact Details"),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Text(
                          "Address: Lorem ipsum dolor sit amet, consectetur adipiscing elit. "),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Text("Contact: + 91 887876688"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
