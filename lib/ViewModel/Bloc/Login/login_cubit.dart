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
  void Login(BuildContext context) async {
    var temp = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    debugPrint("${emailController.text}");

     DioHelper.postData(url: loginEndPoint, data: temp).then((value) {
      debugPrint("----------> ${value.statusCode}");
      print(value.data.toString());
      if (value.statusCode == 200) {
        Token = value.data['accessToken'];
        shared.setToken("token", Token);
        if (Token != '' && Token != null && Token.isNotEmpty) {
          debugPrint("\n\n\n" + "Token:   $Token" + "\n\n\n");
          message = "success";
          debugPrint("message ----------> $message");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          debugPrint("\n\n\n" + "erorrrrrrrrrrrrrrrrr" + "\n\n\n");

          message = 'Token Error';
        }
        emit(LoginSuccess());
      }
      else{
        debugPrint("\n\n\n" + "erorrrrrrrrrrrrrrrrr" + "\n\n\n");

      }
    }).catchError((e) {
      message = "error";
      emit(LoginError());
    });
  }
}
