import 'dart:async';

import 'package:flutter/material.dart';
import 'package:garments/Homescreen.dart';
import 'package:garments/common/common%20Textstyle.dart';

class Paymentsucessalert extends StatefulWidget {
  const Paymentsucessalert({super.key});

  @override
  State<Paymentsucessalert> createState() => _PaymentsucessalertState();
}

class _PaymentsucessalertState extends State<Paymentsucessalert> {


  Future<void>splashfun()async{
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen()));
    });
  }

  @override
  void initState() {
    splashfun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset("Assets/sucessgif.png",height:100,width: 100,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
                      child: Text("Your Payment Has Been Completed and Order Placed Successfully",textAlign: TextAlign.center,style: producttxtgreen,),
                    )
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
