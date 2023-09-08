import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_project/constants.dart';

class HomeContainer extends StatelessWidget {
  String title, update, temp, feel;
  AssetImage photoUrl;
  // VoidCallback onPress;
   HomeContainer({super.key, required this.feel,required this.title, required this.update, required this.temp, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 145,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.1)
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(color: textColor,fontSize: 18, fontWeight: FontWeight.bold),),
                        Text(update, style: const TextStyle(color: textColor,fontSize: 18, fontWeight: FontWeight.w600),),
                        Text('$temp°C', style: const TextStyle(color: textColor,fontSize: 26, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      backgroundImage: photoUrl,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// ListTile(
// title: Text(title, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),),
// subtitle: Text(update, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),),
// trailing: Padding(
// padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
// child: Image(image: AssetImage(photoUrl),fit: BoxFit.fill,),
// ),
// ),