import 'dart:ui';

import 'package:bouek/app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late GoogleMapController _mapController;

  final LatLng _center = const LatLng(37.7749, -122.4194); // San Francisco
  LatLng? currentLocation;
  final Set<Marker> _markers = {}; // Store markers

  int count = 0;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  // Function to show permission dialog
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Location Permission Needed"),
        content: const Text("This app requires location access to show your position."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Close dialog
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close dialog
              await openAppSettings(); // Open device settings
            },
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  // Get current location and move camera
  Future<void> _goToCurrentLocation() async {
    bool serviceEnabled;
    // Check if permission is granted

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enable location services")),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, show error or message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission is required!")),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      _showPermissionDialog();
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    changeLocation(LatLng(position.latitude, position.longitude));

    await _mapController.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 15));
    setState(() {
      count = 1;
    });
  }

  void changeLocation(LatLng argument) {
    setState(() {
      currentLocation = argument;
      _markers.clear(); // Remove old marker
      _markers.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: currentLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // Blue marker
          infoWindow: const InfoWindow(title: "You are here"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCurrentLocation,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: Icon(
          currentLocation == null ? Icons.location_searching : Icons.my_location,
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            onTap: changeLocation,
            onCameraMoveStarted: () {
              if (count != 1) {
                setState(() {
                  currentLocation = null;
                  count = 0;
                });
              } else {
                count = 2;
              }
            },
            myLocationButtonEnabled: false,
            markers: _markers,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(34, 34),
                      padding: EdgeInsets.zero,
                    ),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: textBlackLightColor,
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.withValues(alpha: 0.1), // Semi-transparent blue
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Select your location',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: textBlackLightColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
