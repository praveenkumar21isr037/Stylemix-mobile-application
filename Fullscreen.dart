import 'package:flutter/material.dart';

class Fullscreen extends StatefulWidget {
  String image;
   Fullscreen({super.key,required this.image});

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
      ),
      body: Center(child: Image.asset(widget.image,fit: BoxFit.fill,width: double.infinity,)),
    );
  }
}
