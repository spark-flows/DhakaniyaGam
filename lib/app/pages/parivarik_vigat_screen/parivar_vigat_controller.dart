import 'dart:convert';
import 'dart:io';

import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';

class ParivarikVigatController extends GetxController {
  ParivarikVigatController(this.parivarikVigatPresenter);

  final ParivarikVigatPresenter parivarikVigatPresenter;

  @override
  onInit() {
    getProfileApi();
    businessCategoriesApi();
    getStudies();
    super.onInit();
  }

  GlobalKey<FormState> parivarikKey = GlobalKey<FormState>();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController userFatherController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController mobileOtherController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController farmController = TextEditingController();
  TextEditingController otherBusinessController = TextEditingController();
  TextEditingController businessAddresController = TextEditingController();
  TextEditingController businessDetailsController = TextEditingController();
  TextEditingController marriedDatesController = TextEditingController();
  TextEditingController fatherLawSurnameController = TextEditingController();
  TextEditingController fatherLawNameController = TextEditingController();
  TextEditingController fatherLawFatherNameController = TextEditingController();
  TextEditingController fatherLawVillageNameController =
      TextEditingController();
  TextEditingController fatherLawTalukaController = TextEditingController();
  TextEditingController fatherLawDistrictController = TextEditingController();
  TextEditingController talentController = TextEditingController();
  TextEditingController otherEducationController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime selectedMarriedDate = DateTime.now();

  bool isValid = false;
  var dailcode = '+91';

  bool isMedical = false;
  bool isAyushmanCard = false;
  bool isInsurance = false;

  int selectedOption = 1;

  bool isValidOptional = false;
  var dailCodeOptional = '+91';

  String? selectValue = "All";

