import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mobile_auth_gen/Glassmorphism/Widgets/CustomButton.dart';
import 'package:mobile_auth_gen/Glassmorphism/Widgets/GlassMorphismContainer.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'GMSignUpPage.dart';
import 'dart:convert';

class GMSignInPage extends StatelessWidget {
  final ref = FirebaseDatabase.instance.reference();
  void writeData() {
    ref.child("1011").set({
      'key': hashGen(),
      'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch.toString()
    });
  }

  String hashGen() {
    var local = utf8.encode(
        ((DateTime.now().toUtc().millisecondsSinceEpoch) / 180000)
            .toStringAsFixed(0));
    var digest = sha256.convert(local);
    return digest.toString().substring(0, 6);
  }

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
                Colors.purple[900],
                Colors.red[400],
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
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.075),
                    child: GlassMorphismContainer(
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
                  ),
                  GlassMorphismContainer(
                    height: Get.height * 0.65,
                    width: Get.width * 0.8,
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          "Hi Raj, welcome back !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: "TTNorm",
                          ),
                        ),
                        SizedBox(height: 100.0),
                        GestureDetector(
                          onTap: () {
                            writeData();
                            Get.to(() => GMSignUpPage());
                          },
                          child: CustomButton(
                            buttonName: "Generate",
                            paddingH: 35.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text("Click on generate to get your 6- Digit PIN"),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
