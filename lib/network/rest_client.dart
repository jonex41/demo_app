import 'dart:io';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:demo_app/model/base_res/base_response.dart';
import 'package:demo_app/model/home/home_user_model.dart';
import 'package:demo_app/model/home/user_transaction_model.dart';
import 'package:demo_app/model/login/login_res.dart';

part 'rest_client.g.dart';

//@RestApi(baseUrl: "https://king-prawn-app-dyicd.ondigitalocean.app")
@RestApi(
    baseUrl: "http://www.google.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

/*   @POST("/auth/login")
  Future<LoginResponse> login(@Body() Map<String, dynamic> request); */

}
