import 'package:demo_app/model/base_res/base_response.dart';
import 'package:demo_app/model/iev_response/IevResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

//@RestApi(baseUrl: "https://king-prawn-app-dyicd.ondigitalocean.app")
@RestApi(baseUrl: "https://echis.up.railway.app/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("Enumerator/Login")
  Future<BaseResponse<LoginResponse>> login(@Body() Map<String, dynamic> request);

  @POST("IEV/data/submit")
  Future<BaseResponse<IevSubmissionResponse>> submitIEVData(@Body() Map<String, dynamic> request);
}
