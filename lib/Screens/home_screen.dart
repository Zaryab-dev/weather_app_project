import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weather_app_project/Controller/home_controller.dart';
import 'package:weather_app_project/Screens/detail_screen.dart';
import 'package:weather_app_project/Screens/info_screen.dart';
import 'package:weather_app_project/Screens/res/home_container.dart';
import 'package:weather_app_project/Weather/detailed_hourly_model.dart';
import 'package:weather_app_project/Weather/hourly_model.dart';
import 'package:weather_app_project/Weather/islamabad_weather.dart';
import 'package:weather_app_project/Weather/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeXController homeXController = Get.put(HomeXController());
  IslamabadWeather islamabadWeather = IslamabadWeather();
  NewYorkWeather newYorkWeather = NewYorkWeather();
  IslamabadUpdate isb = IslamabadUpdate();
  LondonHourly lh = LondonHourly();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images.jpeg'),fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.search),
                    contentPadding: EdgeInsets.fromLTRB(20,0,0,0),
                    hintText: 'Search City',
                    hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    fillColor: CupertinoColors.systemGrey4
                ),
                onChanged: (value) {
                  setState(() {

                  });
                },
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                    child: Container(
                      // height: 40,
                      width: double.infinity,
                      // child: TextFormField(
                      //   controller: controller,
                      //   decoration: InputDecoration(
                      //     suffixIcon: Icon(CupertinoIcons.search),
                      //     contentPadding: EdgeInsets.all(10),
                      //     hintText: 'Search City',
                      //     hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(50),
                      //     ),
                      //     filled: true,
                      //     fillColor: CupertinoColors.systemGrey4
                      //   ),
                      //   onChanged: (value) {
                      //     setState(() {
                      //
                      //     });
                      //   },
                      // ),
                    ),
                  ),
                  FutureBuilder<Hourly>(
                    future: isb.getHourly(controller.text.toString()),
                    builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(
                                temp: snapshot.data!.temp!.toDouble(),
                                title: snapshot.data!.name.toString(), description: snapshot.data!.update.toString(),
                                feelLike: snapshot.data!.feel!.toDouble(), humidity: snapshot.data!.humidity.toString(),
                                wind: snapshot.data!.wind.toString(), controller: controller.text.toString(), assetImage: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),
                            )));
                          },
                          child: HomeContainer(
                              title: snapshot.data!.name.toString(), update: snapshot.data!.update.toString(), temp: snapshot.data!.temp!.toStringAsFixed(0),
                              photoUrl: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'), feel: ' feel like ${snapshot.data!.feel.toString()}'),
                        ),
                      ],
                    );
                  }else{
                    return Container();
                  }
                    },
                  ),
                  FutureBuilder(
                      future: isb.getHourly('islamabad'),
                      builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return InkWell(
                        highlightColor: Colors.black,
                        splashColor: Colors.red,
                        focusColor: Colors.blue,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(
                            temp: snapshot.data!.temp!.toDouble(),
                            title: snapshot.data!.name.toString(), description: snapshot.data!.update.toString(),
                            feelLike: snapshot.data!.feel!.toDouble(), humidity: snapshot.data!.humidity.toString(),
                            wind: snapshot.data!.wind.toString(), controller: 'islamabad', assetImage: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),
                          )));
                        },
                        child: Column(
                          children: [
                            HomeContainer(title: snapshot.data!.name.toString(), update: snapshot.data!.update.toString(), temp: snapshot.data!.temp!.toStringAsFixed(0),
                                photoUrl: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),  feel: ' feel like ${snapshot.data!.feel.toString()}',),
                          ],
                        ),
                      );
                    }else{
                      return  Container();
                    }
                  }),
                  FutureBuilder(
                      future: isb.getHourly('london'),
                      builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(
                            temp: snapshot.data!.temp!.toDouble(),
                            title: snapshot.data!.name.toString(), description: snapshot.data!.update.toString(),
                            feelLike: snapshot.data!.feel!.toDouble(), humidity: snapshot.data!.humidity.toString(),
                            wind: snapshot.data!.wind.toString(), controller: 'london', assetImage: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),
                          )));
                        },
                        child: Column(
                          children: [
                            HomeContainer(title: snapshot.data!.name.toString(), update: snapshot.data!.update.toString(), temp: snapshot.data!.temp!.toStringAsFixed(0),
                                photoUrl: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),  feel: ' feel like ${snapshot.data!.feel.toString()}',),
                          ],
                        ),
                      );
                    }else{
                      return Container();
                    }
                  }),
                  FutureBuilder(
                      future: isb.getHourly('new york'),
                      builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(
                            temp: snapshot.data!.temp!.toDouble(),
                            title: snapshot.data!.name.toString(), description: snapshot.data!.update.toString(),
                            feelLike: snapshot.data!.feel!.toDouble(), humidity: snapshot.data!.humidity.toString(),
                            wind: snapshot.data!.wind.toString(), controller: 'new york', assetImage: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),
                          )));
                        },
                        child: Column(
                          children: [
                            HomeContainer(title: snapshot.data!.name.toString(), update: snapshot.data!.update.toString(), temp: snapshot.data!.temp!.toStringAsFixed(0),
                                photoUrl: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),  feel: ' feel like ${snapshot.data!.feel.toString()}',),
                          ],
                        ),
                      );
                    }else{
                      return  const SizedBox(
                        height: 100,
                        width: 100,
                        child: SpinKitFadingCircle(
                          size: 100, color: Colors.white,
                        ),
                      );
                    }
                  }),
                  FutureBuilder(
                      future: isb.getHourly('washington'),
                      builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(
                            temp: snapshot.data!.temp!.toDouble(),
                            title: snapshot.data!.name.toString(), description: snapshot.data!.update.toString(),
                            feelLike: snapshot.data!.feel!.toDouble(), humidity: snapshot.data!.humidity.toString(),
                            wind: snapshot.data!.wind.toString(), controller: 'washington', assetImage: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),
                          )));
                        },
                        child: Column(
                          children: [
                            HomeContainer(title: snapshot.data!.name.toString(), update: snapshot.data!.update.toString(), temp: snapshot.data!.temp!.toStringAsFixed(0),
                                photoUrl: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),  feel: ' feel like ${snapshot.data!.feel.toString()}',),
                          ],
                        ),
                      );
                    }else{
                      return  Container();
                    }
                  }),
                  FutureBuilder(
                      future: isb.getHourly('toronto'),
                      builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen(
                            temp: snapshot.data!.temp!.toDouble(),
                            title: snapshot.data!.name.toString(), description: snapshot.data!.update.toString(),
                            feelLike: snapshot.data!.feel!.toDouble(), humidity: snapshot.data!.humidity.toString(),
                            wind: snapshot.data!.wind.toString(), controller: 'toronto', assetImage: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),
                          )));
                        },
                        child: Column(
                          children: [
                            HomeContainer(title: snapshot.data!.name.toString(), update: snapshot.data!.update.toString(), temp: snapshot.data!.temp!.toStringAsFixed(0),
                                photoUrl: snapshot.data!.update.toString() == 'Rain' || snapshot.data!.update.toString() == 'Clouds'  ? const AssetImage('assets/cloudy.png') : const AssetImage('assets/sun.png'),  feel: ' feel like ${snapshot.data!.feel.toString()}',),
                          ],
                        ),
                      );
                    }else{
                      return  Container();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
