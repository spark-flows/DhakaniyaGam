import 'dart:convert';

import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ParivarSabhayVigatController extends GetxController {
  ParivarSabhayVigatController(this.parivarSabhayVigatPresenter);

  final ParivarSabhayVigatPresenter parivarSabhayVigatPresenter;

  @override
  onInit() {
    educationApi();
    businessCategoriesApi();
    getFamilyMembers();

    super.onInit();
  }

  GlobalKey<FormState> memberKey = GlobalKey<FormState>();
  TextEditingController surnameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController memberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController otherBusinessController = TextEditingController();
  TextEditingController marriedDatesController = TextEditingController();
  TextEditingController otherEducationController = TextEditingController();
  TextEditingController busineDetailController = TextEditingController();

  bool isValid = false;
  var dailcode = '+91';

  String? selectRelationValue = "મા";

  List<String> relationLists = [
    "મા",
    "પિતા",
    "પત્ની",
    "બહેન",
    "ભાઈ",
    "દીકરી",
    "દીકરો",
  ];

  String? selectBooldGroup = "A+";
  bool? isEdit = false;

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

  String? selectMarried = "હા";

  List<String> selectMarriedList = [
    "હા",
    "ના",
  ];

  DateTime selectedDate = DateTime.now();
  DateTime selectedMarriedDate = DateTime.now();

  bool isGujarati = false;
  bool isEnglish = false;

  Future<void> postFamilyMembersAdd(familyMemberId) async {
    var response = await parivarSabhayVigatPresenter.postFamilyMembersAdd(
      familyMemberId: familyMemberId,
      surname: surnameController.text,
      name: memberController.text,
      fathername: fatherNameController.text,
      relation: selectRelationValue == "મા"
          ? "mother"
          : selectRelationValue == "પિતા"
              ? "father"
              : selectRelationValue == "પત્ની"
                  ? "wife"
                  : selectRelationValue == "બહેન"
                      ? "sister"
                      : selectRelationValue == "ભાઈ"
                          ? "brother"
                          : selectRelationValue == "દીકરી"
                              ? "daughter"
                              : "son",
      countryCode: dailcode,
      mobile: mobileController.text,
      dob: dobController.text,
      blood_group: selectBooldGroup ?? "",
      education: selectEducationValue ?? "",
      other_education: selectEducationValue?.isNotEmpty ?? false
          ? ""
          : otherEducationController.text,
      school_college_name: schoolNameController.text,
      business: selectBusinessValue ?? "",
      other_business:
          selectBusinessValue != "" ? "" : otherBusinessController.text,
      business_details: busineDetailController.text,
      isLoading: true,
    );
    if (response?.statusCode == 200) {
      getFamilyMembers();
      Get.back();
    } else {
      Utility.errorMessage(
          jsonDecode(response?.data.toString() ?? "")['Message']);
    }
    update();
  }

  List<FamilyMembersDatum> familyMembersList = [];

  Future<void> getFamilyMembers() async {
    var response = await parivarSabhayVigatPresenter.getFamilyMembers(
      isLoading: false,
    );
    familyMembersList.clear();
    if (response != null) {
      familyMembersList.addAll(response.data ?? []);
    }
    update();
  }

  Future<void> postDeleteFamilyMembers(familyMemberId) async {
    var response = await parivarSabhayVigatPresenter.postDeleteFamilyMembers(
      familyMemberId: familyMemberId,
      isLoading: true,
    );
    if (response != null) {}
    update();
  }

  String? selectBusinessValue = "";

  List<BusinessCategoriesDatum> selectBusinessLists = [
    BusinessCategoriesDatum(
      gujaratiName: "Select Business",
      id: '',
    ),
  ];

  Future<void> businessCategoriesApi() async {
    var response = await parivarSabhayVigatPresenter.businessCategoriesApi(
      isLoading: false,
    );
    if (response != null) {
      selectBusinessLists = [
        BusinessCategoriesDatum(
          gujaratiName: "Select Business",
          id: '',
        ),
      ];
      selectBusinessLists.addAll(response.data ?? []);
      update();
    }
  }

  String? selectEducationValue = "";

  List<BusinessCategoriesDatum> selectEducationLists = [
    BusinessCategoriesDatum(
      gujaratiName: "Other",
      id: '',
    ),
  ];

  Future<void> educationApi() async {
    var response = await parivarSabhayVigatPresenter.educationApi(
      isLoading: false,
    );
    if (response != null) {
      selectEducationLists = [
        BusinessCategoriesDatum(
          gujaratiName: "Other",
          id: '',
        ),
      ];
      selectEducationLists.addAll(response.data ?? []);
      update();
    }
  }

  Future<void> getOneFamilyMembers(familyMemberId) async {
    var response = await parivarSabhayVigatPresenter.getOneFamilyMembers(
      familyMemberId: familyMemberId,
      isLoading: true,
    );
    if (response != null) {
      memberController.text = response.data?.name ?? "";
      fatherNameController.text = response.data?.fathername ?? "";
      selectRelationValue = response.data?.relation == "mother"
          ? "મા"
          : response.data?.relation == "father"
              ? "પિતા"
              : response.data?.relation == "wife"
                  ? "પત્ની"
                  : response.data?.relation == "sister"
                      ? "બહેન"
                      : response.data?.relation == "brother"
                          ? "ભાઈ"
                          : response.data?.relation == "daughter"
                              ? "દીકરી"
                              : "દીકરો";
      dailcode = response.data?.countryCode ?? "+91";
      mobileController.text = response.data?.mobile ?? "";
      if (response.data?.mobile != "") {
        isValid = true;
      }
      dobController.text = response.data?.dob ?? "";
      if (response.data?.bloodGroup != "") {
        selectBooldGroup = response.data?.bloodGroup ?? "A+";
      } else {
        selectBooldGroup = "A+";
      }
      selectEducationValue = response.data?.education?.id ?? "";
      schoolNameController.text = response.data?.schoolCollegeName ?? "";
      selectBusinessValue = response.data?.business?.id ?? "";
      otherBusinessController.text =
          selectBusinessValue != "" ? "" : response.data?.otherBusiness ?? "";
      busineDetailController.text = response.data?.businessDetails ?? "";
      // fatherLawSurnameController.text =
      //     response.data?.fatherInLaw?.surname ?? "";
      // fatherLawNameController.text = response.data?.fatherInLaw?.name ?? "";
      // fatherLawFatherNameController.text =
      //     response.data?.fatherInLaw?.fathername ?? "";
      // fatherLawVillageNameController.text =
      //     response.data?.fatherInLaw?.village ?? "";
      // fatherLawTalukaController.text = response.data?.fatherInLaw?.taluka ?? "";
      // fatherLawDistrictController.text =
      //     response.data?.fatherInLaw?.district ?? "";
    }
    update();
  }
}
