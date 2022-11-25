// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_ui/models/destination_model.dart';
import 'package:travel_app_ui/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Top Destinations", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3
                    ),),
                    GestureDetector(
                      onTap:() {
                        print("see all");
                      },
                      child: Text("See All", style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0
                      ),),
                    ),
                  ],
                ),
              ),
              Container(height: 300, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (BuildContext context, int index){
                  Destination destination = destinations[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationScreen(destination: destination))),
                    child: Container(width: 210.0,
                    margin: const EdgeInsets.all(10.0),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [Positioned(
                        bottom: 15.0,
                        child: Container(height: 120.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${destination.activities.length} activities",
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.1,
                              ),),
                              Text(destination.description,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),),
                            ],
                          ),
                        ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                           const BoxShadow(
                            color: Colors.black26, 
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)]
                        ),
                      child: Stack(children: [
                        Hero(
                          tag: destination.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: AssetImage(destination.imageUrl),
                              fit: BoxFit.cover,
                              ),
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(destination.city,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                letterSpacing: 1.1,
                              ),),
                              Row(
                                children: [
                                  const Icon(FontAwesomeIcons.locationArrow,
                                  size: 10.0,
                                  color: Colors.white),
                                  Text(" ${destination.country}",
                                  style: const TextStyle(color: Colors.white),),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                      ),
                      ],
                    ),
                    ),
                  );
                }),
                ),
            ],
          );
  }
}