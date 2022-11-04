import 'package:aquila_android_application/container%20animation/test2.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'globals.dart' as globals;
class LocationSearchUi extends StatefulWidget{
  const LocationSearchUi({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> LocationSearch();
}
class LocationSearch extends State<LocationSearchUi>{
  late LocationData _locationData;

  var latitude;
  var longitide;

  final MapShapeLayerController _layerController = MapShapeLayerController();
  final TextEditingController _currentLocationTextController =
  TextEditingController();
  late MapZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = MapZoomPanBehavior(
      zoomLevel: 100,enablePinching: true,
      enablePanning: true,
      enableDoubleTapZooming: true,
    );
  }



  @override
  void dispose() {
    _layerController.dispose();
    _currentLocationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Container(
     width: double.infinity,
     height: double.infinity,
     decoration: const BoxDecoration(
       color: Color(0xFF096770),

     ),

     child: Column(
       children: [
         const Padding(
           padding: EdgeInsets.all(20.0),
           child: Text(
             'Location Tracker',
             style: TextStyle(
                 fontSize: 30,
                 color: Colors.white,
                 fontWeight: FontWeight.bold),
           ),
         ),
         Row(
           children: [
             //Current location text field.
             Expanded(
               child: Container(
                 padding: const EdgeInsets.all(10),
                 child: TextField(
                   controller: _currentLocationTextController,
                   style: const TextStyle(color: Colors.white),
                   decoration: const InputDecoration(
                     contentPadding: EdgeInsets.only(
                         left: 10, right: 3, top: 3, bottom: 3),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.white),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.white),
                     ),
                     hintText: 'Current location',
                     hintStyle: TextStyle(color: Colors.white),
                   ),
                 ),
               ),
             ),
             //Current location clickable icon.
             IconButton(
               icon: const Icon(
                 Icons.my_location,
                 color: Colors.white,
               ),
               tooltip: 'My location',
               onPressed: () async {
                 Location location = Location();

                 bool _serviceEnabled;
                 PermissionStatus _permissionGranted;
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
                 latitude=_locationData.latitude;
                 longitide=_locationData.longitude;
                 GeoCode geoCode = GeoCode();
                 Address address = await geoCode.reverseGeocoding(latitude: latitude, longitude: longitide);
                 print("location is "+ _locationData.toString());
                 _layerController.insertMarker(0);
                 _currentLocationTextController.text = address.countryName!+" "+ address.city!+" "+address.streetAddress!;
                  _zoomPanBehavior.focalLatLng= MapLatLng(latitude, longitide);
                  globals.data1=latitude;
                  globals.data2= longitide;

               },
             ),
           ],
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: SfMaps(
               layers: [

                 MapShapeLayer(
                   markerBuilder: (BuildContext context, int index) {
                     return  MapMarker(
                         latitude: latitude,
                         longitude: longitide,
                         child: const test2(),
                     );
                   },
                   controller: _layerController,
                   source: const MapShapeSource.asset(
                     "assets/jsonfiles/Africa.json",
                     shapeDataField: 'COUNTRY',
                   ),
                   zoomPanBehavior: _zoomPanBehavior,

    ),

               ],
             ),
           ),
         ),
       ],
     ),
   );
  }
}