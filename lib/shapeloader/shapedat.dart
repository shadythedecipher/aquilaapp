import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class ShapeReader extends StatefulWidget {
  const ShapeReader({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ShapeReader> createState() => _ShapeReader();
}

class _ShapeReader extends State<ShapeReader>{
  late List<Model> _data;
  late MapShapeSource _mapSource;
  // late MapZoomPanBehavior  _mapzoombehaviour;
  @override
  void initState() {

    //_data = const <Model>[
      //Model('Tanzania', Color.fromRGBO(255, 215, 0, 1.0), 'tanzania'),
      // Model('Algeria', Color.fromRGBO(72, 209, 204, 1.0), 'ALG'),
      // Model('Angola', Color.fromRGBO(255, 78, 66, 1.0), 'ANG'),
      // Model('Benin', Color.fromRGBO(171, 56, 224, 0.75), 'BEN'),
      // Model('Botswana', Color.fromRGBO(126, 247, 74, 0.75), 'BOT'),
      // Model('Burkina Faso', Color.fromRGBO(79, 60, 201, 0.7), 'BUF'),
      // Model('Burundi', Color.fromRGBO(99, 164, 230, 1), 'BUR'),
      // Model('Cameroon', Colors.teal, 'CAM')
  //  ];

    _mapSource = const MapShapeSource.asset(
      'assets/jsonfiles/tz.json',
      shapeDataField: 'name',
      // dataCount: _data.length,
      // primaryValueMapper: (int index) => _data[index].countryname,
      // dataLabelMapper: (int index) => _data[index].stateCode,
      // shapeColorValueMapper: (int index) => _data[index].color,
    );
    // _mapzoombehaviour=MapZoomPanBehavior(zoomLevel: 5);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(2),
     child: Column(
           children: [
             const SizedBox(height: 50),
             const Text("Building shape File",),
             const SizedBox(
               height: 50,
             ),
             Expanded(child: SfMaps(
               layers: <MapShapeLayer>[
                 MapShapeLayer(
                   source: _mapSource,
                   showDataLabels: true,
                   //  //legend: const MapLegend(MapElement.shape),
                   // tooltipSettings: MapTooltipSettings(
                   //     color: Colors.grey[700],
                   //     strokeColor: Colors.white,
                   //     strokeWidth: 2),
                   // strokeColor: Colors.white,
                   // strokeWidth: 0.5,
                   // shapeTooltipBuilder: (BuildContext context, int index) {
                   //   return Padding(
                   //     padding: const EdgeInsets.all(8.0),
                   //     child: Text(
                   //       _data[index].stateCode,
                   //       style: const TextStyle(color: Colors.white),
                   //     ),
                   //   );
                   // },
                   // dataLabelSettings: MapDataLabelSettings(
                   //     textStyle: TextStyle(
                   //         color: Colors.black,
                   //         fontWeight: FontWeight.bold,
                   //         fontSize:
                   //         Theme.of(context).textTheme.caption!.fontSize)),
                   zoomPanBehavior: MapZoomPanBehavior(
                     // zoomLevel: 5,
                     enableDoubleTapZooming: true,
                   ),
                   onWillZoom: (MapZoomDetails zoomdetails){
                     print('on will zoom'+zoomdetails.newZoomLevel.toString());
                     print('on will lat'+zoomdetails.focalLatLng.toString());
                     return true;
                   },
                   onWillPan: (MapPanDetails pandetails){
                     print('on pan zoom'+pandetails.zoomLevel.toString());
                     print('on pan lat'+pandetails.focalLatLng.toString());
                     return true;
                   },

                 ),

               ],
               
             ),
             ),
           ],
             )
   );
  }
}


class Model {
  const Model(this.countryname, this.color, this.stateCode);

  final String countryname;

  final Color color;

  final String stateCode;
}