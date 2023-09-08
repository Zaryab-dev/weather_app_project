import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_project/Screens/res/hourly_box.dart';
import 'package:weather_app_project/Weather/islamabad_weather.dart';
import 'package:weather_app_project/constants.dart';

class InfoScreen extends StatelessWidget {
  String title,description,wind,humidity;
  double temp,feelLike;
  String controller;
  AssetImage assetImage;
  InfoScreen({super.key, required this.assetImage, required this.controller, required this.temp, required this.title, required this.description, required this.feelLike, required this.humidity , required this.wind});

  HourlyF hf = HourlyF();
  ForecastIslamabad isbF = ForecastIslamabad();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert, color: Colors.white,),
                      ),
                    ],
                  ),
                   Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40,letterSpacing: 1),),
                   Text(DateFormat.yMMMEd().format(DateTime.now()), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15,letterSpacing: 1),),
                   SizedBox(height: 20,),
                  Container(
                    height: 200,
                    width: 360,
                    child: Image(image: AssetImage(assetImage.assetName.toString())),
                  ),
                  const SizedBox(height: 20,),
                   Text('${temp.toStringAsFixed(0)}°C', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35,letterSpacing: 0),),
                   Text(description, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25,letterSpacing: 0),),
                  const SizedBox(height: 15,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 100,
                      child: Stack(
                        children: [
                          BackdropFilter(filter: ImageFilter.blur(
                            sigmaY: 2,
                            sigmaX: 2,
                          ),child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.greenAccent.withOpacity(0.4),
                                  Colors.green.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 20, right: 10, bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('WIND',style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
                                    Text('$wind m/s', style: TextStyle(color: textColor),),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 2,
                                endIndent: 15,
                                indent: 15,
                                color: Colors.white,
                              ),
                               Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 20, right: 10, bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('FEEL LIKE',style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
                                    Text('${feelLike.toStringAsFixed(0)}°C', style: TextStyle(color: textColor),),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 2,
                                endIndent: 15,
                                indent: 15,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, right: 30, bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('HUMIDITY',style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
                                    Text('$humidity%', style: TextStyle(color: textColor),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    ),
                    child: FutureBuilder(
                        future: isbF.getHourlyForecast(controller.toString()),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return HourlyBox(degree: '${snapshot.data![index].temperature.toStringAsFixed(0)}°C',
                                      time: getTimeFromTimestamp(snapshot.data![index].time), assetImage: assetImage,);
                                });
                          }else{
                            return const Center(child: SpinKitChasingDots(
                              color: Colors.green,
                            ));
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
