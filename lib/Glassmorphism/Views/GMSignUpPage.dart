import 'package:flutter/material.dart';
import 'package:mobile_auth_gen/Glassmorphism/Widgets/GlassMorphismContainer.dart';
import 'package:get/get.dart';
import 'package:mobile_auth_gen/Glassmorphism/Widgets/CustomButton.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'GMSignInPage.dart';
import 'package:firebase_database/firebase_database.dart';

class GMSignUpPage extends StatefulWidget {
  @override
  _GMSignUpPage createState() => _GMSignUpPage();
}

class _GMSignUpPage extends State<GMSignUpPage> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  var head = 'PIN is being generated';
  _getData() async {
    fetchDB().then((String result) {
      setState(() {
        head = result;
        print(head);
      });
    });
  }

  final ref = FirebaseDatabase.instance.reference().child('1011').child('key');

  Future<String> fetchDB() => Future.delayed(
        Duration(seconds: 2),
        () => ref.once().then((DataSnapshot dataSnapshot) {
          return dataSnapshot.value.toString();
        }),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple[400],
                Colors.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: Get.width * 0.075),
                      GestureDetector(
                        onTap: () => Get.to(() => GMSignInPage()),
                        child: GlassMorphismContainer(
                          height: 70.0,
                          width: 70.0,
                          borderRadius: 10.0,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      GlassMorphismContainer(
                        height: 70.0,
                        width: 70.0,
                        borderRadius: 10.0,
                        child: Column(
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: IconButton(
                                icon: new Image.asset("assets/icon2.png"),
                                onPressed: () {},
                              ),
                            ),
                            Text(
                              "998",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "TTNorm",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: Get.width * 0.075),
                    ],
                  ),
                  GlassMorphismContainer(
                    height: Get.height * 0.65,
                    width: Get.width * 0.8,
                    child: Column(
                      children: [
                        SizedBox(height: 100.0),
                        SlideCountdownClock(
                          duration: Duration(minutes: 3),
                          slideDirection: SlideDirection.Down,
                          separator: ":",
                          textStyle: TextStyle(
                            fontSize: 42,
                            color: Colors.white,
                            fontFamily: "TTNorm",
                          ),
                        ),
                        SizedBox(height: 100.0),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            '$head',
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: "TTNorm",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white.withAlpha(200),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "To replenish hash tokens contact admin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: "TTNorm"),
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
