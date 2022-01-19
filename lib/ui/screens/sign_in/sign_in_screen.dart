import 'package:booking/textstyle.dart';
import 'package:booking/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              Image.asset('asset/image/display_img.png',height: _height/3.2,width: _width,fit: BoxFit.fill,),
              SizedBox(height: _height / 30,),
              const Text('Sign-in',style: Style.largeBoldHeading,),
              SizedBox(height: _height / 30,),
              Padding(
                padding: const EdgeInsets.only(left: 22,right: 22),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('E-Mail',style: Style.regularText,),
                        const SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
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
                    const SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Password',style: Style.regularText,),
                        const SizedBox(height: 10,),
                        TextFormField(
                          obscuringCharacter: '•',
                          obscureText: !_passwordVisible,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
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
                        child: const Text('Continue',style: Style.buttonText,),
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
                        Expanded(child: Container(color: Colors.grey.shade200,height: 1,)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('or',style: Style.normal,),
                        ),
                        Expanded(child: Container(color: Colors.grey.shade200,height: 1,)),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    OutlinedButton(
                        onPressed: (){},

                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 20),
                          side: BorderSide(width: 1.0, color: Colors.grey.shade500),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SvgPicture.asset('asset/image/mail.svg'),
                            const Expanded(
                              child:  Align(
                                  alignment: Alignment.center,
                                  child:  Text('Sign-in with Phone number',style: Style.normal,)),
                            )
                          ],
                        )
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text('Reset Password',style: TextStyle(color: Colors.grey.shade400),)),
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
