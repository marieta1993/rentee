import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rentee/presentation/screens/home/main/location/Location_handler.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? _currentAddress;
  Position? _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  _currentPosition = await LocationHandler.getCurrentPosition();
                  _currentAddress = await LocationHandler.getAddressFromLatLng(
                      _currentPosition!);
                  setState(() {});
                },
                child: const Text("Get Current Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
