import 'package:chat_aps/constants.dart';
import 'package:chat_aps/helper/show_snack_bar.dart';
import 'package:chat_aps/pages/chat_page.dart';
import 'package:chat_aps/pages/login_page.dart';
import 'package:chat_aps/widgets/custom_button.dart';
import 'package:chat_aps/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/images/Whatsapp.jpg',
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WhatsApp',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'pacifico',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  obscureText: true,

                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButon(
                  onTap: ()
                  async{
                    if(formKey.currentState!.validate()){
                      isLoading= true;
                      setState(() {

                      });
                      try{
                        var auth= FirebaseAuth.instance;
                        UserCredential user = await getuser(auth);
                        showSnakBar(context,'Sucess');
                        Get.to(chat_page(),arguments: email);
                        }on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnakBar(context,'The password provided is too weak.!');

                          //  print('The password provided is too weak.');
                        }
                        else if (e.code == 'email-already-in-use') {
                          showSnakBar(context,'The account already exists for that email.');
                        }
                        else {

                          showSnakBar(context,'Some thing go wrong please try again!');

                        }
                      }
                      setState(() {

                      });
                      isLoading=false;

                    }

                    },
                  text: 'REGISTER',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Login',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<UserCredential> getuser(FirebaseAuth auth) async {
    UserCredential user=  await auth.createUserWithEmailAndPassword(email: email!, password: password!);
    return user;
  }

  // Future<void> registerUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!);
  //
  // }
}
