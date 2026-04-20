// coverage:ignore-file

import 'package:dhakaniya_gam/app/navigators/app_pages.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class RouteManagement {
  static void goToIntroFirstScreen() =>
      Get.offAllNamed<void>(Routes.introFirstScreen);
  static void goToIntroSecondScreen() =>
      Get.offAllNamed<void>(Routes.introSecondScreen);
  static void goToIntroThiredScreen() =>
      Get.offAllNamed<void>(Routes.introThreeScreen);
  static void goToLoginScreen() => Get.offAllNamed<void>(Routes.LoginScreen);
  static void goToRegisterScreen() => Get.toNamed<void>(Routes.registerScreen);
  static void goToHomeScreen() => Get.toNamed<void>(Routes.homeScreen);
  static void goToParivarikVigatScreen() =>
      Get.toNamed<void>(Routes.parivarikVigatScreen);
  static void goToParivarSabhayVigatScreen(String memberId, bool isEdit) =>
      Get.toNamed<void>(Routes.parivarSabhayVigatScreen,
          arguments: [memberId, isEdit]);
  static void goToParivarSabhayVigatListScreen() =>
      Get.toNamed<void>(Routes.parivarSabhayVigatListScreen);
  static void goToVideshSabhayVigatListScreen() =>
      Get.toNamed<void>(Routes.videshSabhayVigatListScreen);
  static void goToVideshSabhayVigatScreen(String memberId, bool isEdit) =>
      Get.toNamed<void>(Routes.videshSabhayVigatScreen,
          arguments: [memberId, isEdit]);
  static void goToOtherDetailsScreen() =>
      Get.toNamed<void>(Routes.otherDetailsScreen);
  static void goToSelectLanguageScreen() =>
      Get.toNamed<void>(Routes.selectLanguageScreen);
  static void goToDashboardScreen() =>
      Get.toNamed<void>(Routes.dashboardScreen);
  static void goToSabhayYadiScreen() =>
      Get.toNamed<void>(Routes.sabhayYadiScreen);
  static void goToSalahakarSamitiScreen() =>
      Get.toNamed<void>(Routes.salahakarSamitiScreen);
  static void goToTalukaRepresentativeScreen() =>
      Get.toNamed<void>(Routes.talukaRepresentativeScreen);
  static void goToVillageRepresentativScreen() =>
      Get.toNamed<void>(Routes.villageRepresentativScreen);
  static void goToDonorsScreen() => Get.toNamed<void>(Routes.donorsScreen);
  static void goToDonorsDetails(String fundsId, String name) =>
      Get.toNamed<void>(Routes.donorsDetails, arguments: [fundsId, name]);
  static void goToUploadResultScreen() =>
      Get.toNamed<void>(Routes.uploadResultScreen);
  static void goToUploadResultListScreen() =>
      Get.toNamed<void>(Routes.uploadResultListScreen);
  static void goToQualifyPrizeScreen(List<Student>? studentList) =>
      Get.toNamed<void>(Routes.qualifyPrizeScreen, arguments: studentList);
  static void goToQualifyPrizeListScreen() =>
      Get.toNamed<void>(Routes.qualifyPrizeListScreen);
  static void goToQualifyStationeryScreen(String std, bool isGujarati) =>
      Get.toNamed<void>(Routes.qualifyStationeryScreen,
          arguments: [std, isGujarati]);
  static void goToQualifyStationeryListScreen() =>
      Get.toNamed<void>(Routes.qualifyStationeryListScreen);
  static void goToOtpScreen(String mobile, String key) =>
      Get.toNamed<void>(Routes.otpScreen, arguments: [mobile, key]);
  static void goToBottomBarScreen() =>
      Get.offAllNamed<void>(Routes.bottomBarScreen);
  static void goToNotificationScreen() =>
      Get.toNamed<void>(Routes.notificationScreen);
  static void goToProfileScreen() => Get.toNamed<void>(Routes.profileScreen);
  static void goToSabhyFeeRasidScreen() =>
      Get.toNamed<void>(Routes.sabhyFeeRasidScreen);
  static void goToSevaoScreen() => Get.toNamed<void>(Routes.sevaoScreen);
  static void goToSecshanikSahayYojnaScreen() =>
      Get.toNamed<void>(Routes.sekshanikSahayYojnaScreen);
  static void goToSahayVigatScreen() =>
      Get.toNamed<void>(Routes.sabhyVigatScreen);
  static void goToAbhyasKartiDikriScreen() =>
      Get.toNamed<void>(Routes.abhyasKartiDikriScreen);

  static void goToSabhayYadiDeatilsScreen(String id) =>
      Get.toNamed<void>(Routes.sabhayYadiDeatilsScreen, arguments: id);
  static void goToVerifyIdentityScreen() =>
      Get.toNamed<void>(Routes.verifyIdentityScreen);
  static void goToaddAbhyasKartiDikriScreen() =>
      Get.toNamed<void>(Routes.addabhyasKartiDikriScreen);
  static void goToBhalamanKarnarScreen() =>
      Get.toNamed<void>(Routes.bhalamanKarnarScreen);
  static void goToBidanNiVigatScreen() =>
      Get.toNamed<void>(Routes.bidanVigatScreen);
  static void goToValiniBankDetailScreen() =>
      Get.toNamed<void>(Routes.valiNiBankDetailScreen);
  static void goToVidhvaSahayYojnaScreen() =>
      Get.toNamed<void>(Routes.vidhvaSahayYojnaScreen);
  static void goToVidhvaBenniVigatScreen() =>
      Get.toNamed<void>(Routes.vidhvaBenniVigatScreen);
  static void goToBalkoniVigatScreen() =>
      Get.toNamed<void>(Routes.balkoNivigatScreen);
  static void goToAddBalkoScreen(bool isEdit, int index) =>
      Get.toNamed<void>(Routes.addBalkoScreen, arguments: [isEdit, index]);
  static void goToanyaVigatScreen() =>
      Get.toNamed<void>(Routes.anyaVigatScreen);
  static void goTovagerVyajYojnaScreen() =>
      Get.toNamed<void>(Routes.vagerVyajLoanYojnaScreen);
  static void goTovidhyarthiniAbhyasVigatScreen() =>
      Get.toNamed<void>(Routes.vidhyarthiniAbhyasVigatScreen);
  static void goToLoanniVigatScreen() =>
      Get.toNamed<void>(Routes.loanniVigatScreen);
  static void goTovidhyathihiAbhyasiVigatScreen() =>
      Get.toNamed<void>(Routes.vidhyarthiniAbhyasVigatScreen);
  static void goToaddVidhyathihiAbhyasiVigatScreen() =>
      Get.toNamed<void>(Routes.addVidhyarthiniAbhyasniVigatScreen);
  static void goToabhyasKramNiVigatScreen() =>
      Get.toNamed<void>(Routes.abhyasKramNiVigatScreen);
  static void goTokharchNiVigatScreen() =>
      Get.toNamed<void>(Routes.kharchNiVigatScreen);
  static void goToKutumbMaKamataSabhyScreen() =>
      Get.toNamed<void>(Routes.kutumbMaKamataSabhy);
  static void goToAddkamataSabhyScreen(bool isEdit, int index) =>
      Get.toNamed<void>(Routes.addKamataSabhyScreen,
          arguments: [isEdit, index]);
  static void goToKhetiNiVigatScreen() =>
      Get.toNamed<void>(Routes.addKhetiVigatScreen);
  static void goToHodedarScreen() => Get.toNamed<void>(Routes.hodedarScreen);
  static void goToYuvaSayojakScreen() =>
      Get.toNamed<void>(Routes.yuvaSayojakScreen);
  static void goToSevaKiyParvutiScreen() =>
      Get.toNamed<void>(Routes.sevaKiyParvutiScreen);
  static void goToVidhavaOtherDetailsScreen() =>
      Get.toNamed<void>(Routes.vidhavaOtherDetailsScreen);
  static void goToPresidentScreen(String hodo) =>
      Get.toNamed<void>(Routes.presidentScreen, arguments: hodo);
  static void goToGalleryScreen() => Get.toNamed<void>(Routes.galleryScreen);
  static void goToVillageYadiListScreen() =>
      Get.toNamed<void>(Routes.villageYadiListScreen);
  static void goToVillageYadiDetailScreen(
          String villageId, String villageName) =>
      Get.toNamed<void>(Routes.villageYadiDetailScreen,
          arguments: [villageId, villageName]);
  static void goToShowFullScareenImage(String url, String type) =>
      Get.toNamed<void>(Routes.showFullScareenImage, arguments: [url, type]);
  static void goToGalleryDetailsScreen(String id) =>
      Get.toNamed<void>(Routes.galleryDetailsScreen, arguments: id);
  static void goToNotificationDetailsScreen(String id) =>
      Get.toNamed<void>(Routes.notificationDetailsScreen, arguments: id);
  static void goToAdsDetailsScreen(List<String> id) =>
      Get.toNamed<void>(Routes.adsDetailsScreen, arguments: id);
}
