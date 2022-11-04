import 'package:aquila_android_application/getcurrentlocation/locationseraching.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../getcurrentlocation/globals.dart';
class testshape extends StatefulWidget{
  const testshape({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _testshape();
}

class _testshape extends State<testshape>{
  LocationSearchUi obj= const LocationSearchUi();
  final TextEditingController _currentLocationTextController =
  TextEditingController();
  late List<Model> _data;
  late MapShapeSource source;
  var lat;
  var long;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Row(
          children: [
            //Current location text field.
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: TextField(

                  controller: _currentLocationTextController,

                  style: const TextStyle(color: Colors.blueAccent),
                  decoration:  InputDecoration(
                    fillColor: const Color(0xFF0E3311).withOpacity(0.5),
                    contentPadding: const EdgeInsets.only(
                        left: 10, right: 3, top: 3, bottom: 3),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                    hintText: 'Current location',
                    hintStyle: const TextStyle(color: Colors.white),


                  ),
                ),
              ),
            ),
            //Current location clickable icon.

          ],
        ),
        Expanded(child:
        SfMaps(layers: [

          // MapShapeLayer(
          //   source: source,
          //   showDataLabels: true,
          //   legend: const MapLegend(MapElement.shape),
          //
          // ),
          MapTileLayer(
            markerBuilder: (BuildContext context, int index) {
              return  const MapMarker(
                  latitude: -6.8282725,
                  longitude: 37.67408,
                  child: Icon(Icons.location_on,
                    color: Colors.limeAccent,
                  )
              );
            },
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            zoomPanBehavior: MapZoomPanBehavior(
              zoomLevel: 15,
              enableDoubleTapZooming: true,
              enablePinching: true,
              enablePanning: true,
             focalLatLng: const MapLatLng(-6.8282725,37.67408),
            ),
          ),

        ],

        ),
        ),
      ],
    );
  }

  @override
  void initState() {
    _data= const<Model>[
      Model("Tanzania", Colors.amber)
    ];
    source=  MapShapeSource.asset(
      'assets/jsonfiles/tz.json',
      shapeDataField: 'name',
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].countryname,
      shapeColorValueMapper: (int index) => _data[index].color,

    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _currentLocationTextController.dispose();
  }
}



class Model {
  const Model(this.countryname, this.color);
  final String countryname;
  final Color color;
}