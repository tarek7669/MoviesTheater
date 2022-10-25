import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/ColorConsts.dart';

import '../../ViewModel/Bloc/Login/login_cubit.dart';
import '../Components/Core/CustomTextField.dart';
import '../Components/Core/LoginSignupButton.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Movies",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 45
                      ),
                    ),
                    Text("Theater",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                      ),
                    ),

                    SizedBox(height: 50),

                    Text("Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45
                      ),
                    ),
                    SizedBox(height: 50),

                    BlocProvider(
                      create: (context) => LoginCubit(),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          LoginCubit login = LoginCubit.get(context);
                          return Column(
                            children: [
                              customTextField("E-mail", login.emailController),

                              SizedBox(height: 50,),

                              customTextField("Password", login.passwordController),

                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkResponse(
                                    onTap: () {},
                                    child: Text("Forget Password?",
                                      style: TextStyle(
                                        color: primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 40,),

                              LoginSignupButton("Login", () {
                                debugPrint("****************");
                                login.Login(context);
                              }),

                            ],
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 30),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          InkResponse(
                            onTap: () {},
                            child: Text("Signup",
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkResponse(
                          onTap: () {},
                          child: Text("Enter as a guest",
                            style: TextStyle(
                              fontSize: 20,
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
