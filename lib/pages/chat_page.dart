import 'package:chat_aps/constants.dart';
import 'package:chat_aps/pages/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';

class chat_page extends StatelessWidget {
  ScrollController _controller = ScrollController();


  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  TextEditingController controller=TextEditingController();
  List<Message>messagesList=[];
  bool ? isreverse;




  chat_page({super.key});

  @override
  Widget build(BuildContext context) {

    var email=ModalRoute.of(context)!.settings.arguments;
    return  StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt,descending: true).snapshots(),
    builder:
    ( context,  snapshot) {
      //var data = String;
      if (snapshot.data != null) {
        for(int i=0;i<snapshot.data!.docs.length;i++ ){
          messagesList.add(Message.fromJson(snapshot.data!.docs[i]));}
      }


    if (snapshot.hasData) {

    return Scaffold(
        resizeToAvoidBottomInset: true, // assign true
        //  backgroundColor:kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(kLogo,
                height: 40,),
              Text('whatsapp'),

            ],
          ),
          centerTitle: true,

        ),
        body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    reverse :true,
                      shrinkWrap: true,
                    controller: _controller,


                     itemCount: messagesList.length,

                      itemBuilder: (BuildContext,index){
                        return messagesList[index].id==email? chat_buble(message: messagesList[index],):
                        chat_myfriend(message: messagesList[index])
                        ;

                      })),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller:controller,
                  onSubmitted:(data){


                    messages.add({
                      'message':data,
                      kCreatedAt:DateTime.now(),'id':email
                    });
                  //  messages.orderBy(kCreatedAt,descending: true);


                    controller.clear();
                    _controller.animateTo(
                     0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  } ,
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                      hintText: 'send message',
                      suffixIcon: Icon(Icons.send,color: kPrimaryColor,),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: kPrimaryColor
                          )
                      )),
                ),
              )



            ]));
    }
    if (snapshot.hasError) {
      return Text("Something went wrong");
    }
    else{
      return Text('loading');
    }

    },


    );}






     }

