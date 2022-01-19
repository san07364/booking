import 'package:booking/textstyle.dart';
import 'package:booking/utils/device_size.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _width = 0.0;
  var _height = 0.0;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    _width = DeviceSize.width(context);
    _height = DeviceSize.height(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('asset/image/display_img.png',height: _height/3,width: _width,fit: BoxFit.fill,),
              SizedBox(height: _height / 25,),
              const Text('Sign In',style: Style.largeHeading,),
              SizedBox(height: _height / 25,),
              Padding(
                padding: const EdgeInsets.only(left: 22,right: 22),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('E-Mail',style: Style.heading,),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                              filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0,color:Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 0,color:Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(10.0),
                            )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Password',style: Style.heading,),
                        SizedBox(height: 10,),
                        TextFormField(
                          obscuringCharacter: '•',
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey.shade800,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0,color:Colors.grey.shade100),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0,color:Colors.grey.shade100),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      width: _width / 1,
                      child: TextButton(
                        onPressed: (){},
                        child: Text('Continue',style: Style.buttonText,),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 15)
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Expanded(child: Container(color: Colors.grey.shade300,height: 2,)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('or',style: Style.normal,),
                        ),
                        Expanded(child: Container(color: Colors.grey.shade300,height: 2,)),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    OutlinedButton(
                        onPressed: (){},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.mail_rounded,color: Colors.grey,),
                            SizedBox(width: _width/ 8,),
                            Text('Sign-in with Phone number',style: Style.normal,)
                          ],
                        )
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
