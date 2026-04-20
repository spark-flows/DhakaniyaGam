// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DashboardController extends GetxController {
  DashboardController(this.dashboardPresenter);

  @override
  void onInit() {
    // getFullFamily();
    // villagesApi();
    businessCategoriesApi();
    getStudies();
    getAds();
    super.onInit();
  }

  int selectGalleryAdsPage = 0;

  List<String> imageList = [];

  final pageAdsController = PageController(viewportFraction: 0.85);

  Timer? _autoAdsScrollTimer;

  int selectAdsDetails = 0;

  void startAutoScrollAds() {
    _autoAdsScrollTimer?.cancel();
    if (imageList.length <= 1) return;
    _autoAdsScrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (pageAdsController.hasClients) {
        final nextPage = (selectAdsDetails + 1) % imageList.length;
        pageAdsController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void stopAutoScrollAds() {
    _autoAdsScrollTimer?.cancel();
  }

  final pageController = PageController(viewportFraction: 0.85);

  Timer? _autoScrollTimer;

  void startAutoScroll() {
    _autoScrollTimer?.cancel();
    if (adsList.length <= 1) return;
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (pageController.hasClients) {
        final nextPage = (selectAds + 1) % adsList.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void stopAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  final DashboardPresenter dashboardPresenter;

  List<String> villageImgList = [
    AssetConstants.img_1,
    AssetConstants.img_2,
  ];

  List<String> titleList = [
    "service_activity".tr,
    "list_of_members".tr,
    "executive".tr,
    "donors".tr,
    "upload_the_result".tr,
    "qualify_for_prizes".tr,
    "family_members".tr,
    "gallerys".tr,
  ];

  List<String> hodedarList = [
    "president_mr".tr,
    "vice_president_shri".tr,
    "minister_shri".tr,
    "joint_minister_shri".tr,
    "treasurer_Mr".tr,
    "sah_treasurer_Mr".tr,
  ];

  ///================================================= UploadResultScreen ================================================///

  String? selectBloodValue = "Select BloodGroup";

  List<String> bloodGroup = [
    'Select BloodGroup',
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];

  bool isGujarati = false;
  bool isEnglish = false;

  GlobalKey<FormState> resultKey = GlobalKey<FormState>();
  TextEditingController percentController = TextEditingController();
  TextEditingController totalMarksController = TextEditingController();
  TextEditingController obtainedController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  PagingController<int, GetAllUsersDoc> pagingController =
      PagingController(firstPageKey: 1);

  List<GetAllUsersDoc> findFirendsListModel = [];
  int limit = 10;

  Future<void> getAllUsers(int pageKey) async {
    var response = await dashboardPresenter.getAllUsers(
      page: pageKey,
      limit: limit,
      search: searchController.text,
      village: selectVillageValue ?? "",
      business: selectBusinessValue ?? "",
      education: selectStudyValue ?? "",
      bloodGroup:
          selectBloodValue == "Select BloodGroup" ? "" : selectBloodValue ?? "",
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        findFirendsListModel.clear();
        pagingController.itemList?.clear();
      }
      findFirendsListModel = response.data?.docs ?? [];

      final isLastPage = findFirendsListModel.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(findFirendsListModel);
      } else {
        var nextPageKey = pageKey + 1;
        pagingController.appendPage(findFirendsListModel, nextPageKey);
      }
      update();
    }
  }

  ///---------------------------------------------------- SabhayYadiDeatilsScreen -------------------------------------------------------------

  GetOneUserDetailsData? getOneUserDetailsData = GetOneUserDetailsData();

  String? userId;

  Future<void> getOneUsers() async {
    var response = await dashboardPresenter.getOneUsers(
      userId: userId ?? "",
      isLoading: false,
    );
    getOneUserDetailsData = null;
    if (response != null) {
      getOneUserDetailsData = response.data!;
      update();
    }
  }

  ///---------------------------------------------------- Result Screen -------------------------------------------------------------

  List<GetResultData> getResultList = [];

  Future<void> getAllResult() async {
    var response = await dashboardPresenter.getAllResult(
      isLoading: true,
    );
    getResultList.clear();
    if (response?.data != null) {
      getResultList.addAll(response?.data ?? []);
    }
    update();
  }

  Future postDownloadStationery(String resultId, BuildContext context) async {
    var response = await dashboardPresenter.postDownloadStationery(
      resultId: resultId,
      isLoading: true,
    );
    if (response?.data != null) {
      Utility.downloadAndSavePDF(
          response?.data?.stationeryCouponPath ?? "", "DhakaniyaGam");
    }
    update();
  }

  Future postDownloadPrize(String resultId) async {
    var response = await dashboardPresenter.postDownloadPrize(
      resultId: resultId,
      isLoading: true,
    );
    if (response?.data != null) {
      Utility.downloadAndSavePDF(
          response?.data?.prizeCouponPath ?? "", "DhakaniyaGam");
    }
    update();
  }

  String? selectStudyResult;

  List<EducationData> selectStudyResultLists = [
    EducationData(
      gujaratiName: "Select Education",
      id: '',
    ),
  ];

  Future<void> getStudiesResult() async {
    var response = await dashboardPresenter.getStudies(
      isLoading: true,
    );
    selectStudyResultLists.clear();
    if (response?.status == 200) {
      selectStudyResultLists = [
        EducationData(
          gujaratiName: "Select Education",
          id: '',
        ),
      ];
      selectStudyResultLists.addAll(response?.data ?? []);
      update();
    }
  }

  String? selectFullFamilyValue = "";

  List<GetFamilyData> selectFullFamilyLists = [
    GetFamilyData(
      relation: "Select Member",
      id: '',
    ),
  ];

  Future<void> getFullFamily() async {
    var response = await dashboardPresenter.getFullFamily(
      isLoading: true,
    );
    if (response?.data != null) {
      selectFullFamilyLists = [
        GetFamilyData(
          relation: "Select Member",
          id: '',
        ),
      ];

      for (var data in response?.data ?? <GetFamilyData>[]) {
        if (data.relation == "son" || data.relation == "daughter") {
          selectFullFamilyLists.add(data);
        }
      }
      update();
    }
  }

  final pickerProfile = ImagePicker();
  File? imageFile;
  String? profilePic;

  Future uploadResult() async {
    final pickedFile =
        await pickerProfile.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      profilePic = await dashboardPresenter.uploadResult(
        filePath: imageFile?.path ?? "",
        isLoading: true,
      );
    }
    update();
  }

  String? selectValue = "ધોરણ 1";

  List<String> categoryGiftLists = [
    "ધોરણ 1",
    "ધોરણ 2",
    "ધોરણ 3",
    "ધોરણ 4",
    "ધોરણ 5",
    "ધોરણ 6",
    "ધોરણ 7",
    "ધોરણ 8",
    "ધોરણ 9",
    "ધોરણ 10",
    "ધોરણ 11 કોમર્સ",
    "ધોરણ 11 સાયન્સ",
    "ધોરણ 11 આર્ટસ",
    "ધોરણ 12 કોમર્સ",
    "ધોરણ 12 સાયન્સ",
    "ધોરણ 12 આર્ટસ",
    // "કોલેજ સેમ-2",
    // "કોલેજ સેમ-4",
    // "કોલેજ સેમ-6",
    // "કોલેજ સેમ-8",
    "બેચલર સેમ 2'",
    "બેચલર સેમ 4",
    "બેચલર સેમ 6",
    "બેચલર સેમ 8",
    "માસ્ટર સેમ 2",
    "માસ્ટર સેમ 4",
    "માસ્ટર સેમ 6",
    "માસ્ટર સેમ 8",
    "Std 1",
    "Std 2",
    "Std 3",
    "Std 4",
    "Std 5",
    "Std 6",
    "Std 7",
    "Std 8",
    "Std 9",
    "Std 10",
    "Std 11 Commerce",
    "Std 11 Science",
    "Std 11 Arts",
    "Std 12 Commerce",
    "Std 12 Science",
    "Std 12 Arts",
    "Bachelor Sem 2",
    "Bachelor Sem 4",
    "Bachelor Sem 6",
    "Bachelor Sem 8",
    "Master Sem 2",
    "Master Sem 4",
    "Master Sem 6",
    "Master Sem 8",
  ];

  List<String> categoryLists = [
    "ધોરણ 1",
    "ધોરણ 2",
    "ધોરણ 3",
    "ધોરણ 4",
    "ધોરણ 5",
    "ધોરણ 6",
    "ધોરણ 7",
    "ધોરણ 8",
    "ધોરણ 9",
    "ધોરણ 10",
    "ધોરણ 11 કોમર્સ",
    "ધોરણ 11 સાયન્સ",
    "ધોરણ 11 આર્ટસ",
    "ધોરણ 12 કોમર્સ",
    "ધોરણ 12 સાયન્સ",
    "ધોરણ 12 આર્ટસ",
    // "કોલેજ સેમ-2",
    // "કોલેજ સેમ-4",
    // "કોલેજ સેમ-6",
    // "કોલેજ સેમ-8",
    "બેચલર સેમ 2'",
    "બેચલર સેમ 4",
    "બેચલર સેમ 6",
    "બેચલર સેમ 8",
    "માસ્ટર સેમ 2",
    "માસ્ટર સેમ 4",
    "માસ્ટર સેમ 6",
    "માસ્ટર સેમ 8",
  ];

  Future<void> postAddResult() async {
    var response = await dashboardPresenter.postAddResult(
        familyMemberId: selectFullFamilyValue ?? "",
        education: selectStudyResult ?? "",
        medium: selectedOption == 1 ? "gujarati" : "english",
        totalMarks: int.parse(totalMarksController.text),
        obtainedMarks: int.parse(obtainedController.text),
        percentage: double.parse(percentController.text),
        result: profilePic ?? "",
        isLoading: true);
    if (response?.status == 200) {
      Get.back();
      getAllResult();
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  int selectedOption = 1;

  TextEditingController searchPresidentController = TextEditingController();
  TextEditingController searchTalukaController = TextEditingController();
  TextEditingController searchVillageController = TextEditingController();

  int selectPage = 0;
  int selectGalleryListPage = 0;
  int selectGalleryPage = 0;

  PagingController<int, CommitteeMemberDocs> pagingCommitteeController =
      PagingController(firstPageKey: 1);

  List<CommitteeMemberDocs> committeeMemberListModel = [];
  int committeeLimit = 10;

  Future<void> postCommitteemembers(pageKey, designation) async {
    var response = await dashboardPresenter.postCommitteemembers(
      page: pageKey,
      limit: committeeLimit,
      search: searchPresidentController.text,
      designation: designation,
    );
    if (response == null) {
      print(null);
    } else {
      if (pageKey == 1) {
        committeeMemberListModel.clear();
        pagingCommitteeController.itemList?.clear();
      }
      committeeMemberListModel = response.data?.docs ?? [];

      final isLastPage = committeeMemberListModel.length < limit;
      if (isLastPage) {
        pagingCommitteeController.appendLastPage(committeeMemberListModel);
      } else {
        var nextPageKey = pageKey + 1;
        pagingCommitteeController.appendPage(
            committeeMemberListModel, nextPageKey);
      }
      update();
    }
  }

  ///---------------------------------------------------- SevakiyPruvuti Screen -------------------------------------------------------------

  String? selectVillageValue = "";

  List<VillageDatum> selectVillageLists = [
    VillageDatum(
      gujaratiName: "Select Village",
      id: '',
    ),
  ];

  Future<void> villagesApi() async {
    var response = await dashboardPresenter.villagesApi(
      search: '',
      isLoading: true,
    );
    if (response != null) {
      selectVillageLists = [
        VillageDatum(
          gujaratiName: "Select Village",
          id: '',
        ),
      ];
      selectVillageLists.addAll(response.data ?? []);
      update();
    }
  }

  String? selectBusinessValue = "";

  List<BusinessCategoriesDatum> selectBusinessLists = [
    BusinessCategoriesDatum(
      gujaratiName: "Select Business",
      id: '',
    ),
  ];

  Future<void> businessCategoriesApi() async {
    var response = await dashboardPresenter.businessCategoriesApi(
      isLoading: true,
    );
    if (response?.status == 200) {
      selectBusinessLists = [
        BusinessCategoriesDatum(
          gujaratiName: "Select Business",
          id: '',
        ),
      ];
      selectBusinessLists.addAll(response?.data ?? []);
      update();
    }
  }

  TextEditingController searchPriceController = TextEditingController();

  List<EducationDatas> educationDataList = [];

  Future<void> postStudiesList() async {
    var response = await dashboardPresenter.postStudiesList(
      search: searchPriceController.text,
      isLoading: true,
    );
    educationDataList.clear();
    if (response?.status == 200) {
      educationDataList = response?.data ?? [];
      update();
    }
  }

  String? selectStudyValue = "";

  List<EducationData> selectStudyLists = [
    EducationData(
      gujaratiName: "Select Education",
      id: '',
    ),
  ];

  Future<void> getStudies() async {
    var response = await dashboardPresenter.getStudies(
      isLoading: true,
    );
    if (response?.status == 200) {
      selectStudyLists = [
        EducationData(
          gujaratiName: "Select Education",
          id: '',
        ),
      ];
      selectStudyLists.addAll(response?.data ?? []);
      update();
    }
  }

  ///---------------------------------------------------- Donor Screen -------------------------------------------------------------

  List<String> donorTitleList = [
    'donor_1'.tr,
    'donor_2'.tr,
  ];

  List<DonarListData> donarList = [];

  Future<void> postDonatorsList() async {
    var response = await dashboardPresenter.postDonatorsList(
      isLoading: true,
    );
    donarList.clear();
    if (response != null) {
      donarList.addAll(response.data ?? []);
      update();
    }
  }

  GetOneDonarData? getOneDonarData = GetOneDonarData();
  String? donarName;
  Future<void> postDonators(fundId) async {
    var response = await dashboardPresenter.postDonators(
      fundId: fundId,
      isLoading: true,
    );
    getOneDonarData = null;
    if (response != null) {
      getOneDonarData = response.data;
      update();
    }
  }

  ////////////////////
  ///////////////////
  ///////////////////

  PagingController<int, GalleryDoc> galleryPagingController =
      PagingController(firstPageKey: 1);

  List<GalleryDoc> galleryListModel = [];
  int galleryLimit = 10;

  Future<void> postGallery(int pageKey, type) async {
    var response = await dashboardPresenter.postGallery(
      page: pageKey,
      limit: galleryLimit,
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        galleryListModel.clear();
        galleryPagingController.itemList?.clear();
      }
      galleryListModel = response.data?.docs ?? [];

      final isLastPage = galleryListModel.length < galleryLimit;
      if (isLastPage) {
        galleryPagingController.appendLastPage(galleryListModel);
      } else {
        var nextPageKey = pageKey + 1;
        galleryPagingController.appendPage(galleryListModel, nextPageKey);
      }
      update();
    }
  }

  PagingController<int, ServiceDoc> servicePagingController =
      PagingController(firstPageKey: 1);

  List<ServiceDoc> serviceListModel = [];

  Future<void> postServiceActivities(int pageKey) async {
    var response = await dashboardPresenter.postServiceActivities(
      page: pageKey,
      limit: 10,
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        serviceListModel.clear();
        servicePagingController.itemList?.clear();
      }
      serviceListModel = response.data?.docs ?? [];

      final isLastPage = serviceListModel.length < 10;
      if (isLastPage) {
        servicePagingController.appendLastPage(serviceListModel);
      } else {
        var nextPageKey = pageKey + 1;
        servicePagingController.appendPage(serviceListModel, nextPageKey);
      }
      update();
    }
  }

  GalleryDoc? galleryDoc = GalleryDoc();

  Future<void> postGetOneGallery(String galleryId) async {
    var response = await dashboardPresenter.postGetOneGallery(
      galleryId: galleryId,
      isLoading: false,
    );
    galleryDoc = null;
    if (response?.data != null) {
      galleryDoc = response?.data;
      update();
    }
  }

  List<AdsListData> adsList = [];

  int selectAds = 0;

  Future<void> getAds() async {
    var response = await dashboardPresenter.getAds(
      isLoading: false,
    );
    adsList.clear();
    if (response != null) {
      adsList.addAll(response.data ?? []);
      update();
      startAutoScroll();
    }
  }

  ////////////////////////
  ///////////////////////
  ///////////////////////
  ///////////////////////
  ///////////////////////
  ///////////////////////
  ///

  TextEditingController searchVillageYadiController = TextEditingController();
  TextEditingController searchVillageYadiListController =
      TextEditingController();

  final ScrollController scrollController = ScrollController();
  List<VillageListDoc> chatGroupMessageList = [];
  VillageListDoc? chatGroupListsDoc = VillageListDoc();

  int pageGroupCount = 1;
  bool isGroupLastPage = false;
  bool isLoading = false;

  Future<void> getAllVillage(int pageKey) async {
    if (pageKey == 1) {
      pageGroupCount = 1;
    }
    var response = await dashboardPresenter.getAllVillage(
      page: pageGroupCount,
      limit: 20,
      search: searchVillageYadiListController.text,
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        isGroupLastPage = false;
        chatGroupMessageList.clear();
      }
      if ((response.data?.docs?.length ?? 0) < 20) {
        isGroupLastPage = true;
        chatGroupMessageList.addAll(response.data?.docs ?? []);
      } else {
        pageGroupCount++;
        chatGroupMessageList.addAll(response.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollController.positions.isNotEmpty) {
          scrollController.jumpTo(0);
        }
      }
    }
    // if (response != null) {
    //   isGroupLastPage = false;
    //   chatGroupMessageList.clear();

    //   if ((response?.data?.docs?.length ?? 0) < 20) {
    //     isGroupLastPage = true;
    //     chatGroupMessageList.addAll(response?.data?.docs ?? []);
    //   } else {
    //     pageGroupCount++;
    //     chatGroupMessageList.addAll(response?.data?.docs ?? []);
    //   }
    //   if (pageKey == 1) {
    //     if (scrollController.positions.isNotEmpty) {
    //       scrollController.jumpTo(0);
    //     }
    //   }
    // }
    update();
  }

  PagingController<int, GetAllUsersDoc> pagingVillageCommitteeController =
      PagingController(firstPageKey: 1);

  List<GetAllUsersDoc> committeeVillageMemberListModel = [];
  int committeeVillageLimit = 10;

  String? villageId;
  String? villageName;

  Future<void> getAllUsersVillage(int pageKey) async {
    var response = await dashboardPresenter.getAllUsers(
      page: pageKey,
      limit: committeeVillageLimit,
      search: searchVillageYadiController.text,
      village: villageId ?? "",
      business: selectBusinessValue ?? "",
      education: selectStudyValue ?? "",
      bloodGroup: selectBloodValue ?? "",
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        committeeVillageMemberListModel.clear();
        pagingVillageCommitteeController.itemList?.clear();
      }
      committeeVillageMemberListModel = response.data?.docs ?? [];

      final isLastPage = committeeVillageMemberListModel.length < limit;
      if (isLastPage) {
        pagingVillageCommitteeController
            .appendLastPage(committeeVillageMemberListModel);
      } else {
        var nextPageKey = pageKey + 1;
        pagingVillageCommitteeController.appendPage(
            committeeVillageMemberListModel, nextPageKey);
      }
      update();
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///
  ///QualifyPrizeScreen///
  ///

  TextEditingController qualifyPrizeController = TextEditingController();
  TextEditingController qualifyStationeryController = TextEditingController();

  PagingController<int, QualifiedPrizeDoc> qualifyPrizeMainPagingController =
      PagingController(firstPageKey: 1);

  List<QualifiedPrizeDoc> qualifyPrizeMainList = [];

  String selectMeduium = "ગુજરાતી";
  List<String> mediumList = ["ગુજરાતી", "અંગ્રેજી"];

  Future<void> postQualifiedPrizesList(int pageKey) async {
    var response = await dashboardPresenter.postQualifiedPrizes(
      page: pageKey,
      limit: qualifyPrizeLimit,
      search: qualifyPrizeController.text,
      education: "",
      medium: selectMeduium == "ગુજરાતી" ? "gujarati" : "english",
      year: selectYear,
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        qualifyPrizeMainList.clear();
        qualifyPrizeMainPagingController.itemList?.clear();
      }
      qualifyPrizeMainList = response.data?.docs ?? [];

      final isLastPage = qualifyPrizeMainList.length < qualifyPrizeLimit;
      if (isLastPage) {
        qualifyPrizeMainPagingController.appendLastPage(qualifyPrizeMainList);
      } else {
        var nextPageKey = pageKey + 1;
        qualifyPrizeMainPagingController.appendPage(
            qualifyPrizeMainList, nextPageKey);
      }
      update();
    }
  }

  List<Student> studentList = [];

  int qualifyPrizeLimit = 10;
  String std = "";
  bool isMedium = false;
  //   "Bachelor Sem 2",
  // "Bachelor Sem 4",
  // "Bachelor Sem 6",
  // "Bachelor Sem 8",
  // "Master Sem 2",
  // "Master Sem 4",
  // "Master Sem 6",
  // "Master Sem 8",

  int selectYear = DateTime.now().year;
  String? education;
  String? educationName;

  PagingController<int, QualifiedPrizeDoc> qualifyStationeryPagingController =
      PagingController(firstPageKey: 1);

  List<QualifiedPrizeDoc> qualifyStationeryList = [];
  int qualifyStationeryLimit = 10;
  String stdStationery = "";
  bool isMediumStationery = false;

  Future<void> postQualifiedStationery(int pageKey) async {
    var response = await dashboardPresenter.postQualifiedStationery(
      page: pageKey,
      limit: qualifyStationeryLimit,
      search: qualifyStationeryController.text,
      education: std == 'ધોરણ 1' || std == 'Std 1'
          ? "std_1"
          : std == 'ધોરણ 2' || std == 'Std 2'
              ? "std_2"
              : std == 'ધોરણ 3' || std == 'Std 3'
                  ? "std_3"
                  : std == 'ધોરણ 4' || std == 'Std 4'
                      ? "std_4"
                      : std == 'ધોરણ 5' || std == 'Std 5'
                          ? "std_5"
                          : std == 'ધોરણ 6' || std == 'Std 6'
                              ? "std_6"
                              : std == 'ધોરણ 7' || std == 'Std 7'
                                  ? "std_7"
                                  : std == 'ધોરણ 8' || std == 'Std 8'
                                      ? "std_8"
                                      : std == 'ધોરણ 9' || std == 'Std 9'
                                          ? "std_9"
                                          : std == 'ધોરણ 10' || std == 'Std 10'
                                              ? "std_10"
                                              : std == 'ધોરણ 11 કોમર્સ' ||
                                                      std == 'Std 11 Commerce'
                                                  ? "std_11_com"
                                                  : std == 'ધોરણ 11 સાયન્સ' ||
                                                          std ==
                                                              'Std 11 Science'
                                                      ? "std_11_sci"
                                                      : std == 'ધોરણ 11 આર્ટસ' ||
                                                              std == 'Std 11'
                                                          ? "std_11_arts"
                                                          : std == 'ધોરણ 12 કોમર્સ' ||
                                                                  std ==
                                                                      'Std 12 Commerce'
                                                              ? "std_12_com"
                                                              : std == 'ધોરણ 12 સાયન્સ' ||
                                                                      std ==
                                                                          'Std 12 Science'
                                                                  ? "std_12_sci"
                                                                  : std == 'ધોરણ 12 આર્ટસ' ||
                                                                          std ==
                                                                              'Std 12 Arts'
                                                                      ? "std_12_arts"
                                                                      : std == 'બેચલર સેમ 2' ||
                                                                              std == 'Bachelor Sem 2'
                                                                          ? "bachelor_sem_2"
                                                                          : std == 'બેચલર સેમ 4' || std == 'Bachelor Sem 4'
                                                                              ? "bachelor_sem_4"
                                                                              : std == 'બેચલર સેમ 6' || std == 'Bachelor Sem 6'
                                                                                  ? "bachelor_sem_6"
                                                                                  : std == 'બેચલર સેમ 8' || std == 'Bachelor Sem 8'
                                                                                      ? "bachelor_sem_8"
                                                                                      : std == 'માસ્ટર સેમ 2' || std == 'Master Sem 2'
                                                                                          ? "master_sem_2"
                                                                                          : std == 'માસ્ટર સેમ 4' || std == 'Master Sem 4'
                                                                                              ? "master_sem_4"
                                                                                              : std == 'માસ્ટર સેમ 6' || std == 'Master Sem 6'
                                                                                                  ? "master_sem_6"
                                                                                                  : "master_sem_8",
      medium: isMediumStationery ? "gujarati" : "english",
      isLoading: false,
    );
    if (response != null) {
      if (pageKey == 1) {
        qualifyStationeryList.clear();
        qualifyStationeryPagingController.itemList?.clear();
      }
      qualifyStationeryList = response.data?.docs ?? [];

      final isLastPage = qualifyStationeryList.length < qualifyStationeryLimit;
      if (isLastPage) {
        qualifyStationeryPagingController.appendLastPage(qualifyStationeryList);
      } else {
        var nextPageKey = pageKey + 1;
        qualifyStationeryPagingController.appendPage(
            qualifyStationeryList, nextPageKey);
      }
      update();
    }
  }

  @override
  void onClose() {
    _autoScrollTimer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
