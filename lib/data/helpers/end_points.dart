class EndPoints {
  // static String postSignOut = 'signOut';
  static String loginApi = 'user/login';
  static String verifyOtpApi = 'user/login/verifyotp';
  static String registerApi = 'user/register';
  static String villagesApi = 'user/villages';
  static String businessCategoriesApi = 'user/businesscategories';
  static String committeeMembersApi =
      'user/committeemembers/villagerepresentative';
  static String uploadProfilePic = 'user/upload/profile';
  static String uploadAdharPic = 'user/upload/aadhar';
  static String educationApi = 'user/studies';
  static String setProfile = 'user/profile';
  static String postFamilyMembersAdd = 'user/familymembers/save';
  static String getFamilyMembers = 'user/familymembers';
  static String getOneFamilyMembers = 'user/stu/getone';
  static String postDeleteFamilyMembers = 'user/familymembers/delete';
  static String getFullFamily = 'user/familymembers/getfamily';

  static String postForeignersSave = 'user/foreigners/save';
  static String getAllForeigners = 'user/foreigners';
  static String getOneForeigners = 'user/foreigners/getone';
  static String postDeleteForeigner = 'user/foreigners/delete';

  static String getAllUsers = 'user/users';
  static String postSettingApi = 'user/settings';
  static String getOneUsers = 'user/users/getone';

  static String uploadResult = 'user/results/upload';
  static String postAddResult = 'user/results/save';
  static String getAllResult = 'user/results';

  static String getServices = 'user/services';
  static String postCommitteemembers = 'user/committeemembers';

  static String getScolarshipList = 'user/scolarships';
  static String addScolarship = 'user/scolarships/apply';
  static String uploadFeeReceipt = 'user/scolarship/uploadfeereceipt';
  static String uploadDocument = 'user/scolarships/upload';
  static String uploadPassbook = 'user/scolarship/uploadpassbook';
  static String getStudies = 'user/studies';

  static String postWindowService = 'user/widows/apply';
  static String getWindowService = 'user/widows';
  static String uploadDeathCertificate = 'user/widows/upload';

  static String postNotification = 'user/messages';
  static String postGetOneNotification = 'user/messages/getone';

  static String uploadProfile = 'user/loans/upload/profile';
  static String uploadLoan = 'user/loans/upload/documents';
  static String postLoanApply = 'user/loans/apply';
  static String getAllLoan = 'user/loans';

  static String postDonatorsList = 'user/funds';
  static String postDonators = 'user/donators';
  static String postGallery = 'user/gallery';
  static String postServiceActivities = 'user/serviceactivities';
  static String postGetOneGallery = 'user/gallery/getone';

  static String getAds = 'user/ads';
  static String getAllVillage = 'user/villages/withpagination';

  static String postQualifiedPrizes = 'user/results/qualifiedstudentsforprize';
  static String postQualifiedStationery =
      'user/results/qualifiedstudentsforstationery';
  static String postDownloadStationery =
      'user/results/downloadcouponforstationery';
  static String postDownloadPrizeStationery =
      'user/results/downloadcouponforprize';
}
