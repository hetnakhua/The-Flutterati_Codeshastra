import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;




class MapScreen extends StatefulWidget {

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late LatLng mapLatLong;
  final _searchcontroller = TextEditingController();
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Future<Map<String, double>> getLatLong(String locationName) async {
    final apiKey = 'AIzaSyAYlnWfJmrLllLb5rUlaNrtR-QFt1HdGUI';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$locationName&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    final responseBody = json.decode(response.body);

    if (responseBody['status'] == 'OK') {
      final location = responseBody['results'][0]['geometry']['location'];
      final lat = location['lat'];
      final lng = location['lng'];
      return {'lat': lat, 'lng': lng};
    } else {
      throw Exception('Failed to retrieve latitude and longitude');
    }
  }

  //intial positon
  static final CameraPosition _intialpositon =  CameraPosition(
    target: LatLng(19.115755, 72.88141659999999),
    zoom: 13,
  );

  List<Marker> _markers = <Marker>[];
  //markers
  List<Marker> _list = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(19.0968, 72.8517),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(19.115755, 72.88141659999999),
    ),
  ];

  void initState(){
    super.initState();
    _markers.addAll(_list);
    mapLatLong = LatLng(19.115755, 72.88141659999999);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          GoogleMap(initialCameraPosition: _intialpositon),
          // GoogleMap(
          //   initialCameraPosition: _intialpositon,
          //   markers: {
          //     Marker(
          //         markerId: MarkerId('1'),
          //         position: LatLng(19.0968, 72.8517),
          //         onTap: (){
          //           showModalBottomSheet(context: context, builder: (BuildContext context) {
          //             return Container(
          //                 child: Padding(
          //                     padding: const EdgeInsets.all(32.0),
          //                     child: Text('Write your text',
          //                         textAlign: TextAlign.center,
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 24.0
          //                         )
          //                     )
          //                 )
          //             );
          //           });
          //         }
          //
          //
          //     ),
          //     // Marker(
          //     //     markerId: MarkerId('2'),
          //     //     position: LatLng(19.115755, 72.88141659999999),
          //     //     onTap: (){
          //     //       showModalBottomSheet(context: context, builder: (BuildContext context) {
          //     //         return Container(
          //     //             child: Padding(
          //     //               padding: const EdgeInsets.all(8.0),
          //     //               // child: UserCard(user:  MapUser("Phillipp lachner", "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80", "1", "4.3", "philliplacher445@gmail.com", "vile parle", "7", <MapImagePost>[], ["Wedding", "Events"] )
          //     //               child: Placeholder()
          //     //                 ,),
          //     //             )
          //     //         );
          //     //       });
          //     //     }
          //     // ),
          //     // //jw_marriot1
          //     // Marker(
          //     //     markerId: MarkerId('2'),
          //     //     position: latlong.jw_marriot1,
          //     //     onTap: (){
          //     //       showModalBottomSheet(context: context, builder: (BuildContext context) {
          //     //         return Container(
          //     //             child: Padding(
          //     //               padding: const EdgeInsets.all(8.0),
          //     //               child: UserCard(user:  MapUser("Rohti nehra", "https://media.istockphoto.com/id/1370008252/photo/professional-photographer-in-the-mountains-at-sunset.jpg?s=2048x2048&w=is&k=20&c=OuhdQzcOig65FbZo3VUtlYYoHLQAkTdK72f3uoF2IP4=", "3", "3.8", "philliplacher445@gmail.com", "mulund", "7", <MapImagePost>[], ["Wedding photographer", "Events"] )
          //     //                 ,),
          //     //             )
          //     //         );
          //     //       });
          //     //     }
          //     // ),
          //     // //jw_marriot2
          //     // Marker(
          //     //     markerId: MarkerId('2'),
          //     //     position: latlong.jw_marriot2,
          //     //     onTap: (){
          //     //       showModalBottomSheet(context: context, builder: (BuildContext context) {
          //     //         return Container(
          //     //             child: Padding(
          //     //               padding: const EdgeInsets.all(8.0),
          //     //               // child: UserCard(user:  MapUser("Rishi jain", "https://media.istockphoto.com/id/1363870324/photo/cheerful-young-man-smiling-on-blue-background.jpg?s=2048x2048&w=is&k=20&c=KKFtmzQZsS_Wap5r2vXb8XxBguirLbiuzWNxm-vxthE=", "1", "4.8", "philliplacher445@gmail.com", "Churchgate", "7", <MapImagePost>[], ["Fine art photographer", "Events"] )
          //     //               //   ,),
          //     //               child: Container(
          //     //                 width: double.infinity,
          //     //                 height: 450,
          //     //                 margin: EdgeInsets.all(16),
          //     //
          //     //                 decoration: BoxDecoration(
          //     //                   borderRadius: BorderRadius.circular(20.0),
          //     //                   color: Colors.grey[200],
          //     //                 ),
          //     //                 child: ListView(
          //     //                   children: [
          //     //
          //     //                     Container(
          //     //                       height: 120,
          //     //                       width: double.infinity,
          //     //                       // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          //     //                       child: Card(
          //     //                         shape: RoundedRectangleBorder(
          //     //                           borderRadius: BorderRadius.circular(20),
          //     //                         ),
          //     //                         child: Row(
          //     //                           children: [
          //     //                             SizedBox(width: 10,),
          //     //                             CircleAvatar(
          //     //                               maxRadius: 40,
          //     //                               backgroundImage: NetworkImage("https://media.istockphoto.com/id/1363870324/photo/cheerful-young-man-smiling-on-blue-background.jpg?s=2048x2048&w=is&k=20&c=KKFtmzQZsS_Wap5r2vXb8XxBguirLbiuzWNxm-vxthE="),
          //     //                             ),
          //     //                             Expanded(
          //     //                                 child: Padding(
          //     //                                   padding: EdgeInsets.all(12),
          //     //                                   child: Column(
          //     //                                     // mainAxisAlignment: MainAxisAlignment.,
          //     //                                     crossAxisAlignment: CrossAxisAlignment.start,
          //     //                                     children: [
          //     //                                       Text("Rishi jain", style: TextStyle(fontSize: 22, color: Colors.white),),
          //     //                                       Text("Wedding Photgrapher", style: TextStyle(fontSize: 14, color: Colors.white54),),
          //     //                                       SizedBox(height: 10,),
          //     //                                       SizedBox(
          //     //                                         // width: 90,
          //     //                                         height: 30,
          //     //                                         child: Row(
          //     //                                           children: [
          //     //                                             Icon(Icons.star, color: Colors.yellow,),
          //     //                                             Text("4.3", style: TextStyle(color: Colors.white54)),
          //     //                                             SizedBox(width: 20,),
          //     //                                             Icon(Icons.add_location_alt, color: Colors.white54,size: 15,),
          //     //                                             Text("Andheri", style: TextStyle(color: Colors.white54)),
          //     //
          //     //
          //     //
          //     //
          //     //                                           ],
          //     //                                         ),
          //     //                                       )
          //     //
          //     //
          //     //                                     ],
          //     //                                   ),
          //     //                                 ))
          //     //                           ],
          //     //                         ),
          //     //                         color: Colors.black,
          //     //                       ),
          //     //
          //     //                     ),
          //     //
          //     //
          //     //                     Container(
          //     //                       height: 500,
          //     //                       padding: EdgeInsets.all(16),
          //     //                       child: PinterestGrid(),
          //     //                     )
          //     //                   ],
          //     //                 ),
          //     //               ),
          //     //             )
          //     //         );
          //     //       });
          //     //
          //     //     }
          //     // ),
          //     // //juhu_beach
          //     // Marker(
          //     //     markerId: MarkerId('2'),
          //     //     position: latlong.juhu_beach,
          //     //     onTap: (){
          //     //       showModalBottomSheet(context: context, builder: (BuildContext context) {
          //     //         return Container(
          //     //             child: Padding(
          //     //               padding: const EdgeInsets.all(8.0),
          //     //               child: UserCard(user:  MapUser("Jainam Patel", "https://plus.unsplash.com/premium_photo-1669782051589-4f828261b1c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80", "1", "4.7", "philliplacher445@gmail.com", "vile parle", "7", <MapImagePost>[], ["Landscape photographer", "Events"] )
          //     //                 ,),
          //     //             )
          //     //         );
          //     //       });
          //     //
          //     //     }
          //     // ),
          //     // //nashik
          //     // Marker(
          //     //     markerId: MarkerId('2'),
          //     //     position: latlong.nashik,
          //     //     onTap: (){
          //     //       showModalBottomSheet(context: context, builder: (BuildContext context) {
          //     //         return Container(
          //     //             child: Padding(
          //     //               padding: const EdgeInsets.all(8.0),
          //     //               child: UserCard(user:  MapUser("Abhishek Sinha", "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80", "1", "4.3", "philliplacher445@gmail.com", "vile parle", "7", <MapImagePost>[], ["Wedding", "Events"] )
          //     //                 ,),
          //     //             )
          //     //         );
          //     //       });
          //     //
          //     //     }
          //     // ),
          //     //
          //
          //   },
          //   onMapCreated: (GoogleMapController controller){
          //     _controller.complete(controller);
          //   },
          // ),
          // serach box
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child:
            Container(
              // color: Colors.black,

                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[500],

                ),
                child:  Align(
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _searchcontroller,
                    textAlignVertical: TextAlignVertical.center,
                    onSubmitted: (String value) async{
                      final latlongmap = await getLatLong(value);
                      GoogleMapController controller = await _controller.future;
                      controller.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(latlongmap['lat']!.toDouble(),latlongmap['lng']!.toDouble()),
                            zoom: 14,
                          )
                      ));
                      setState(() {

                      });
                    },




                    decoration: InputDecoration(
                      counterStyle: TextStyle(fontSize: 50),
                      labelStyle: TextStyle(fontSize: 20),
                      labelText: "Search Location",

                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.add_location, size: 30,),
                      suffix: IconButton(
                        icon: Icon(Icons.clear), onPressed: () {
                        _searchcontroller.clear();
                      },
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                )
            ),


          ),
        ],
      ),
    );
  }
}
