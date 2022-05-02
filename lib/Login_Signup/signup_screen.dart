import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pid/Models/user_model.dart';

import '../index_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //authen
  final _auth = FirebaseAuth.instance;
  // form key
  final _formKey = GlobalKey<FormState>();
  //controller
  final FirstnameControler = new TextEditingController();
  final SecondnameControler = new TextEditingController();
  final EmailControler = new TextEditingController();
  final PasswordControler = new TextEditingController();
  final ConfirmPasswordControler = new TextEditingController();
  final PhonenumberControler = new TextEditingController();
  final AddressControler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //firstname field
    final FirstnameField = TextFormField(
      autofocus: false,
      controller: FirstnameControler,
      keyboardType: TextInputType.name,
      style: TextStyle(
        color: Colors.black87,
      ),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
      },
      onSaved: (value) {
        FirstnameControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.account_circle, color: Color(0xffd2691e)),
          hintText: 'First Name',
          hintStyle: TextStyle(color: Colors.black38)),
    );

    //secondname field
    final SecondnameField = TextFormField(
      autofocus: false,
      controller: SecondnameControler,
      keyboardType: TextInputType.name,
      style: TextStyle(
        color: Colors.black87,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        SecondnameControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.account_circle, color: Color(0xffd2691e)),
          hintText: 'Second Name',
          hintStyle: TextStyle(color: Colors.black38)),
    );

    //email field
    final EmailField = TextFormField(
      autofocus: false,
      controller: EmailControler,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black87,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your E-mail");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        EmailControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.email, color: Color(0xffd2691e)),
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.black38)),
    );

    //password field
    final PasswordField = TextFormField(
      autofocus: false,
      controller: PasswordControler,
      obscureText: true,
      style: TextStyle(
        color: Colors.black87,
      ),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        PasswordControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.vpn_key, color: Color(0xffd2691e)),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.black38)),
    );

    //confirmpassword field
    final ConfirmPasswordField = TextFormField(
      autofocus: false,
      controller: ConfirmPasswordControler,
      obscureText: true,
      style: TextStyle(
        color: Colors.black87,
      ),
      validator: (value) {
        if (ConfirmPasswordControler.text != PasswordControler.text) {
          return "Password don't match";
        }
        if (value!.isEmpty) {
          return ("Please enter your password");
        }
        return null;
      },
      onSaved: (value) {
        ConfirmPasswordControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.vpn_key, color: Color(0xffd2691e)),
          hintText: 'Confirm Password',
          hintStyle: TextStyle(color: Colors.black38)),
    );

    //phonenumber field
    final PhonenumberField = TextFormField(
      autofocus: false,
      controller: PhonenumberControler,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: Colors.black87,
      ),
      validator: (value) {
        RegExp regExp = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
        if (value!.isEmpty) {
          return ("Please enter your Phone Number");
        }
        if (value.length < 10) {
          return ("Please Enter a valid Number");
        }
        if (value.length > 10) {
          return ("Please Enter a valid Number");
        }
        if (!regExp.hasMatch(value)) {
          return ("Please Enter a valid Number");
        }
        return null;
      },
      onSaved: (value) {
        PhonenumberControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.phone_android, color: Color(0xffd2691e)),
          hintText: 'Phone Number',
          hintStyle: TextStyle(color: Colors.black38)),
    );

    //address field
    final AddressField = TextFormField(
      autofocus: false,
      controller: AddressControler,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      style: TextStyle(
        color: Colors.black87,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Address");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid Address");
        }
        return null;
      },
      onSaved: (value) {
        AddressControler.text = value!;
      },
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.location_on, color: Color(0xffd2691e)),
          hintText: 'Address',
          hintStyle: TextStyle(color: Colors.black38)),
    );

    //login button
    final signupButton = ElevatedButton(
      child: Text(
        'SIGN UP',
        style: TextStyle(
            color: Color(0xffd2691e),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        primary: Colors.white,
      ),
      onPressed: () {
        signUp(EmailControler.text, PasswordControler.text);
      },
    );

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x66d2691e),
                      Color(0x99d2691e),
                      Color(0xccd2691e),
                      Color(0xffd2691e),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Container(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200,
                            ),
                            FirstnameField,
                            SizedBox(height: 30),
                            SecondnameField,
                            SizedBox(height: 30),
                            EmailField,
                            SizedBox(height: 30),
                            PasswordField,
                            SizedBox(height: 30),
                            ConfirmPasswordField,
                            SizedBox(height: 30),
                            PhonenumberField,
                            SizedBox(height: 30),
                            AddressField,
                            SizedBox(height: 40),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                width: double.infinity,
                                child: signupButton),
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = FirstnameControler.text;
    userModel.secondName = SecondnameControler.text;
    userModel.number = PhonenumberControler.text;
    userModel.address = AddressControler.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => IndexPages()),
        (route) => false);
  }
}
