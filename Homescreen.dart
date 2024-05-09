import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:garments/About%20us.dart';
import 'package:garments/Addtocart.dart';
import 'package:garments/ContactUs.dart';
import 'package:garments/Explorescreen.dart';
import 'package:garments/Viewscreen.dart';
import 'package:garments/common/Common%20color.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:get/get.dart';
import 'common/common Size.dart';
import 'db_helper/Login service/Login split.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  int container=0;

  List<dynamic>data=[
    {
      "id":1,
      "title":"angora cardigan",
      "price":"120",
      "image":"Assets/img_3.png",
      "brand":"PRADA"
    },
    {
      "id":1,
      "title":"angora cardigan",
      "price":"120",
      "image":"Assets/img_5.png",
      "brand":"BURBERRY"
    },
    {
      "id":1,
      "title":"cardigan",
      "price":"120",
      "image":"Assets/img_6.png",
      "brand":"Cartier"
    },
    {
      "id":1,
      "title":"Oblong ",
      "price":"120",
      "image":"Assets/img_7.png",
      "brand":"GUCCI"
    }


  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer:  Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.brown.shade700.withOpacity(0.6),
                    Colors.brown.shade500.withOpacity(0.8)
                  ]
                ),
              ),
                accountName: const Text(""),
                accountEmail: const Text(""),
              currentAccountPicture:const CircleAvatar(backgroundImage: AssetImage("Assets/profile.png"),) ,
            ),

            InkWell(
              onTap: (){
                setState(() {
                  container=0;
                  container=container!;
                  Get.back();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: displayheight(context)*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: container==0?commongradient:commongradienttransparent
                  ),
                  child: ListTile(
                    title: Text("Home",style:appbartxt ,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(Explorescreen());
                setState(() {
                  container=1;
                  container=container!;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: displayheight(context)*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: container==1?commongradient:commongradienttransparent
                  ),
                  child: ListTile(
                    title: Text("Products",style:appbartxt ,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(Addtocartscreen());
                setState(() {
                  container=4;
                  container=container!;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: displayheight(context)*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: container==4?commongradient:commongradienttransparent
                  ),
                  child: ListTile(
                    title: Text("My Cart",style:container==3?appbartxt:appbartxt ,),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(const Aboutscreen());
                setState(() {
                  container=2;
                  container=container!;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: displayheight(context)*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: container==2?commongradient:commongradienttransparent
                  ),
                  child: ListTile(
                    title: Text("About Us",style:container==2?appbartxt:appbartxt ,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(Contactscreen());
                setState(() {
                  container=3;
                  container=container!;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: displayheight(context)*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: container==3?commongradient:commongradienttransparent
                  ),
                  child: ListTile(
                    title: Text("Contact Us",style:container==3?appbartxt:appbartxt ,),
                    trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                  ),
                ),
              ),
            ),
            SizedBox(height:displayheight(context)*0.20,),
            const Divider(color: Colors.black,),
            Center(
              child: InkWell(
                onTap: (){
                  logout();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Logout",style: producttxt,),
                    SizedBox(width: 5,),
                    Icon(Icons.logout,color: Colors.black,)
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black,)

          ],
        ),
      ),
      appBar: AppBar(
        elevation: 1,
       backgroundColor: Colors.grey,
        title: Text("Style Mix",style: producttxt,),
        actions: [
          IconButton(onPressed: (){
            Get.to(const Addtocartscreen());
          }, icon:const Icon(Icons.shopping_bag_outlined,color: Colors.black,) )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: displayheight(context)*0.50,
              width: double.infinity,
              child:
              CarouselSlider(
                  items: [
                    Stack(
                        clipBehavior: Clip.none,
                        children:[
                          Image.asset("Assets/img_4.png",fit: BoxFit.fill,height: displayheight(context)*0.50,width: double.infinity,),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("LUXURY\nFASHION\nCOLLECTIONS",style:slidertxt ,),
                                InkWell(
                                  onTap: (){
                                    Get.to(const Explorescreen());
                                  },
                                  child: Container(
                                    height: displayheight(context)*0.07,
                                    width: displaywidth(context)*0.60,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.black.withOpacity(0.25),
                                              Colors.black.withOpacity(0.5),
                                            ],
                                            stops: [0.0,1.0]
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Center(child: Text("Explore Collection",style: btntxt,)),
                                  ),
                                )

                              ],
                            ),
                          )
                        ]
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                        children:[
                          Image.asset("Assets/img.png",fit: BoxFit.fill,height: displayheight(context)*0.50,width: double.infinity,),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("LUXURY\nFASHION\nCOLLECTIONS",style:slidertxt ,),
                                InkWell(
                                  onTap: (){Get.to(const Explorescreen());},
                                  child: Container(
                                    height: displayheight(context)*0.07,
                                    width: displaywidth(context)*0.60,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.black.withOpacity(0.25),
                                              Colors.black.withOpacity(0.5),
                                            ],
                                            stops: [0.0,1.0]
                                        ),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Center(child: Text("Explore Collection",style: btntxt,)),
                                  ),
                                )

                              ],
                            ),
                          )
                        ]
                      ),
                    Stack(
                        clipBehavior: Clip.none,
                        children:[
                          Image.asset("Assets/img_1.png",fit: BoxFit.fill,height: displayheight(context)*0.50,width: double.infinity,),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("LUXURY\nFASHION\nCOLLECTIONS",style:slidertxt ,),
                                InkWell(
                                  onTap: (){Get.to(const Explorescreen());},
                                  child: Container(
                                    height: displayheight(context)*0.07,
                                    width: displaywidth(context)*0.60,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.black.withOpacity(0.25),
                                              Colors.black.withOpacity(0.5),
                                            ],
                                            stops: [0.0,1.0]
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Center(child: Text("Explore Collection",style: btntxt,)),
                                  ),
                                )

                              ],
                            ),
                          )
                        ]
                    ),
                    Stack(
                        clipBehavior: Clip.none,
                        children:[
                          Image.asset("Assets/img_2.png",fit: BoxFit.fill,height: displayheight(context)*0.50,width: double.infinity,),
                          Positioned(
                            bottom: 20,
                            left: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("LUXURY\nFASHION\nCOLLECTIONS",style:slidertxt ,),
                                InkWell(
                                  onTap: (){Get.to(const Explorescreen());},
                                  child: Container(
                                    height: displayheight(context)*0.07,
                                    width: displaywidth(context)*0.60,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.black.withOpacity(0.25),
                                              Colors.black.withOpacity(0.5),
                                            ],
                                            stops: [0.0,1.0]
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Center(child: Text("Explore Collection",style: btntxt,)),
                                  ),
                                )

                              ],
                            ),
                          )
                        ]
                    ),
                  ],
                  options: CarouselOptions(
                    height: displayheight(context)*0.50,
                    aspectRatio: 1/2,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )
              ) ,
            ),
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("NEW ARRIVALS",style: viewtxt,),
            )),
            const Divider(color: Colors.black,indent: 130,endIndent: 130,),
            SizedBox(
              height: displayheight(context)*0.84,
              width: double.infinity,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1/1.8
                  ), itemBuilder: (BuildContext context,int index){
                    return SizedBox(
                      height: displayheight(context)*0.35,
                      child: Column(
                        children: [
                         SizedBox(
                             height: displayheight(context)*0.25,
                             child: InkWell(
                                 onTap: (){
                                   Get.to(Viewscreen(
                                       image:data[index]['image'],
                                       title:data[index]['title'],
                                       price:data[index]['price'],
                                       brand:data[index]['brand']));
                                 },
                                 child: Image.asset(data[index]['image'],height: displayheight(context)*0.30,width: displaywidth(context)*0.40,))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data[index]['title'],style: producttxt,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Rs:",style: pricetxt,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(data[index]['price'],style: pricetxt,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
              }),
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Explorescreen()));
            }, child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Explore More",style:viewtxt ,),Icon(Icons.arrow_forward,color: Colors.black,)],)),
            Image.asset("Assets/img_8.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Collections",style: viewtxt,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset("Assets/img_9.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Image.asset("Assets/img_10.png"),
            ),
            Image.asset("Assets/img_11.png"),

          ],
        ),
      ),
    );
  }
  logout(){
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        actions: [
          TextButton(onPressed: (){
            Get.back();}, child: Text("No",style:producttxt),
          ),
          TextButton(onPressed: ()async{
            Get.to(const Loginsplit());
          },
            child: Text("Yes",style:producttxt ,),
          )
        ],
        title: Text("Are you sure you want to Exit the Page!",style: producttxt,),
      );
    });
  }
}
