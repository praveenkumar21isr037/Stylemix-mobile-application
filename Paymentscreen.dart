import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:garments/Commontextfield.dart';
import 'package:garments/common/common%20Size.dart';
import 'package:garments/common/common%20Textstyle.dart';
import 'package:garments/dbhelper2/User2.dart';
import 'package:garments/dbhelper2/userService2.dart';
import 'package:garments/payment%20sucess.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'Notification_controller.dart';

class Paymentscreen extends StatefulWidget {
  String ?price;
   Paymentscreen({super.key,required this.price});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {


  @override
  void initState(){
    AwesomeNotifications().setListeners(onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
        onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
        onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod);
    super.initState();
  }
  final TextEditingController controller1=TextEditingController();
  final TextEditingController controller2=TextEditingController();
  final TextEditingController controller3=TextEditingController();
  final TextEditingController controller4=TextEditingController();
  final TextEditingController controller5=TextEditingController();
  final TextEditingController controller6=TextEditingController();
  var userservice2 =UserService2();

  var currentdate=DateTime.now();

  Future<void> handlePaymentErrorResponse(PaymentFailureResponse response)  async {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response
            .message}\nMetadata:${response.error.toString()}");


  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response)async {
    AwesomeNotifications().createNotification(content: NotificationContent(
      id: 1,
      channelKey: "go_taxi",
      title: "Sucessfully Completed",
      body: "Your Order Has been Placed Sucessfully. ",

    ));
    Get.to(Paymentsucessalert());
    var user2=User2();
    user2.fullname=controller1.text;
    user2.jobtitle=controller2.text;
    user2.skills=controller3.text;
    user2.experience=controller4.text;
    user2.city=controller5.text;
    user2.number=controller6.text;
    user2.gender=currentdate.toString();
    user2.costdays=response.paymentId.toString();
    var result=await userservice2.SaveUser(user2);
    print(result);
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
           appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios),color: Colors.black, ),
          title: Text("Shipping Details",style:appbartxt ,),
),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Customer Name:",style: producttxt,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: commontext("Name",controller1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Customer Email:",style: producttxt,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: commontext("Email Id",controller2),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Customer Mobile Number:",style: producttxt,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: commontext("Mobile Number",controller3),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Building No:",style: producttxt,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: commontext("Building No",controller4),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Area/Street:",style: producttxt,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: commontext("Area/Street",controller5),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("State:",style: producttxt,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: commontext("State",controller6),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()async{
    Razorpay razorpay = Razorpay();
    var options = {
    'key': 'rzp_test_dyWXp68zMMlasw',
    'amount': '${widget.price! + "00"}',
    'name': 'Style Mix',
    'description': '',
    'retry': {'enabled': true, 'max_count': 1},
    'send_sms_hash': true,
    'prefill': {'contact': '', 'email': 'test@razorpay.com'},
    'external': {
    'wallets': ['paytm']
    }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
    },
                  child: Container(
                    height: displayheight(context)*0.08,
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(
                      child: Text("PAY",style: btntxt,),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
