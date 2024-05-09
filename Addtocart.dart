import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:garments/Common/Common%20Textstyle.dart';
import 'package:garments/Paymentscreen.dart';
import 'package:garments/Snackbar.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/db_helper1/User1.dart';
import 'package:garments/db_helper1/userservicejob.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class Addtocartscreen extends StatefulWidget {
  const Addtocartscreen({super.key});

  @override
  State<Addtocartscreen> createState() => _AddtocartscreenState();
}

class _AddtocartscreenState extends State<Addtocartscreen> {


  List<Userjob>_userList = [];
  final _userjob = Userservicejob();


  Uint8List ?_decodedImage;
  String ?encodedImage;

  getAllUserDetails() async {
    var users = await _userjob.readaallusers();
    _userList = <Userjob>[];
    users.forEach((user) {
      setState(() {
        var userModel = Userjob();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.number = user['number'];
        userModel.email = user['email'];
        userModel.skills = user['skills'];
        _userList.add(userModel);
      });
    });
  }
  _deletedialog(BuildContext context,userId){
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        actions: [
          TextButton(onPressed: (){
            Get.back();}, child: Text("No",style:producttxt),
          ),
          TextButton(onPressed: ()async{
            var result=await _userjob.deleteUser(userId);
            if(result !=null){
              getAllUserDetails();
            }
            Get.back();
            StackDialog.show("Item Removed From Cart", "Item Removed", Icons.shopping_bag, Colors.black);

          },
            child: Text("Yes",style:producttxt ,),
          )
        ],
        title: Text("Are you sure you want to Remove this Product from Cart!",style: producttxt,),
      );
    });
  }


  String calculateTotalAmount() {
    double totalAmount = 0;
    for (int i = 0; i < _userList.length; i++) {
      totalAmount += double.parse("${_userList[i].email}"); // Assuming email contains the price

    }
    return totalAmount.toStringAsFixed(1).replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
  }
  int?pricevalue;
  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Add To Cart",style: producttxt,),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: displayheight(context)*0.80,
            width: double.infinity,
            child:_userList.isEmpty?const Center(child: CircularProgressIndicator(color: Colors.black,),): ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (BuildContext context,int index){
                  encodedImage="${_userList[index].skills}";
                  Uint8List bytes = base64Decode(encodedImage!.split(',').last);
                  _decodedImage = bytes;
              return Padding(
                padding: const EdgeInsets.only(top:4.0,left: 4.0,right: 4.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: displayheight(context)*0.16,
                      width: double.infinity,
                      child:  Card(
                        surfaceTintColor: Colors.transparent,
                        shadowColor: Colors.grey,
                        elevation: 1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)
                          )
                        ),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height:displayheight(context)*0.15,
                                width: displaywidth(context)*0.40,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.memory(_decodedImage!,fit: BoxFit.cover,)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0,top: 10.0,bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${_userList[index].name}", style: producttxt,),
                                  Text("${_userList[index].number}", style: producttxt,),
                                  Row(
                                    children: [
                                      const Icon(Icons.currency_rupee),
                                      Text("${_userList[index].email}", style: pricetxt,),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: InkWell(
                        onTap:(){
                          _deletedialog(context, _userList[index].id);
                        },
                        child: Container(
                          height:displayheight(context)*0.05,
                          width:double.infinity,
                          decoration:const  BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.delete,color: Colors.white,),
                              Text("Remove From Cart",style: producttxtwhite,)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
          Container(
            height: displayheight(context)*0.10,
            width: double.infinity,
            decoration:  const BoxDecoration(
              color: Colors.grey
            ),child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Total Amount : ",style:btntxt,),
                    Text("${calculateTotalAmount()}",style: btntxt,),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)
                    )
                  ),
                    onPressed: (){
                    String sendprice= "${calculateTotalAmount()}";
                     Get.to(Paymentscreen(price: sendprice,));
                    }, child: Text("Pay",style: btntxt,))

              ],

                        ),
            ),

          )
        ],
      ),
    );
  }
}
