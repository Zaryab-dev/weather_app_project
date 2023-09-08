import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_project/constants.dart';
import 'package:weather_app_project/constants.dart';

class HourlyBox extends StatelessWidget {
  final String degree, time;
  AssetImage assetImage;
  HourlyBox({super.key, required this.assetImage, required this.degree,required this.time});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 100,
          width: 100,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.topRight,
                        colors: [
                      Colors.greenAccent.withOpacity(0.5),
                      Colors.green.withOpacity(0.3),
                    ])
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Center(child: Text(time, style: TextStyle(color: textColor),)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image(image: AssetImage(assetImage.assetName.toString())),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(degree, style: TextStyle(color: textColor),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
