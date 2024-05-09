import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:garments/Paymentscreen.dart';
import 'package:garments/Snackbar.dart';
import 'package:garments/Viewscreen.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:garments/db_helper/User.dart';
import 'package:garments/db_helper/userService.dart';
import 'package:garments/db_helper1/User1.dart';
import 'package:get/get.dart';

import 'db_helper1/userservicejob.dart';
class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen>with TickerProviderStateMixin {

  int ?container=0;

  List<dynamic>data=[
    {
      "id":1,
      "title":"21WN reversible angora cardigan",
      "brand":"Nike",
      "price":"120",
      "image":"Assets/img_3.png"
    },
    {
      "id":2,
      "title":"21WN reversible angora cardigan",
      "price":"120",
      "brand":"Nike",
      "image":"Assets/img_5.png"
    },
    {
      "id":3,
      "title":"21WN reversible angora cardigan",
      "price":"120",
      "brand":"Nike",
      "image":"Assets/img_6.png"
    },
    {
      "id":4,
      "title":"Oblong bag",
      "price":"120",
      "brand":"Nike",
      "image":"Assets/img_7.png"
    },
  ];

  List<dynamic> mensdata=[
    {
      "shirt":"Assets/shirt1.jpeg",
      "price":"1000",
      "brand":"Nike",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/shirt2.jpeg",
      "price":"2000",
      "brand":"Adidas",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/shirt3.jpeg",
      "price":"1500",
      "brand":"Mulberry",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/shirt4.jpeg",
      "price":"1800",
      "brand":"Adidas",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/shirt5.jpeg",
      "price":"1200",
      "brand":"US POLO",
      "title":"Men Shirt"
    }
  ];

  List<dynamic>childdata=[
    {
      "shirt":"Assets/child2.jpeg",
      "price":"1000",
      "brand":"Nike",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/child3.jpeg",
      "price":"2000",
      "brand":"Adidas",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/child5.jpeg",
      "price":"1000",
      "brand":"Nike",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/child6.jpeg",
      "price":"2000",
      "brand":"Adidas",
      "title":"Men Shirt"
    },
    {
      "shirt":"Assets/child7.jpeg",
      "price":"1000",
      "brand":"Nike",
      "title":"Mens Shirt"
    },

  ];

  List<User>_userList = [];
  final _userService = UserService();


  TabController ?tabController;
  Uint8List ?_decodedImage;
  String ?encodedImage;
  Uint8List ?_decodedImage1;
  String ?encodedImage1;

  Uint8List ?_decodedImage2;
  String ?encodedImage2;

