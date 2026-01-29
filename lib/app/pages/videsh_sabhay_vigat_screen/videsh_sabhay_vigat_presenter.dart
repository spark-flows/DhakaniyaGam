import 'package:dhakaniya_gam/domain/domain.dart';

class VideshSabhayVigatPresenter {
  VideshSabhayVigatPresenter(
      this.videshSabhayVigatUsecases, this.commonUsecases);

  final VideshSabhayVigatUsecases videshSabhayVigatUsecases;
  final CommonUsecases commonUsecases;

  Future<ResponseModel?> postForeignersSave({
    bool isLoading = false,
    required String foreignerId,
    required String familyMemberId,
    required String countryCode,
    required String mobile,
    required String For,
    required String education,
    required String other_education,
    required String university_name,
    required String business,
    required String other_business,
    required String country,
    required String city,
    required int from,
  }) async =>
      await videshSabhayVigatUsecases.postForeignersSave(
          foreignerId: foreignerId,
          familyMemberId: familyMemberId,
          countryCode: countryCode,
          mobile: mobile,
          For: For,
          education: education,
          other_education: other_education,
          university_name: university_name,
          business: business,
          other_business: other_business,
          country: country,
          city: city,
          from: from,
          isLoading: isLoading);

  Future<ForeignersMemberModel?> getAllForeigners({
    bool isLoading = false,
  }) async =>
      await videshSabhayVigatUsecases.getAllForeigners(
        isLoading: isLoading,
      );

  Future<GetOneForeignersMemberModel?> getOneForeigners({
    required String foreignerId,
    bool isLoading = false,
  }) async =>
      await videshSabhayVigatUsecases.getOneForeigners(
        foreignerId: foreignerId,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postDeleteForeigner({
    required String foreignerId,
    bool isLoading = false,
  }) async =>
      await videshSabhayVigatUsecases.postDeleteForeigner(
        foreignerId: foreignerId,
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> businessCategoriesApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.businessCategoriesApi(
        isLoading: isLoading,
      );

  Future<BusinessCategoriesModel?> educationApi({
    bool isLoading = false,
  }) async =>
      await commonUsecases.educationApi(
        isLoading: isLoading,
      );

  Future<GetFamilyModel?> getFullFamily({
    bool isLoading = false,
  }) async =>
      await commonUsecases.getFullFamily(
        isLoading: isLoading,
      );
}
