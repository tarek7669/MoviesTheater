import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/Model/LoginModel.dart';
import '../../../Constants.dart';
import '../../../View/Pages/Home.dart';
import '../../Database/Network/dio_helper.dart';
import '../../Database/Network/end_points.dart';
import '../../Database/SharedPreferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String message = '';
  SharedPref shared = SharedPref();
  LoginModel? loginModel;


  void Login(BuildContext context) {

    var temp = {
      "email": emailController.text,
      "password": passwordController.text,
    };

     DioHelper.postData(url: loginEndPoint, data: temp).then((value) {
      print(value.data.toString());
      if (value.statusCode == 200) {
        Token = value.data['accessToken'];
        shared.setToken("token", Token);
        if (Token != '' && Token != null && Token.isNotEmpty) {
          message = "success";
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          message = 'Token Error';
        }
        emit(LoginSuccess());
      }
      else{
        message = 'error';
      }
    }).catchError((e) {
      message = "error";
      emit(LoginError());
    });
  }
}
