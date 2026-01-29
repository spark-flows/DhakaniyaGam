import 'package:dhakaniya_gam/domain/domain.dart';

/// Use case for getting the data from the API
class AuthUseCases {
  AuthUseCases(this.repository);

  final Repository repository;

  Future<LoginModel?> loginApi({
    required String mobile,
    bool isLoading = false,
  }) async =>
      await repository.loginApi(
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
      await repository.verifyOtpApi(
        mobile: mobile,
        key: key,
        otp: otp,
        fcm_token: fcm_token,
        isLoading: isLoading,
      );
}