  var userjob=Userservicejob();

  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _userList = <User>[];
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.fullname = user['fullname'];
        userModel.jobtitle = user['jobtitle'];
        userModel.skills = user['skills'];
        userModel.experience = user['experience'];
        userModel.city=user['city'];
        _userList.add(userModel);
      });
    });
  }



  @override
  void initState() {
     tabController=TabController(length: 4, vsync: this);
    getAllUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
            controller: tabController,
            tabs:  [
          Text("All",style: producttxt,),
          Text("Child",style: producttxt,),
          Text("Male",style: producttxt,),
          Text("Female",style: producttxt,),
        ]),
        leading: IconButton(onPressed: (){Get.back();},icon:const Icon(Icons.arrow_back_ios,color: Colors.black,) ,),
      ),
      body:
      TabBarView(
        controller: tabController,
        children: [

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: displayheight(context)*0.89,
                  width: double.infinity,
                  child: _userList.isEmpty?const Center(child: CircularProgressIndicator()):GridView.builder(
                      itemCount: _userList.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1/1.8
                      ), itemBuilder: (BuildContext context,int index){
                    encodedImage="${_userList[index].experience}";
                    Uint8List bytes = base64Decode(encodedImage!.split(',').last);
                    _decodedImage = bytes;
                    return SizedBox(
                      height: displayheight(context)*0.30,
                      child: Column(
                        children: [
                          SizedBox(
                              height: displayheight(context)*0.25,
                              child: InkWell(
                                  onTap: (){
                                    bottomshow(
                                        image:"${_userList[index].experience}",
                                        title:"${_userList[index].fullname}",
                                        price:"${_userList[index].skills}",
                                        brand:"${_userList[index].jobtitle}"
                                    );
                                  },
                                  child: _decodedImage==null?const FittedBox(
                                      fit: BoxFit.cover,
                                      child: Icon(Icons.image)):Image.memory(_decodedImage!,fit: BoxFit.cover,height: displayheight(context)*0.30,width: displaywidth(context)*0.40,))),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${_userList[index].fullname}",style: producttxt,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Rs",style: pricetxt,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text("${_userList[index].skills}",style: pricetxt,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: displayheight(context)*0.89,
                  width: double.infinity,
                  child:  _userList.where((user) =>user.city=="child").isEmpty? const Center(child: CircularProgressIndicator()):GridView.builder(
                      itemCount: _userList.where((user) => user.city=="child").length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1/1.8
                      ), itemBuilder: (BuildContext context,int index){
                    final user = _userList.where((user) => user.city == "child").toList()[index];
                    encodedImage="${user.experience}";
                    Uint8List bytes = base64Decode(encodedImage!.split(',').last);
                    _decodedImage = bytes;
                    return SizedBox(
                      height: displayheight(context)*0.30,
                      child: Column(
                        children: [
                          SizedBox(
                              height: displayheight(context)*0.25,
                              child: InkWell(
                                  onTap: (){
                                    // Get.to(
                                    bottomshow(
                                        image:"${user.experience}",
                                        title:"${user.fullname}",
                                        price:"${user.skills}",
                                        brand:"${user.jobtitle}"
                                    );
                                    // );
                                  },
                                  child: _decodedImage==null?const FittedBox(
                                      fit: BoxFit.cover,
                                      child: Icon(Icons.image)):Image.memory(_decodedImage!,fit: BoxFit.cover,height: displayheight(context)*0.30,width: displaywidth(context)*0.40,))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${user.fullname}",style: producttxt,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Rs",style: pricetxt,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text("${user.skills}",style: pricetxt,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: displayheight(context)*0.89,
                //   width: double.infinity,
                //   child:mensdata.isEmpty? const Center(child: CircularProgressIndicator()):GridView.builder(
                //       itemCount:mensdata.length,
                //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //           maxCrossAxisExtent: 200,
                //           crossAxisSpacing: 10,
                //           mainAxisSpacing: 10,
                //           childAspectRatio: 1/1.8
                //       ), itemBuilder: (BuildContext context,int index){
                //     // final user = _userList.where((user) => user.city == "male").toList()[index];
                //     // encodedImage="${user.experience}";
                //     // Uint8List bytes = base64Decode(encodedImage!.split(',').last);
                //     // _decodedImage = bytes;
                //     return SizedBox(
                //       height: displayheight(context)*0.30,
                //       child: Column(
                //         children: [
                //           SizedBox(
                //               height: displayheight(context)*0.25,
                //               child: InkWell(
                //                   onTap: (){
                //                     // Get.to(
                //                     bottomshow(
                //                         image:"${mensdata[index]['shirt']}",
                //                         title:"${mensdata[index]['title']}",
                //                         price:"${mensdata[index]['price']}",
                //                         brand:"${mensdata[index]['brand']}"
                //                     );
                //                     // );
                //                   },
                //                   child: _decodedImage==null?const FittedBox(
                //                       fit: BoxFit.cover,
                //                       child: Icon(Icons.image)):Image.asset("${mensdata[index]['shirt']}",fit: BoxFit.cover,height: displayheight(context)*0.30,width: displaywidth(context)*0.40,))),
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Text("${mensdata[index]['brand']}",style: producttxt,),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Text("Rs",style: pricetxt,),
                //                 Padding(
                //                   padding: const EdgeInsets.only(left:8.0),
                //                   child: Text("${mensdata[index]['price']}",style: pricetxt,),
                //                 ),
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     );
                //   }),
                // ),
                SizedBox(
                  height: displayheight(context)*0.89,
                  width: double.infinity,
                  child:  _userList.where((user) =>user.city=="male").isEmpty? const Center(child: CircularProgressIndicator()):GridView.builder(
                      itemCount: _userList.where((user) => user.city=="male").length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1/1.8
                      ), itemBuilder: (BuildContext context,int index){
                    final user = _userList.where((user) => user.city == "male").toList()[index];
                    encodedImage="${user.experience}";
                    Uint8List bytes = base64Decode(encodedImage!.split(',').last);
                    _decodedImage = bytes;
                    return SizedBox(
                      height: displayheight(context)*0.30,
                      child: Column(
                        children: [
                          SizedBox(
                              height: displayheight(context)*0.25,
                              child: InkWell(
                                  onTap: (){
                                    // Get.to(
                                    bottomshow(
                                        image:"${user.experience}",
                                        title:"${user.fullname}",
                                        price:"${user.skills}",
                                        brand:"${user.jobtitle}"
                                    );
                                    // );
                                  },
                                  child: _decodedImage==null?const FittedBox(
                                      fit: BoxFit.cover,
                                      child: Icon(Icons.image)):Image.memory(_decodedImage!,fit: BoxFit.cover,height: displayheight(context)*0.30,width: displaywidth(context)*0.40,))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${user.fullname}",style: producttxt,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Rs",style: pricetxt,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text("${user.skills}",style: pricetxt,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: displayheight(context)*0.89,
                  width: double.infinity,
                  child:  _userList.where((user) =>user.city=="female").isEmpty? const Center(child: CircularProgressIndicator()):GridView.builder(
                      itemCount: _userList.where((user) => user.city=="female").length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1/1.8
                      ), itemBuilder: (BuildContext context,int index){
                    final user = _userList.where((user) => user.city == "female").toList()[index];
                    encodedImage="${user.experience}";
                    Uint8List bytes = base64Decode(encodedImage!.split(',').last);
                    _decodedImage = bytes;
                    return SizedBox(
                      height: displayheight(context)*0.30,
                      child: Column(
                        children: [
                          SizedBox(
                              height: displayheight(context)*0.25,
                              child: InkWell(
                                  onTap: (){
                                    // Get.to(
                                    bottomshow(
                                        image:"${user.experience}",
                                        title:"${user.fullname}",
                                        price:"${user.skills}",
                                        brand:"${user.jobtitle}"
                                    );
                                    // );
                                  },
                                  child: _decodedImage==null?const FittedBox(
                                      fit: BoxFit.cover,
                                      child: Icon(Icons.image)):Image.memory(_decodedImage!,fit: BoxFit.cover,height: displayheight(context)*0.30,width: displaywidth(context)*0.40,))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${user.fullname}",style: producttxt,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Rs",style: pricetxt,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text("${user.skills}",style: pricetxt,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],)
      ,
    );
  }

  Future bottomshow({required image, required title, required price, required brand}){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      encodedImage1="$image";
      Uint8List bytes = base64Decode(encodedImage1!.split(',').last);
      _decodedImage1 = bytes;
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Center(child: Container(
              height: displayheight(context)*0.50,
              width: displaywidth(context)*0.90,
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
                      Image.memory(_decodedImage1!,fit: BoxFit.cover,width: double.infinity,),
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
              child: Text(brand,style: viewtxt,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,style: viewtxt,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Rs",style: pricetxt,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(price,style: pricetxt,),
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
                        container=0;
                        container=container!;
                        print(container);

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: container==0?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("S",style:container==0?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        container=1;
                        container=container!;

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: container==1?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("M",style:container==1?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        container=2;
                        container=container!;

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: container==2?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("L",style:container==2?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:18.0,bottom: 5.0),
              child: InkWell(
                onTap: ()async{
                  StackDialog.show("Items Added to Cart", "Sucessfully Added", Icons.shopping_bag, Colors.black);
                  // String encodedImage3 = base64Encode(image);
                  var user1=Userjob();
                  user1.name=title;
                  user1.number=brand;
                  user1.email=price;
                  user1.skills=encodedImage1.toString();
                  var result=await userjob.SaveUser(user1);
                  print(result);
                  print(encodedImage1);
                  // Get.to(const Paymentscreen());
                },
                child: Container(
                  height: displayheight(context)*0.08,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_bag,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("ADD TO CART",style:producttxtwhite ,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:18.0,bottom: 5.0),
              child: InkWell(
                onTap: (){
                  Get.to( Paymentscreen(price: price,));
                },
                child: Container(
                  height: displayheight(context)*0.08,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.fire_truck,color: Colors.white,),
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
      );
    });
  }

  Future bottomshow1({required image, required title, required price, required brand}){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      // encodedImage1="$image";
      // Uint8List bytes = base64Decode(encodedImage1!.split(',').last);
      // _decodedImage1 = bytes;
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Center(child: Container(
              height: displayheight(context)*0.50,
              width: displaywidth(context)*0.90,
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
                      Image.asset("$image",fit: BoxFit.cover,width: double.infinity,),
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
              child: Text(brand,style: viewtxt,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,style: viewtxt,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Rs",style: pricetxt,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(price,style: pricetxt,),
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
                        container=0;
                        container=container!;
                        print(container);

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: container==0?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("S",style:container==0?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        container=1;
                        container=container!;

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: container==1?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("M",style:container==1?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        container=2;
                        container=container!;

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: container==2?Colors.black:Colors.grey,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text("L",style:container==2?producttxtwhite:producttxt ,),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:18.0,bottom: 5.0),
              child: InkWell(
                onTap: ()async{
                  StackDialog.show("Items Added to Cart", "Sucessfully Added", Icons.shopping_bag, Colors.black);
                  // String encodedImage3 = base64Encode(image);
                  var user1=Userjob();
                  mensdata[0]['title']=title;
                  mensdata[0]['brand']=brand;
                  mensdata[0]['price']=price;
                  mensdata[0]['shirt']=encodedImage1.toString();
                  var result=await userjob.SaveUser(user1);
                  print(result);
                  print(encodedImage1);
                  // Get.to(const Paymentscreen());
                },
                child: Container(
                  height: displayheight(context)*0.08,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_bag,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("ADD TO CART",style:producttxtwhite ,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:18.0,bottom: 5.0),
              child: InkWell(
                onTap: (){
                  Get.to( Paymentscreen(price: price,));
                },
                child: Container(
                  height: displayheight(context)*0.08,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.fire_truck,color: Colors.white,),
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
      );
    });
  }
}




