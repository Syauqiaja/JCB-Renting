import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jcb_renting/ui/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _hasLowercase(String text){
    if(text.isEmpty) return false;
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if (charCode >= 97 && charCode <= 122) {
        return true;
      }
    }
    return false;
  }
  bool _hasUppercase(String text){
    if(text.isEmpty) return false;
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if (charCode >= 65 && charCode <= 90) {
        return true;
      }
    }
    return false;
  }
  bool _hasNumber(String text){
    if(text.isEmpty) return false;
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if (charCode >= 48 && charCode <= 57) {
        return true;
      }
    }
    return false;
  }
  bool _hasSymbol(String text){
    if(text.isEmpty) return false;
    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      if ((charCode >= 33 && charCode <= 47) ||
        (charCode >= 58 && charCode <= 64) ||
        (charCode >= 91 && charCode <= 96) ||
        (charCode >= 123 && charCode <= 126)){
        return true;
      }
    }
    return false;
  }

  String _password = "";
  String _username = "";
  String _confPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.yellow),
                  margin: const EdgeInsets.only(top: 16, bottom: 48),
                  height: 64.0,
                  child: Image.asset(
                    "images/rent_logo.png",
                    color: Colors.black87,
                
                  ),
                ),
                const Text(
                  "Create account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  ),
                ),
                const Text(
                  "Make sure your password is 8 or more characters and has atleast 3 of the following :",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16
                  ),
                  textAlign: TextAlign.center,
                ),
        
                const SizedBox(height: 32,),
                RequirementBulletPoint(text: "An uppercase letter",stringTested: _password ,onChanged: _hasUppercase),
                RequirementBulletPoint(text: "A lowercase letter",stringTested: _password ,onChanged: _hasLowercase),
                RequirementBulletPoint(text: "A number",stringTested: _password ,onChanged: _hasNumber),
                RequirementBulletPoint(text: "A symbol",stringTested: _password ,onChanged: _hasSymbol),
                const SizedBox(height: 32),
                
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Username",
                          contentPadding: EdgeInsets.only(bottom: 8, top: 32)
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        },
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: PasswordTextField(
                        hintText: "Password",
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: PasswordTextField(
                        hintText: "Password Confirmation",
                        onChanged: (value) {
                          setState(() {
                            _confPassword = value;
                          });
                        },
                      )
                    ),
                  ],
                ),
        
                SizedBox(height: 8,),
        
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        onPressed: (){},
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Continue",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      )
                      )
                  ],
                ),
        
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: TextStyle(color: Colors.black38, fontSize: 14),
                          text: "By continuing you accept our "
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.black38, fontSize: 14, decoration: TextDecoration.underline),
                          text: "Terms of services",
                          recognizer: TapGestureRecognizer()..onTap = (){
                  
                          }
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.black38, fontSize: 14),
                          text: " and "
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.black38, fontSize: 14, decoration: TextDecoration.underline),
                          text: "Privacy policy",
                          recognizer: TapGestureRecognizer()..onTap = (){
                  
                          }
                        )
                      ]
                    )
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 5,
                        color: Colors.black54,
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 16,
                      
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 5,
                        color: Colors.black54,
                      )
                    ),
                  ],
                ),
        
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an ",
                        style: TextStyle(
                          color: Colors.black38
                        )
                      ),
                      TextSpan(
                        text: "account?",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const LoginScreen();
                          }));
                        }
                      )
                    ]
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class RequirementBulletPoint extends StatefulWidget {
  final bool Function(String) onChanged;
  final String text;
  final String stringTested;
  const RequirementBulletPoint({
    super.key,
    required this.text,
    required this.onChanged,
    required this.stringTested,
  });

  @override
  State<RequirementBulletPoint> createState() => _RequirementBulletPointState();
}

class _RequirementBulletPointState extends State<RequirementBulletPoint> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Text(
          "\u2022", 
          style: TextStyle(
              fontSize: 16,
              color: widget.onChanged(widget.stringTested) ? const Color.fromARGB(255, 35, 181, 110) : Colors.black87
            ),
          ), //bullet text
        const SizedBox(width: 10, height: 0), //space between bullet and text
        Expanded( 
          child:Text(
            widget.text, 
            style: TextStyle(
              fontSize: 16,
              color: widget.onChanged(widget.stringTested) ? const Color.fromARGB(255, 35, 181, 110) : Colors.black87
            ),), //text
        )
      ]
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const PasswordTextField({super.key, required this.onChanged, this.hintText = "Password"});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured(){
    setState(() {
      _obscured = !_obscured;
      if(!textFieldFocusNode.hasPrimaryFocus) textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.hintText,
        contentPadding: EdgeInsets.only(bottom: 8, top: 32),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured ? Icons.visibility_rounded : Icons.visibility_off_rounded, size: 24,
            ),
          ),
        )
      ),
      keyboardType: TextInputType.text,
      obscureText: !_obscured,
      focusNode: textFieldFocusNode,
      onChanged: widget.onChanged
    );
  }
}