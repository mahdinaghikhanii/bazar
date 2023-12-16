import 'dart:convert';

import '../index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:http/http.dart' as http;
import 'package:svg_flutter/svg_flutter.dart';

class MapsWidgets extends StatefulWidget {
  final AddressController addressController;
  const MapsWidgets({super.key, required this.addressController});

  @override
  State<MapsWidgets> createState() => _MapsWidgetsState();
}

MapPickerController mapPickerController = MapPickerController();
late GoogleMapController mapController;
late CameraPosition cameraPosition;
late LatLng currentLocation;
String address = 'Search your location';

class _MapsWidgetsState extends State<MapsWidgets> {
  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  final LatLng _defualtLocation = const LatLng(25.2048, 55.2708);

  @override
  void initState() {
    super.initState();
    currentLocation = _defualtLocation;
    cameraPosition = CameraPosition(target: currentLocation);
  }

  //DateTime dateTimeEnd = widget.end == null ?  DateTime(0) : DateTime.parse(widget.end.toString());
  DateTime dateTiemStart = DateTime(0);
  DateTime dateTimeEnd = DateTime(0);

  void searchPlace(String value) async {
    String apiKey = 'AIzaSyAX-IrwlMX7e5vjm_kV5cx0PpEAP3iCiOo';
    String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$value&key=$apiKey&sessiontoken=1234567890&language=en';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'OK') {
        List<dynamic> predictions = jsonResponse['predictions'];
        if (predictions.isNotEmpty) {
          String placeId = predictions[0]['place_id'];
          getPlaceDetails(placeId);
        }
      }
    }
  }

  Set<Marker> markers = {};

  void addMarker(LatLng location) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          infoWindow: const InfoWindow(
            title: 'موقعیت جستجو شده',
          ),
        ),
      );
    });
  }

  void getPlaceDetails(String placeId) async {
    String apiKey = 'AIzaSyAX-IrwlMX7e5vjm_kV5cx0PpEAP3iCiOo';
    String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey&language=en';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 'OK') {
        double lat = jsonResponse['result']['geometry']['location']['lat'];
        double lng = jsonResponse['result']['geometry']['location']['lng'];
        LatLng location = LatLng(lat, lng);
        mapController.animateCamera(CameraUpdate.newLatLng(location));
        addMarker(location);
      }
    }
  }

  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 257,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MapPicker(
          // pass icon widget
          iconWidget: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              "assets/location_icon.svg",
              fit: BoxFit.contain,
              height: 30,
              colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.primary, BlendMode.srcIn),
            ),
          ),
          //add map picker controller
          mapPickerController: mapPickerController,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomGesturesEnabled: true,
            minMaxZoomPreference: const MinMaxZoomPreference(10, 15),
            tiltGesturesEnabled: false,
            markers: <Marker>{
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: currentLocation,
                infoWindow: const InfoWindow(),
              ),
            },
            onCameraMove: (CameraPosition position) async {
              currentLocation = position.target;

              final url =
                  'https://maps.googleapis.com/maps/api/geocode/json?latlng=${currentLocation.latitude},${currentLocation.longitude}&key=AIzaSyAX-IrwlMX7e5vjm_kV5cx0PpEAP3iCiOo';
              final response = await http.get(Uri.parse(url));
              if (response.statusCode == 200) {
                final data = json.decode(response.body);
                address = data['results'][0]['formatted_address'];
                widget.addressController.state.addressLocation.value = address;
              }
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
