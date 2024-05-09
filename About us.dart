import 'package:flutter/material.dart';
import 'package:garments/Common/Common%20Textstyle.dart';

class Aboutscreen extends StatefulWidget {
  const Aboutscreen({super.key});

  @override
  State<Aboutscreen> createState() => _AboutscreenState();
}

class _AboutscreenState extends State<Aboutscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios),color: Colors.black, ),
        title: Text("About Us",style:appbartxt ,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset("Assets/icon1.png"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome to Style Mix, \nwhere style meets comfort and quality. Established in 2024, we have been a leading name in the fashion industry, offering a diverse range of apparel that caters to the modern lifestyle.At Style Mix, we believe that clothing is not just about covering the body; it's an expression of one's personality and individuality. That's why we meticulously design each piece in our collection to embody contemporary trends while ensuring utmost comfort and durability.Our journey began with a vision to redefine fashion by blending innovative designs with premium fabrics. Over the years, we have stayed true to our commitment to excellence, continuously pushing the boundaries of creativity and craftsmanship.From casual wear to formal attire, our collections are curated to cater to every occasion and preference. Whether you're looking for timeless classics or the latest fashion-forward pieces, Style Mix has something for everyone.Behind every garment lies a team of skilled artisans and designers who pour their passion and expertise into every stitch. We take pride in our ethical and sustainable practices, ensuring that each product is made with care for both people and the planet.Customer satisfaction is at the heart of everything we do. We strive to provide an exceptional shopping experience, from browsing our collections online to receiving your order at your doorstep.Thank you for choosing Style Mix. Join us on this journey of style, comfort, and quality.",style: producttxt,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
