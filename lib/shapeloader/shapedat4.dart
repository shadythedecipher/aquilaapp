import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class ShapeReader1 extends StatefulWidget{
  const ShapeReader1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=> _ShapeReader();
}

class _ShapeReader extends State<ShapeReader1>{
  final MapShapeLayerController _layerController = MapShapeLayerController();
  final TextEditingController _currentLocationTextController =
  TextEditingController();
  final TextEditingController _destinationLocationTextController =
  TextEditingController();
  late double _distanceInMiles;

  late Position _currentPosition, _destinationPosition;

  @override
  void dispose() {
    _layerController.dispose();
    _currentLocationTextController.dispose();
    _destinationLocationTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor: const Color(0xFF096770),
     body: SafeArea(
       child: Column(
         children:  [
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
                 onPressed: () async {},
               ),
             ],
           ),
           Row(
             children: [
               //Destination location text field.
               Expanded(
                 child: Container(
                   padding: const EdgeInsets.all(10),
                   child: TextField(
                     controller: _destinationLocationTextController,
                     style: const TextStyle(color: Colors.white),
                     decoration: const InputDecoration(
                       hintStyle: TextStyle(color: Colors.white),
                       contentPadding: EdgeInsets.only(
                           left: 10, right: 3, top: 3, bottom: 3),
                       hintText: 'Enter a name for the place',
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white),
                       ),
                     ),
                   ),
                 ),
               ),
               //Destination location clickable icon.
               IconButton(
                 icon: const Icon(
                   Icons.search,
                   color: Colors.white,
                 ),
                 tooltip: 'Search',
                 onPressed: () async {},
               )
             ],
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: SfMaps(
                 layers: [
                   MapShapeLayer(
                       controller: _layerController,
                       source: const MapShapeSource.asset(
                         "assets/Africa.json",
                         shapeDataField: 'COUNTRY',
                       ),

                   ),

                 ],
               ),
             ),
           ),

             Card(
       child: Padding(
         padding: const EdgeInsets.all(20),
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:  [
             RichText(text:const TextSpan(
                 children: [
                   TextSpan(
                       text: ' miles.',// sijaweka ii ${_distanceInMiles?.toStringAsFixed(2) ?? '-'}
                       style: TextStyle(
                           fontSize: 20,
                           fontStyle: FontStyle.italic,
                           color: Colors.black)),
                   TextSpan(
                       text: '${'-'} miles.',
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 20,
                           color: Colors.black))

                 ],
             ),
               
             ),

             ],
         ),
         
       ),
     ),
           const SizedBox(height: 10),
     Row (
         children: [
           OutlineButton(
             child: const Text('Navigate'),
             textColor: Colors.black,
             onPressed: () async {},
           ),
           const SizedBox(
             width: 15,
           ),
           OutlineButton(
             child: const Text('Remove tracker'),
             onPressed: () {},
           )
         ],
     ),
     ],
       ),
     ),
   );
  }


}

