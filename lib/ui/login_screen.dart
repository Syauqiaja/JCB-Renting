import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "images/background.jpg",
            fit: BoxFit.fitHeight,
            color: Colors.black38,
            colorBlendMode: BlendMode.multiply,),
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 64),
                    height: 64.0,
                    child: Image.asset("images/rent_logo.png"),
                  ),
                ),
                const Expanded(
                  child: Spacer(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const BigText("Dig in"),
                      const BigText("Get it done."),
                      const BigText("Rent Your Car."),
                      Container(
                        margin: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(4.0))
                              ),
                              child: const Text(
                                "+62",
                                style: TextStyle(
                                  color: Colors.black, 
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(4.0))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(0),
                                    border: InputBorder.none,
                                    hintText: "Enter Your Number",
                                    hintStyle: TextStyle(
                                      color: Colors.black54, 
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                                    hintMaxLines: 1,
                                  ),
                                  textAlign: TextAlign.start,
                                  onChanged: (String value) {
                                    setState(() {
                                      _name = value;
                                    });
                                  }
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 8, left: 16, right: 16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                  )
                                ),
                                onPressed: (){},
                                child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold),)
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New here? create an ",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          InkWell(
                            child: const Text(
                              "account",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            onTap: (){
                              // Direct to register screen
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]
          )
        ],
      );
  }
}

class BigText extends StatelessWidget {
  final String _text;
  const BigText(this._text,{super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w500,
        color: Colors.white
      ),
    );
  }
}