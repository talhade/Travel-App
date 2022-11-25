
import 'package:flutter/material.dart';


import '../models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Exclusive Hotels", style: TextStyle(
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
                itemCount: hotels.length,
                itemBuilder: (BuildContext context, int index){
                  Hotel hotel = hotels[index];
                  return Container(width: 240.0,
                  margin: const EdgeInsets.all(10.0),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [Positioned(
                      bottom: 15.0,
                      child: Container(height: 120.0,
                      width: 240.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(hotel.name,
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                            ),),
                            const SizedBox(height: 2.0,),
                            Text(hotel.address,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),),
                            const SizedBox(height: 2.0,),
                            Text(
                              "\$${hotel.price} / night",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 180.0,
                        width: 220.0,
                        image: AssetImage(hotel.imageUrl),
                        fit: BoxFit.cover,
                        ),
                    ),
                    ),
                    ],
                  ),
                  );
                }),
                ),
            ],
          );
  }
}