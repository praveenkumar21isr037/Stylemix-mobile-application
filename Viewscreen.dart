import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:garments/Fullscreen.dart';
import 'package:garments/Paymentscreen.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Viewscreen extends StatefulWidget {
  String title,price,brand,image;
  // AssetImage image;
   Viewscreen({super.key,required this.price,required this.image,required this.title,required this.brand});

  @override
  State<Viewscreen> createState() => _ViewscreenState();
}

class _ViewscreenState extends State<Viewscreen> {
  String ?_selectedOption;
  int size=0;
  Uint8List ?_decodedImage;
  String ?encodedImage;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.grey.shade400,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Center(child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                border: Border.all(color: Colors.black)
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                      children: [
                        Image.asset(widget.image),
                        Positioned(
                          bottom: 10,
                          right: 5,
                          child: InkWell(
                            onTap: (){
                              // Get.to(Fullscreen(image:widget.image));
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white.withOpacity(0.5),
                                      Colors.white.withOpacity(0.5)
                                    ],
                                  )
                              ),
                              child: const Icon(Icons.fullscreen,color: Colors.black,),
                            ),
                          ),
                        )
                      ],
                     )),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.brand,style: viewtxt,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title,style: viewtxt,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Rs",style: pricetxt,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(widget.price,style: pricetxt,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Size",style: producttxt,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        size=0;
                        size=size!;

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: size==0?Colors.black:Colors.grey,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("S",style:size==0?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        size=1;
                        size=size!;

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: size==1?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("M",style:size==1?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        size=2;
                        size=size!;

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: size==2?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("L",style:size==2?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  )




                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:18.0,bottom: 5.0),
              child: InkWell(
                onTap: (){
                  Get.to( Paymentscreen(price: widget.price,));
                },
                child: Container(
                  height: displayheight(context)*0.08,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.fire_truck_outlined,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("PLACE AN ORDER",style:producttxtwhite ,),
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
