
import 'package:chat_aps/constants.dart';
import 'package:chat_aps/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chat_buble extends StatelessWidget {


  Message message;

  chat_buble({super.key,required this.message});
  @override
  Widget build(BuildContext context) {
    return  Align(
              alignment: Alignment.centerLeft,
                child: Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                padding: EdgeInsets.only(top: 32,bottom: 32,left: 16,right: 5),
                child: Text(
                  message.message,style: TextStyle(color: Colors.black),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(22),
                    bottomRight: Radius.circular(23),
                  ),
                  color: kPrimaryColor,
                )),


    );}

  }
class chat_myfriend extends StatelessWidget {


  Message message;

  chat_myfriend({super.key,required this.message});
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 16),
          padding: EdgeInsets.only(top: 32,bottom: 32,left: 16,right: 5),
          child: Text(
            message.message,style: TextStyle(color: Colors.black),),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(22),
              bottomLeft: Radius.circular(23),
            ),
            color: Color(0xfff6f2f2)
          )),


    );}




}

