import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_theater/constants/color_consts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../view_model/Bloc/Login/login_cubit.dart';
import '../Components/Core/custom_text_field.dart';
import '../Components/Core/login_signup_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              // padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(126, 49, 125, 0),
                      child: Image.asset("assets/images/stars.png", width: 108, height: 83)
                    ),
                    SizedBox(height: 10),
                    Text("Theater",
                      style: GoogleFonts.getFont('Salsa', color: textColor, fontSize: 17, fontWeight: FontWeight.w400)
                    ),

                    SizedBox(height: 33),

                    Text("Login",
                      style: GoogleFonts.getFont('Salsa', color: textColor, fontSize: 38, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 46),

                    BlocProvider(
                      create: (context) => LoginCubit(),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          LoginCubit login = LoginCubit.get(context);
                          return Container(
                            padding: EdgeInsets.fromLTRB(40, 0, 41, 0),
                            child: Column(
                              children: [

                                customTextField("E-mail", login.emailController),

                                SizedBox(height: 50,),

                                customTextField("Password", login.passwordController),

                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkResponse(
                                      onTap: () {},
                                      child: Text("Forget Password?",
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: primaryColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 44,),

                                LoginSignupButton(login.is_loading ?  Center(child: Container( width: 25, height: 25, child: CircularProgressIndicator(color: textColor,)),) :
                                  Text("Login",
                                      style: GoogleFonts.getFont('Roboto', color: textColor, fontSize: 13, fontWeight: FontWeight.w600)
                                  ),
                                    () {login.Login(context);}
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 34),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",
                            style: GoogleFonts.getFont('Roboto', color: textColor, fontSize: 13, fontWeight: FontWeight.w600)
                          ),
                          InkResponse(
                            onTap: () {},
                            child: Text("Signup",
                              style: GoogleFonts.getFont('Roboto', color: primaryColor, fontSize: 13, fontWeight: FontWeight.w600)
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 50),

                    Container(
                      padding: EdgeInsets.fromLTRB(29, 0, 30, 19.61),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: textColor.withOpacity(0.2),
                            height: 2,
                            width: 100,
                          ),
                          Text("or connect with",
                            style: GoogleFonts.getFont('Roboto', color: textColor.withOpacity(0.63), fontSize: 12, fontWeight: FontWeight.w400,),
                          ),
                          Container(
                            color: textColor.withOpacity(0.2),
                            height: 2,
                            width: 100,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 19.61),

                    Container(
                      padding: EdgeInsets.fromLTRB(121, 0, 124.59, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/icons/twitter.svg"),
                          SvgPicture.asset("assets/icons/facebook.svg"),
                          SvgPicture.asset("assets/icons/google.svg"),
                        ],
                      )
                    ),

                    SizedBox(height: 42.31),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkResponse(
                          onTap: () {},
                          child: Text("Enter as a guest",
                            style: GoogleFonts.getFont('Roboto', color: primaryColor, fontSize: 15, fontWeight: FontWeight.w600, decoration: TextDecoration.underline,),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 60),

                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
