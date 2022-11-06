import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_theater/Model/login_model.dart';
import '../../../constants/constants.dart';
import '../../../View/Pages/bottom_nav_bar_screen.dart';
import '../../../View/Pages/home_screen.dart';
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
  LoginModel? loginModel;

  bool is_loading = false;


  void Login(BuildContext context) {

    is_loading = true;
    emit(LoginLoading());

    var temp = {
      "email": emailController.text,
      "password": passwordController.text,
    };

     DioHelper.postData(url: loginEndPoint, data: temp).then((value) {
        Token = value.data['accessToken'];
        SharedPref.setToken("token", Token);
        if (Token != '' && Token != null && Token.isNotEmpty) {
          message = "success";
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BottomNavBar()));
        } else {
          message = 'Token Error';
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
          ));
          emit(LoginError());
        }
        is_loading = false;
        emit(LoginSuccess());
    }).catchError((e) {
      is_loading = false;
      message = "Please make sure you entered your credentials correctly";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
      emit(LoginError());
    });
  }
}
