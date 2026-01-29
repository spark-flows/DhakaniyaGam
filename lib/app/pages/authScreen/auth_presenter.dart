import 'package:dhakaniya_gam/domain/domain.dart';

class AuthPresenter {
  AuthPresenter(this.authUseCases, this.commonUsecases);

  final AuthUseCases authUseCases;
  final CommonUsecases commonUsecases;

  Future<LoginModel?> loginApi({
    required String mobile,
    bool isLoading = false,
  }) async =>
      await authUseCases.loginApi(
        mobile: mobile,
        isLoading: isLoading,
      );

  Future<VerifyModel?> verifyOtpApi({
    required String key,
    required String otp,
    required String mobile,
    required String fcm_token,
    bool isLoading = false,
  }) async =>
      await authUseCases.verifyOtpApi(
        mobile: mobile,
        key: key,
        otp: otp,
        fcm_token: fcm_token,
        isLoading: isLoading,
      );
}
