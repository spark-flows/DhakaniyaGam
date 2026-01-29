import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideshSabhayVigatController extends GetxController {
  VideshSabhayVigatController(this.videshSabhayVigatPresenter);

  final VideshSabhayVigatPresenter videshSabhayVigatPresenter;

  @override
  void onInit() {
    getAllForeigners();
    educationApi();
    businessCategoriesApi();
    getFullFamily();
    super.onInit();
  }

  bool isValid = false;
  var dailcode = '+91';
  bool? isEdit = false;

  GlobalKey<FormState> videshkKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController videshNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController whereFormController = TextEditingController();
  TextEditingController otherBusinessController = TextEditingController();
  TextEditingController otherEducationController = TextEditingController();

  String? selectValue = "education";

  List<String> categoryLists = [
    "education",
    "permanent",
  ];

  String? selectBusinessValue = "";

  List<BusinessCategoriesDatum> selectBusinessLists = [
    BusinessCategoriesDatum(
      gujaratiName: "Other",
      id: '',
    ),
  ];

  Future<void> businessCategoriesApi() async {
    var response = await videshSabhayVigatPresenter.businessCategoriesApi(
      isLoading: false,
    );
    if (response != null) {
      selectBusinessLists = [
        BusinessCategoriesDatum(
          gujaratiName: "Other",
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
    var response = await videshSabhayVigatPresenter.educationApi(
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

  String? selectFullFamilyValue = "";

  List<GetFamilyData> selectFullFamilyLists = [
    GetFamilyData(
      relation: "Select Member",
      id: '',
    ),
  ];

  Future<void> getFullFamily() async {
    var response = await videshSabhayVigatPresenter.getFullFamily(
      isLoading: false,
    );
    if (response != null) {
      selectFullFamilyLists = [
        GetFamilyData(
          relation: "Select Member",
          id: '',
        ),
      ];
      selectFullFamilyLists.addAll(response.data ?? []);
      update();
    }
  }

  List<ForeignersMemberData> foreignersMembersList = [];

  Future<void> getAllForeigners() async {
    var response = await videshSabhayVigatPresenter.getAllForeigners(
      isLoading: false,
    );
    foreignersMembersList.clear();
    if (response != null) {
      foreignersMembersList.addAll(response.data ?? []);
    }
    update();
  }

  Future<void> postDeleteForeigner(foreignerId) async {
    var response = await videshSabhayVigatPresenter.postDeleteForeigner(
      foreignerId: foreignerId,
      isLoading: false,
    );
    if (response != null) {}
    update();
  }

  Future<void> getOneForeigners(foreignerId) async {
    var response = await videshSabhayVigatPresenter.getOneForeigners(
      foreignerId: foreignerId,
      isLoading: true,
    );
    if (response?.data != null) {
      selectFullFamilyValue = response?.data?.familymemberId?.id ?? "";
      dailcode = response?.data?.countryCode ?? "+91";
      mobileController.text = response?.data?.mobile ?? "";
      if (response?.data?.mobile != "") {
        isValid = true;
      }
      selectValue = response?.data?.dataFor ?? "";
      selectEducationValue = response?.data?.education?.id ?? "";
      otherEducationController.text = response?.data?.otherEducation ?? "";
      universityController.text = response?.data?.universityName ?? "";
      selectBusinessValue = response?.data?.business?.id ?? "";
      otherBusinessController.text = response?.data?.otherBusiness ?? "";
      videshNameController.text = response?.data?.country ?? "";
      cityController.text = response?.data?.city ?? "";
      whereFormController.text = response?.data?.from.toString() ?? "";
    }
    update();
  }

  Future<void> postForeignersSave(foreignerId) async {
    var response = await videshSabhayVigatPresenter.postForeignersSave(
      foreignerId: foreignerId,
      familyMemberId: selectFullFamilyValue ?? "",
      countryCode: dailcode,
      mobile: mobileController.text,
      For: selectValue ?? "",
      education: selectEducationValue ?? "",
      other_education: selectEducationValue?.isNotEmpty ?? false
          ? ""
          : otherEducationController.text,
      university_name: universityController.text,
      business: selectBusinessValue ?? "",
      other_business: selectBusinessValue?.isNotEmpty ?? false
          ? ""
          : otherBusinessController.text,
      country: videshNameController.text,
      city: cityController.text,
      from: int.parse(whereFormController.text),
    );
    if (response?.statusCode == 200) {
      getAllForeigners();
      Get.back();
    }
    update();
  }
}