  List<String> categoryLists = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];

  String? selectMarried = "હા";

  List<String> selectMarriedList = [
    "હા",
    "ના",
  ];

  String? selectBooldGroup;

  List<String> booldGroupLists = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];

  Future<bool> imagePermissionCheack(BuildContext context) async {
    final status = await Permission.photos.request().isDenied;
    var permanentlyDenied =
        await Permission.photos.request().isPermanentlyDenied;
    final statusCamera = await Permission.camera.request().isDenied;
    var permanentlyDeniedCamera =
        await Permission.camera.request().isPermanentlyDenied;
    if (status ||
        permanentlyDenied ||
        statusCamera ||
        permanentlyDeniedCamera) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "permission_need".tr,
              style: Styles.blackGuj60018,
            ),
            content: Text(
              "permission_msg".tr,
              style: Styles.blackGuj60014,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "allow".tr,
                  style: Styles.redColorGuj60014,
                ),
                onPressed: () async {Navigator.pop(context);
                  await openAppSettings();
                },
              ),
              TextButton(
                child: Text(
                  "deny".tr,
                  style: Styles.blackGuj60014,
                ),
                onPressed: () {Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
      return false;
    } else {
      return true;
    }
  }

  final pickerProfile = ImagePicker();
  String? selectBusinessValue;

  List<BusinessCategoriesDatum> selectBusinessLists = [];

  Future<void> businessCategoriesApi() async {
    var response = await parivarikVigatPresenter.businessCategoriesApi(
      isLoading: true,
    );
    if (response != null) {
      selectBusinessLists.addAll(response.data ?? []);
      update();
    }
  }

  String? selectEducationValue;

  List<EducationData> selectEducationLists = [];

  Future<void> getStudies() async {
    var response = await parivarikVigatPresenter.getStudies(
      isLoading: false,
    );
    if (response != null) {
      selectEducationLists = [];
      selectEducationLists.addAll(response.data!);
      update();
    }
  }

  String? selectDobDate;
  String? selectDomDate;
  GetProfileData? getProfileData = GetProfileData();

  Future<void> getProfileApi() async {
    var response = await parivarikVigatPresenter.getProfileApi(
      isLoading: true,
    );
    if (response?.data != null) {
      getProfileData = response?.data;

      profilePic = getProfileData?.profilePic ?? "";
      surnameController.text = getProfileData?.surname ?? "";
      nameController.text = getProfileData?.name ?? "";
      fatherNameController.text = getProfileData?.fathername ?? "";
      dobController.text = getProfileData?.dob?.isNotEmpty ?? false
          ? Utility.getFormatedDateTime(getProfileData?.dob ?? "")
          : "";
      emailController.text = getProfileData?.email ?? "";
      if (getProfileData?.bloodGroup != "") {
        selectBooldGroup = getProfileData?.bloodGroup ?? "A+";
      } else {
        selectBooldGroup = "A+";
      }
      selectEducationValue = getProfileData?.education?.id;
      otherEducationController.text = getProfileData?.education?.id == "other"
          ? getProfileData?.otherEducation ?? ""
          : "";
      schoolNameController.text = getProfileData?.schoolCollegeName ?? "";
      mobileController.text = getProfileData?.mobile ?? "";
      mobileOtherController.text = getProfileData?.optionalMobile ?? "";
      if (getProfileData?.mobile != "") {
        isValid = true;
      }
      if (getProfileData?.mobile != "") {
        isValidOptional = true;
      }
      dailcode = getProfileData?.countryCode ?? "+91";
      dailCodeOptional = getProfileData?.optionalCountryCode ?? "+91";
      addressController.text = getProfileData?.currentAddress ?? "";
      selectBusinessValue = getProfileData?.business?.id;
      otherBusinessController.text = getProfileData?.business?.id == "other"
          ? getProfileData?.otherBusiness ?? ""
          : "";
      farmController.text = getProfileData?.firmName ?? "";
      businessAddresController.text = getProfileData?.businessAddress ?? "";
      businessDetailsController.text = getProfileData?.businessDetails ?? "";
      marriedDatesController.text = getProfileData?.dob?.isNotEmpty ?? false
          ? Utility.getFormatedDateTime(getProfileData?.dom ?? "")
          : "";
      fatherLawSurnameController.text =
          getProfileData?.fatherInLaw?.surname ?? "";
      fatherLawNameController.text = getProfileData?.fatherInLaw?.name ?? "";
      fatherLawFatherNameController.text =
          getProfileData?.fatherInLaw?.fathername ?? "";
      fatherLawVillageNameController.text =
          getProfileData?.fatherInLaw?.village ?? "";
      fatherLawTalukaController.text =
          getProfileData?.fatherInLaw?.taluka ?? "";
      fatherLawDistrictController.text =
          getProfileData?.fatherInLaw?.district ?? "";

      selectDobDate =
          Utility.getFormatedDateTimeYYYYMMDD(getProfileData?.dob ?? "");
      selectDomDate =
          Utility.getFormatedDateTimeYYYYMMDD(getProfileData?.dom ?? "");

      getProfileData?.mediclaims?.forEach(
        (element) {
          if (element == "મેડિકલેઇમ") {
            isMedical = true;
          } else if (element == "આયુષ્માન કાર્ડ") {
            isAyushmanCard = true;
          } else {
            isInsurance = true;
          }
        },
      );

      update();
    }
  }

  List<String> mediclaimList = [];

  Future<void> setProfile() async {
    mediclaimList = [
      isMedical ? "મેડિકલેઇમ" : "",
      isAyushmanCard ? "આયુષ્માન કાર્ડ" : "",
      isInsurance ? "પ્રધાનમંત્રી જીવન વીમા યોજના" : ""
    ];

    var response = await parivarikVigatPresenter.setProfile(
      surname: surnameController.text,
      name: nameController.text,
      fathername: fatherNameController.text,
      optional_countryCode: dailCodeOptional,
      optional_mobile: mobileOtherController.text,
      email: emailController.text,
      dob: selectDobDate ?? "",
      blood_group: selectBooldGroup ?? "",
      current_address: addressController.text,
      education: selectEducationValue == "other"
          ? "other"
          : selectEducationValue ?? "",
      other_education:
          selectEducationValue == "other" ? otherEducationController.text : "",
      school_college_name: schoolNameController.text,
      business:
          selectBusinessValue == "other" ? "other" : selectBusinessValue ?? "",
      other_business:
          selectBusinessValue != "other" ? "" : otherBusinessController.text,
      firm_name: farmController.text,
      business_address: businessAddresController.text,
      business_details: businessDetailsController.text,
      is_married: selectMarried == "હા" ? true : false,
      dom: selectDomDate ?? "",
      house: selectedOption == 1
          ? "પોતાનું"
          : selectedOption == 2
              ? "ભાડાનું"
              : "અન્ય સ્ત્રોત દ્વારા",
      mediclaims:
          mediclaimList.where((item) => item.trim().isNotEmpty).toList(),
      surnameLaw: fatherLawSurnameController.text,
      nameLaw: fatherLawNameController.text,
      fathernameLaw: fatherLawFatherNameController.text,
      village: fatherLawVillageNameController.text,
      taluka: fatherLawTalukaController.text,
      district: fatherLawDistrictController.text,
      isLoading: true,
    );
    if (response?.statusCode == 200) {
      Get.find<BottomBarController>().getProfileApi();
      Get.offAndToNamed(Routes.bottomBarScreen);
      update();
    } else {
      Utility.errorMessage(
          jsonDecode(response?.data.toString() ?? "")["Message"]);
    }
  }

  File? imageFile;
  String? profilePic;

  Future setProfilePic(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      profilePic = await parivarikVigatPresenter.uploadProfilePic(
        isLoading: true,
        isToken: true,
        mediaFileList: [
          ImageFormData(
            fieldName: "profile_pic",
            filePath: imageFile?.path ?? "",
            mediaType: MediaType.parse(lookupMimeType(imageFile?.path ?? "")!),
          ),
        ],
        token: Get.find<Repository>().getStringValue(LocalKeys.authToken),
      );

      if (profilePic?.isNotEmpty ?? false) {
        Utility.prifilePic = profilePic ?? "";
      }
    }
    Get.forceAppUpdate();
    update();
  }
}
