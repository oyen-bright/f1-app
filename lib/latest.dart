import 'dart:async';

import 'package:f1_app/extentions/theme_extention.dart';
import 'package:flutter/material.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class Latest extends StatelessWidget {
  const Latest({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollcontroller = ScrollController();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/pngwing.com (4).png",
              color: Colors.white,
              scale: 8,
            ),
          )),
      body: Scrollbar(
        controller: scrollcontroller,
        thumbVisibility: true,
        child: ListView(
          controller: scrollcontroller,
          children: [
            const Header(),
            30.height,
            const BigBannerNews(),
            30.height,
            const BigBannerNews(),
          ],
        ),
      ),
    );
  }
}

class BigBannerNews extends StatelessWidget {
  const BigBannerNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ClipRect(
              clipper: Customshape1(dx: 3, dy: -3),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Top Stories",
                      style: context.theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              )),
          10.height,
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(topRight: Radius.circular(10)),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/rb23.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          10.height,
          ClipRect(
              clipper: Customshape1(dx: 3, dy: 3),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Report",
                          style: context.theme.textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.normal, color: Colors.red),
                        )),
                    SizedBox(
                        width: double.infinity,
                        child: Text(
                          "FP3: Verstappn faster again to sweep every practice section before qualifying in jeddah",
                          style: context.theme.textTheme.bodyMedium!.copyWith(
                              fontStyle: FontStyle.normal, color: Colors.black),
                        )),
                    10.height
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      width: double.infinity,
      height: 240,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/bgimage.jpg"))),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "17-19 MAR",
              style: context.theme.textTheme.titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          10.height,
          const TrackInfo(),
          10.height,
          const TimeWidget()
        ],
      ),
    );
  }
}

class TrackInfo extends StatelessWidget {
  const TrackInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          ClipRect(
            clipper: Customshape1(),
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.6),
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  "assets/images/satrack.png",
                  color: Colors.white,
                ),
              ),
            ),
          ),
          15.width,
          Expanded(
            child: ClipRect(
              clipper: Customshape1(),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.6),
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text(
                      "Saudi Arabia".toUpperCase(),
                      style: context.theme.textTheme.titleLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    5.width,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "2023".toUpperCase(),
                        style: context.theme.textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const Spacer(),
                    const RotatedBox(
                        quarterTurns: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    super.key,
  });

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  DateTime _dateTime = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    _dateTime = DateTime.now();
    _timer = Timer(
      const Duration(seconds: 1) -
          Duration(milliseconds: _dateTime.millisecond),
      _updateTime,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hour = _dateTime.hour.toString().padLeft(2, '0');
    final minute = _dateTime.minute.toString().padLeft(2, '0');
    final second = _dateTime.second.toString().padLeft(2, '0');

    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 38, 120, 57),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Text(
                "qualifying".toUpperCase(),
                style: context.theme.textTheme.titleMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          hour,
                          style: context.theme.textTheme.displaySmall!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "HRS",
                          style: context.theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.white54),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(),
                    ),
                    Column(
                      children: [
                        Text(
                          minute,
                          style: context.theme.textTheme.displaySmall!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "MINS",
                          style: context.theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.white54),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                      child: VerticalDivider(),
                    ),
                    Column(
                      children: [
                        Text(
                          second,
                          style: context.theme.textTheme.displaySmall!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "SECS",
                          style: context.theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.white54),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/pngwing.com (5).png",
                  scale: 14,
                  color: Colors.white,
                ),
                10.height,
                SizedBox(
                  width: 100,
                  child: Text(
                    "Official Timepiece of Formular 1",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.labelSmall!
                        .copyWith(color: Colors.white, fontSize: 6),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Customshape1 extends CustomClipper<Rect> {
  final double? dx;
  final double? dy;
  Customshape1({this.dx, this.dy});
  @override
  Rect getClip(Size size) =>
      Offset(dx ?? 0.6, dy ?? -0.6) & Size(size.width, size.height);
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}
