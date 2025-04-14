import 'package:demo_app/model/base_res/base_response.dart';
import 'package:demo_app/model/home/activity_model.dart';
import 'package:demo_app/model/home/bank_account_model.dart';
import 'package:demo_app/model/iev_response/IevResponse.dart';
import 'package:demo_app/model/login/forgot_password_model.dart';
import 'package:demo_app/model/login/login_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

//@RestApi(baseUrl: "https://king-prawn-app-dyicd.ondigitalocean.app")
@RestApi(baseUrl: "https://echis.up.railway.app/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("Enumerator/Login")
  Future<BaseResponse<LoginResponse>> login(
      @Body() Map<String, dynamic> request);

  @POST("/Enumerator/Refreshtoken")
  Future<BaseResponse<LoginResponse>> refreshToken(
      @Body() Map<String, dynamic> request);

  @POST("IEV/data/submit")
  Future<BaseResponse<IevSubmissionResponse>> submitIEVData(
      @Body() Map<String, dynamic> request);

  @POST("IEVSurvey/data/submit")
  Future<BaseResponse> submitIEVDataNew(@Body() Map<String, dynamic> request);

  //reset password
  @POST("Enumerator/forgotpassword/complete")
  Future<BaseResponse> forgotPasswordResetOtp(
      @Body() Map<String, dynamic> reqBody);

  @POST("Enumerator/forgotpassword/verifyOtp")
  Future<BaseResponse<ForgotPasswordModel>> forgotPasswordConfirmOtp(
      @Body() Map<String, dynamic> reqBody);

  @POST("Enumerator/forgotpassword/sendOtp")
  Future<BaseResponse<ForgotPasswordModel>> forgotPasswordSendOtp(
      @Body() Map<String, dynamic> reqBody);

  @GET("IEVSurvey/data?pageNumber={page}")
  Future<BaseResponse> getAllDataIEV(@Path() int page);
  @GET("IEVSurvey/enumerator/data")
  Future<BaseResponse> getAllDataIEVNew(
    @Query("pageNumber") int pageNumber,
    /*    @Query("HouseNumber") String houseNumber,
    @Query("Lga") String lga,
    @Query("State") String state, */
  );

  @GET("Analytics/mobile/widget")
  Future<BaseResponse<ActivityModel>> getAnalytics();

  @GET("National/states")
  Future<BaseResponse<List<String>>> getStates();

  @GET("National/lgas?State={state}")
  Future<BaseResponse<List<String>>> getLga(@Path("state") state);

  @GET("National/wards?Lga={lga}&State={state}")
  Future<BaseResponse<List<String>>> getWards(
      @Path("state") state, @Path("lga") lga);

  @GET("National/settlements?Lga={lga}&Ward={ward}&State={state}")
  Future<BaseResponse<List<SettlementModel>>> getSettlement(
    @Path("state") state,
    @Path("lga") lga,
    @Path("ward") ward,
    @Path("teamCode") teamCode,
  );

  @GET("/Resources/account/designations")
  Future<BaseResponse<List<String>>> getDesignation();
  @GET("/Wallet/banks")
  Future<BaseResponse<List<String>>> getBanks();

  @POST("/Wallet/account/details")
  Future<BaseResponse> postBankAccountDetails(
      @Header('Authorization') token, @Body() Map<String, dynamic> reqBody);

  @GET("/Wallet/account/details")
  Future<BaseResponse<List<BankAccountModel>>> getBankAccountDetails(
    @Header('Authorization') token,
  );

  @DELETE("/Wallet/account/details")
  Future<BaseResponse> deleteBankDetails(
    @Header('Authorization') token,
    @Query("accountDetailId") String accountDetailsId,
  );

  @PATCH("/Wallet/account/details")
  Future<BaseResponse> editBankDetails(
      @Header('Authorization') token,
      @Query("accountDetailId") String accountDetailsId,
      @Body() Map<String, dynamic> reqBody);

  @POST("/IEVSurvey/housenumber/verify")
  Future<BaseResponse<List<String>>> verifyHouseNumber(
    @Header('Authorization') token,
    @Query("houseNumber") String houseNumber,
  );

  @GET("/IEVSurvey/householdnumber/generate")
  Future<BaseResponse<String>> generateNumber(
    @Header('Authorization') token,
    @Query("houseNumber") String houseNumber,
  );
}
