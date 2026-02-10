import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/app/pages/sevaoScreen/screens/vagar_vayaj_loan/helper/database_helper.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:dhakaniya_gam/models/child_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class SevaoController extends GetxController {
  SevaoController(this.sevaoPresenter);

  final SevaoPresenter sevaoPresenter;
  var box;
  var boxKutumb;

  @override
  void onInit() async {
    getFullFamily();
    getStudies();
    getScolarshipList();
    box = await Hive.openBox<ChildsModel>('BalkoList');
    boxKutumb = await Hive.openBox<ChildsModel>('kutumb');

    super.onInit();
  }

  GlobalKey<FormState> abhayasKey = GlobalKey<FormState>();
  TextEditingController schoolController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController branchController = TextEditingController();

  String? selectFullFamilyValue = "";

  List<GetFamilyData> selectFullFamilyLists = [
    GetFamilyData(
      name: "Select Member",
      id: '',
    ),
  ];

  Future<void> getFullFamily() async {
    var response = await sevaoPresenter.getFullFamily(
      isLoading: false,
    );
    if (response != null) {
      selectFullFamilyLists = [
        GetFamilyData(
          name: "Select Member",
          id: '',
        ),
      ];
      for (var data in response.data ?? <GetFamilyData>[]) {
        if (data.relation == "daughter") {
          selectFullFamilyLists.add(data);
        }
      }
      update();
    }
  }

  List<ScolarshipsData> scolarshipsList = [];

  Future<void> getScolarshipList() async {
    var response = await sevaoPresenter.getScolarshipList(
      isLoading: true,
    );
    scolarshipsList.clear();
    if (response?.data != null) {
      scolarshipsList.addAll(response?.data ?? []);
    }
    update();
  }

  String? selectsabhy = "All";

  List<String> sabhyList = [
    "All",
    'Test',
  ];

  final pickerProfile = ImagePicker();
  File? imageFile;
  String? feeReceiptPic;

  Future uploadFeeReceipt(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      feeReceiptPic = await sevaoPresenter.uploadDocument(
        filePath: imageFile?.path ?? "",
        isLoading: true,
      );
    }
    update();
  }

  File? passbookFile;
  String? paasbookPic;

  Future uploadPassbook(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      passbookFile = File(pickedFile.path);
      paasbookPic = await sevaoPresenter.uploadDocument(
        filePath: passbookFile?.path ?? "",
        isLoading: true,
      );
    }
    update();
  }

  String? selectCommitteeValue = "";

  List<CommitteeMembersDatum> selectCommitteeLists = [
    CommitteeMembersDatum(
      village: CommitteeMembersVillage(gujaratiName: 'ટેસ્ટિંગ', id: ''),
      id: '',
    ),
  ];

  Future<void> committeeMembersApi() async {
    var response = await sevaoPresenter.committeeMembersApi(
      isLoading: false,
    );
    if (response != null) {
      selectCommitteeLists = [
        CommitteeMembersDatum(
          village: CommitteeMembersVillage(gujaratiName: 'ટેસ્ટિંગ', id: ''),
          id: '',
        ),
      ];
      selectCommitteeLists.addAll(response.data!);
      update();
    }
  }

  File? documentFile;
  String? documentPic;

  Future uploadDocument(
    ImageSource camera,
  ) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      documentFile = File(pickedFile.path);
      documentPic = await sevaoPresenter.uploadDocument(
        filePath: documentFile?.path ?? "",
        isLoading: true,
      );
    }
    update();
  }

  Future<void> addScolarship() async {
    var response = await sevaoPresenter.addScolarship(
      familymember: selectFullFamilyValue ?? "",
      education: educationController.text,
      school_college_name: schoolController.text,
      document: documentPic ?? "",
      fees: int.parse(feeController.text),
      fee_receipt: feeReceiptPic ?? "",
      remark: remarkController.text,
      bank_name: bankNameController.text,
      account_no: accountController.text.isNotEmpty
          ? int.parse(accountController.text)
          : 0,
      branch_name: branchController.text,
      passbook: paasbookPic ?? "",
      committeemember: selectCommitteMembersValue ?? "",
      village_representative: selectVillageMembersValue ?? "",
      isLoading: true,
    );
    scolarshipsList.clear();
    if (response?.data != null) {
      var res = jsonEncode(response?.data);
      Utility.errorMessage(res);
      getScolarshipList();
      Get.offAndToNamed(Routes.sekshanikSahayYojnaScreen);
    }
    update();
  }

  String? selectEducationValue = "";

  List<EducationData> selectEducationLists = [
    EducationData(
      gujaratiName: 'Select Education',
      id: '',
    ),
  ];

  Future<void> getStudies() async {
    var response = await sevaoPresenter.getStudies(
      isLoading: false,
    );
    if (response != null) {
      selectEducationLists = [
        EducationData(
          gujaratiName: 'Select Education',
          id: '',
        ),
      ];
      selectEducationLists.addAll(response.data!);
      update();
    }
  }

  ///=============================================================== VidhvaBenNiVigatScreen ======================================================///

  DateTime selectedDate = DateTime.now();
  DateTime selectedMarriedDate = DateTime.now();

  TextEditingController dobController = TextEditingController();
  TextEditingController ageBalkoController = TextEditingController();
  TextEditingController educationBalkoController = TextEditingController();
  TextEditingController deathYearController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController homeSituationController = TextEditingController();
  TextEditingController feeDeatilController = TextEditingController();
  TextEditingController businessController = TextEditingController();

  bool isValid = false;
  var dailcode = '+91';

  Future<void> getOneFamilyMembers(familyMemberId) async {
    var response = await sevaoPresenter.getOneFamilyMembers(
      familyMemberId: familyMemberId,
      isLoading: true,
    );
    if (response != null) {
      dobController.text = response.data?.dob ?? "";
      selectChildEducationValue = response.data?.education?.id;
      otherChildEducationController.text = response.data?.otherEducation ?? "";
      feeDeatilController.text = "";
      feePic = "";
      // selectMarried = response.data?.isMarried == true ? "હા" : "ના";
      selectBusinessValue = response.data?.business?.id;
      otherChildBusinessController.text = response.data?.otherBusiness ?? "";
    }
    update();
  }

  getAllBalkoList() {
    childList.clear();
    var personsList = box.values.toList();
    childList.addAll(personsList);
    update();
  }

  bool isEdit = false;

  allDataEmptyBalko() {
    selectAddChildValue = "";
    dobController.clear();
    selectChildEducationValue = "";
    otherChildEducationController.clear();
    feeDeatilController.clear();
    feePic = "";
    selectBusinessValue = "";
    otherChildBusinessController.clear();
    ageBalkoController.clear();
    update();
  }

  ///=============================================================== VidhvaSahayYojna ======================================================///

  List<AppliedWindowData> appliedWindowList = [];

  Future<void> getWindowService() async {
    var response = await sevaoPresenter.getWindowService(
      isLoading: false,
    );
    appliedWindowList.clear();
    if (response != null) {
      appliedWindowList.addAll(response.data ?? []);
      update();
    }
  }

  File? profileFile;
  String? profilePic;

  Future uploadProfilePic(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      profileFile = File(pickedFile.path);
      profilePic = await sevaoPresenter.uploadDeathCertificate(
        filePath: pickedFile.path ?? "",
        isLoading: true,
      );
    }
    update();
  }

  File? certificateFile;
  String? certificatePic;

  Future uploadDeathCertificate(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      certificateFile = File(pickedFile.path);
      certificatePic = await sevaoPresenter.uploadDeathCertificate(
        filePath: certificateFile?.path ?? "",
        isLoading: true,
      );
    }
    update();
  }

  String? selectWindowValue = "";

  List<GetFamilyData> selectWindowLists = [
    GetFamilyData(
      relation: "Select Member",
      id: '',
    ),
  ];

  Future<void> getWindow() async {
    var response = await sevaoPresenter.getFullFamily(
      isLoading: false,
    );
    if (response != null) {
      selectWindowLists = [
        GetFamilyData(
          relation: "Select Member",
          id: '',
        ),
      ];
      for (var data in response.data ?? <GetFamilyData>[]) {
        if (data.relation == "wife") {
          selectWindowLists.add(data);
        }
      }
      update();
    }
  }

  String? selectChildValue = "";
  String? memberName = "";
  String? fullMemberName = "";

  List<GetFamilyData> selectChildLists = [
    GetFamilyData(
      relation: "Select Member",
      id: '',
    ),
  ];

  List<ChildModel> childLists = [];
  List<ChildsModel> childList = [];

  Future<void> getChild() async {
    var response = await sevaoPresenter.getFullFamily(
      isLoading: false,
    );
    if (response != null) {
      selectChildLists = [
        GetFamilyData(
          relation: "Select Member",
          id: '',
        ),
      ];
      for (var data in response.data ?? <GetFamilyData>[]) {
        if (data.relation == "son" || data.relation == "daughter") {
          selectChildLists.add(data);
        }
      }
      update();
    }
  }

  String? selectAddChildValue = "";

  List<GetFamilyData> selectAddChildLists = [
    GetFamilyData(
      name: 'Select Member',
      id: '',
    ),
  ];

  Future<void> getAddChild() async {
    var response = await sevaoPresenter.getFullFamily(
      isLoading: false,
    );
    if (response != null) {
      selectAddChildLists = [
        GetFamilyData(
          name: 'Select Member',
          id: '',
        ),
      ];
      for (var data in response.data ?? <GetFamilyData>[]) {
        if (data.relation == "son" || data.relation == "daughter") {
          selectAddChildLists.add(data);
        }
      }
      update();
    }
  }

  String? selectMarried = "હા";

  List<String> selectMarriedList = [
    "હા",
    "ના",
  ];

  String? selectHouse = "પોતાનું";

  List<String> houseList = [
    "પોતાનું",
    'ભાડાનું',
  ];

  String? selectCurrentSituation = "સંયુક્ત કુટુંબ";

  List<String> currentSituationList = [
    "સંયુક્ત કુટુંબ",
    'એકલા',
  ];

  String? selectWindowEducationValue = "";

  List<EducationData> selectWindowEducationLists = [
    EducationData(
      gujaratiName: 'Other',
      id: '',
    ),
  ];

  Future<void> getWindowStudies() async {
    var response = await sevaoPresenter.getStudies(
      isLoading: false,
    );
    if (response != null) {
      selectWindowEducationLists = [
        EducationData(
          gujaratiName: 'Other',
          id: '',
        ),
      ];
      selectWindowEducationLists.addAll(response.data!);
      update();
    }
  }

  DateTime selectedWindowDate = DateTime.now();
  DateTime selectedDodWindowDate = DateTime.now();
  bool isWindowValid = false;
  var dailWindow = '+91';

  GlobalKey<FormState> windowKey = GlobalKey<FormState>();
  TextEditingController dobWindowController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController educationWindowController = TextEditingController();

  TextEditingController dodWindowController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController mobileWindowController = TextEditingController();
  TextEditingController addressWindowController = TextEditingController();
  TextEditingController otherEducationController = TextEditingController();
  TextEditingController otherChildEducationController = TextEditingController();
  TextEditingController otherChildBusinessController = TextEditingController();

  TextEditingController otherFatherNameController = TextEditingController();
  TextEditingController otherVillageController = TextEditingController();

  Future<void> postWindowService() async {
    var response = await sevaoPresenter.postWindowService(
      familymember: selectWindowValue ?? "",
      profile_pic: profilePic ?? "",
      dob: dobWindowController.text,
      education: educationWindowController.text,
      dod: dodWindowController.text,
      death_certificate: certificatePic ?? "",
      countryCode: dailWindow,
      mobile: mobileWindowController.text,
      current_address: addressWindowController.text,
      residential_type: selectHouse ?? "own",
      current_situation: selectCurrentSituation ?? "joint_family",
      income_source: homeSituationController.text,
      childsList: childLists,
      pierreList: Pierre(
          fathername: otherFatherNameController.text,
          village: otherVillageController.text),
      need_help: selectNeedHelp == "હા" ? true : false,
      isLoading: true,
    );
    if (response?.statusCode == 200) {
      Get.offAndToNamed(Routes.sevaoScreen);
      update();
    } else {
      Utility.errorMessage(response?.data ?? "");
    }
  }

  String? selectChildEducationValue = "";

  List<EducationData> selecChildEducationLists = [
    EducationData(
      gujaratiName: 'Other',
      id: '',
    ),
  ];

  Future<void> getChildStudies() async {
    var response = await sevaoPresenter.getStudies(
      isLoading: false,
    );
    if (response != null) {
      selecChildEducationLists = [
        EducationData(
          gujaratiName: 'Other',
          id: '',
        ),
      ];
      selecChildEducationLists.addAll(response.data!);
      update();
    }
  }

  File? imageFeeFile;
  String? feePic;

  Future uploadChildFeeReceipt(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      imageFeeFile = File(pickedFile.path);
      feePic = await sevaoPresenter.uploadDeathCertificate(
        filePath: imageFeeFile?.path ?? "",
        isLoading: true,
      );
    }
    update();
  }

  String? selectBusinessValue = "";

  List<BusinessCategoriesDatum> selectBusinessLists = [
    BusinessCategoriesDatum(
      gujaratiName: "Other",
      id: '',
    ),
  ];

  Future<void> businessCategoriesApi() async {
    var response = await sevaoPresenter.businessCategoriesApi(
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

  String _age = '';

  String calculateAge(date) {
    DateTime tempDate = DateFormat("dd MMM yyyy").parse(date);

    final now = DateTime.now();
    final age = now.year - tempDate.year;
    if (now.month < tempDate.month ||
        (now.month == tempDate.month && now.day < tempDate.day)) {
      _age = (age - 1).toString();
      update();
    } else {
      _age = age.toString();
      update();
    }
    return _age;
  }

  String? selectNeedHelp = "હા";

  List<String> selectNeedHelpList = [
    "હા",
    "ના",
  ];

  ////========================================================== Loan Screen ----------======================

  List<LoanData> loanList = [];
  Future<void> getAllLoan(context) async {
    var response = await sevaoPresenter.getAllLoan(
      isLoading: true,
    );
    loanList.clear();
    if (response != null) {
      loanList.addAll(response.data ?? []);
      showTermsDialog(context);

      update();
    }
  }

  File? rentFile;
  String? rentPic;
  String? rentFileName;

  Future uploadProfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      rentFileName = result.files.first.name;
      rentPic = await sevaoPresenter.uploadProfile(
        filePath: result.files.first.path ?? "",
        isLoading: true,
      );
      update();
    }
    update();
  }

  Future uploadLoan() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      rentFileName = result.files.first.name;
      rentPic = await sevaoPresenter.uploadLoan(
        isLoading: true,
        filePath: result.files.first.path ?? "",
      );
      update();
    }
    update();
  }

  Future<bool> filePickPermissionCheack() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final status;
    var permanentlyDenied;
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      status = await Permission.storage.request().isDenied;
      permanentlyDenied =
          await Permission.storage.request().isPermanentlyDenied;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.version.sdkInt < 33) {
        status = await Permission.storage.request().isDenied;
        permanentlyDenied =
            await Permission.storage.request().isPermanentlyDenied;
      } else {
        status = await Permission.photos.request().isDenied;
        permanentlyDenied =
            await Permission.photos.request().isPermanentlyDenied;
      }
    }
    if (status || permanentlyDenied) {
      Get.dialog(
        AlertDialog(
          title: Text(
            "Permission Needed!",
            style: Styles.black2E363F50018,
          ),
          content: Text(
            "Please give the Storage Permission for uploading the File.",
            style: Styles.redColor50014,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Allow",
                style: Styles.redColor50014,
              ),
              onPressed: () async {
                Get.back();
                await openAppSettings();
              },
            ),
            TextButton(
              child: Text(
                "Deny",
                style: Styles.black2E363F50018,
              ),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  String? selectCategories = "General Fee Seat";

  List<String> selectCategoriesList = [
    "General Fee Seat",
    "Payment Fee Seat",
  ];

  GlobalKey<FormState> vayajKey = GlobalKey<FormState>();
  GlobalKey<FormState> abhayasKarmKey = GlobalKey<FormState>();
  GlobalKey<FormState> studentKey = GlobalKey<FormState>();
  GlobalKey<FormState> rentKey = GlobalKey<FormState>();
  GlobalKey<FormState> kutumbKey = GlobalKey<FormState>();

  TextEditingController currentAddressController = TextEditingController();
  TextEditingController fatherBuisnessController = TextEditingController();
  TextEditingController studentOtherController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController educationStudentController = TextEditingController();
  TextEditingController passYearController = TextEditingController();
  TextEditingController fatherBuisnessAddressController =
      TextEditingController();

  TextEditingController courseNameController = TextEditingController();
  TextEditingController dgreeNameController = TextEditingController();
  TextEditingController courseYearController = TextEditingController();
  TextEditingController courseBranchNameController = TextEditingController();
  TextEditingController courseBranchAddressController = TextEditingController();
  TextEditingController annualSemesterFeeController = TextEditingController();
  TextEditingController brachHostelFeeController = TextEditingController();
  TextEditingController otherExpenseController = TextEditingController();
  TextEditingController totalExpenseController = TextEditingController();
  TextEditingController dobFamilyController = TextEditingController();
  TextEditingController ageFamilyController = TextEditingController();
  TextEditingController enualIncomeController = TextEditingController();
  TextEditingController agriculturalLandController = TextEditingController();
  TextEditingController mamberNameController = TextEditingController();
  TextEditingController otherFamilyController = TextEditingController();
  TextEditingController businessLoanController = TextEditingController();

  final DatabaseHelper dbHelper = DatabaseHelper();

  List<Map<String, dynamic>> notesList = [];
  List<UserModel> list = [];

  Future<void> fetchNotes() async {
    var notes = await dbHelper.getNotes();
    notesList = notes;
    update();
    list.clear();
    for (var i in notesList.asMap().values.toList()) {
      UserModel userModel = UserModel();
      userModel.id = i['id'];
      userModel.name = i['name'];
      userModel.fullName = i['fullName'];
      userModel.relation = i['relation'];
      userModel.businessName = i['businessName'];
      userModel.dob = i['dob'];
      userModel.age = i['age'];
      userModel.total_income = i['total_income'];
      list.add(userModel);
    }
    update();
  }

  Future<void> deleteNote(int selectedId) async {
    await dbHelper.deleteNote(selectedId);
    fetchNotes();
  }

  int? selectedId;

  Future<void> addNote() async {
    var note = {
      'name': selectKutumbValue,
      'fullName': kutumMemberName,
      'relation': relation,
      'businessName': businessLoanController.text,
      'dob': selectDobDate,
      'age': ageFamilyController.text,
      'total_income': enualIncomeController.text,
    };

    if (selectedId == null) {
      await dbHelper.insertNote(note);
    } else {
      await dbHelper.updateNote(selectedId!, note);
      selectedId = null;
    }

    selectKutumbValue = "";
    kutumMemberName = "";
    relation = "";
    selectBusinessValue = "";
    otherFamilyController.clear();
    businessLoanController.clear();
    dobFamilyController.clear();
    ageFamilyController.clear();
    enualIncomeController.clear();
    fetchNotes();
  }

  List<EarningMember> earningMemberList = [];

  Future<void> postLoanApply() async {
    earningMemberList.clear();
    list.map(
      (e) {
        earningMemberList.add(EarningMember(
          familymember: e.name,
          dob: e.dob,
          education: "",
          business: e.businessName,
          annualIncome: int.parse(e.total_income ?? ""),
        ));
      },
    ).toList();

    var response = await sevaoPresenter.postLoanApply(
      isLoading: true,
      familymember: selectChildValue ?? "",
      profile_pic: profilePic ?? "",
      current_address: currentAddressController.text,
      father_business: fatherBuisnessController.text,
      fatherBusinessAddress: fatherBuisnessAddressController.text,
      rent_agreement: rentPic ?? "",
      detailsStudy: educationStudentController.text,
      detailStudyCollageName: schoolNameController.text,
      passing_year: int.parse(passYearController.text),
      result: resultPic ?? "",
      educational: courseNameController.text,
      educationalDegree: dgreeNameController.text,
      duration: int.parse(courseYearController.text),
      educationalSchoolName: courseBranchNameController.text,
      educationalSchoolAddress: courseBranchAddressController.text,
      educationalCategory: selectCategories == "General Fee Seat"
          ? "general_fee_seat"
          : "payment_fee_seat",
      expenseFee: int.parse(annualSemesterFeeController.text),
      expenseFeeRecript: feeReceiptKharachPic ?? "",
      expenseHostelFee: int.parse(brachHostelFeeController.text),
      expenseHostelFeeReceipt: feeReceiptHostelPic ?? "",
      otherExpenses: int.parse(otherExpenseController.text),
      totalExpenses: int.parse(totalExpenseController.text),
      earningMemberList: earningMemberList ?? [],
      areaOfLand: int.parse(agriculturalLandController.text),
    );
    if (response?.statusCode == 200) {
      Get.offAndToNamed(Routes.sevaoScreen);
      update();
    } else {
      Utility.errorMessage(jsonDecode(response?.data ?? "")['Message']);
    }
  }

  DateTime selectedFamilyDate = DateTime.now();
  String? selectDobDate;

  File? resultFile;
  String? resultPic;

  Future uploadResult(imageSource) async {
    final pickedFile = await pickerProfile.pickImage(
      source: imageSource,
    );

    if (pickedFile != null) {
      resultFile = File(pickedFile.path);
      resultPic = await sevaoPresenter.uploadLoan(
        filePath: resultFile?.path ?? "",
      );
    }
    update();
  }

  bool isTrems = false;

  void showTermsDialog(context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: Dimens.edgeInsets20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: ColorsValue.transparent,
                    child: Container(
                      padding: Dimens.edgeInsets20,
                      decoration: BoxDecoration(
                        color: ColorsValue.white,
                        borderRadius: BorderRadius.circular(
                          Dimens.twenty,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "sahay_yojana".tr,
                            style: Styles.mainGuj90020,
                            maxLines: 10,
                          ),
                          Dimens.boxHeight10,
                          Text(
                            "ધંધુકા તાલુકા પટેલ પ્રગતિ મંડળના તેજસ્વી અને આર્થિક રીતે જરૂરીયાત મંદ વિદ્યાર્થીઓનું ઉચ્ચ શિક્ષણ તથા શૈક્ષણિક પ્રગતિ નાંણાકીય સગવડતાનાં અભાવે ન રૂંધાય તે હેતુથી મંડળ તરફથી વગર વ્યાજની સહાય આપવાની આ યોજના છે.",
                            style: Styles.grey9393Guj60014,
                          ),
                          Dimens.boxHeight30,
                          Text(
                            "(૧) શ્રી ધંધુકા તાલુકા પટેલ પ્રગતિ મંડળ સુરતના સભ્ય હોય અને હાલ સુરતમાં રહેતા હોય તેમના બાળકોને જ શૈક્ષણિક સહાય આપવામાં આવશે.\n(૨) જે સભ્ય સુરતમાં રહેવા માટે પોતાનું મકાન કે ફલેટ ધરાવતા ન હોય તે સહાયને પાત્ર રહેશે. (સંયુક્ત કુટુંબમાં રહેતા હોય તો સંયુક્ત સભ્યો પૈકી કોઈપણ સભ્યની માલિકીનું મકાન ધરાવતા ન હોવા જોઈએ.)\n(૩) જે સભ્યની માસિક આવક રૂા.૭૦૦૦ (સાત હજાર) કે તેથી ઓછી હોય તે સહાયને પાત્ર ગણાશે.",
                            style: Styles.grey9393Guj60014,
                          ),
                          Dimens.boxHeight30,
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  fillColor: MaterialStatePropertyAll(
                                    isTrems
                                        ? ColorsValue.maincolor
                                        : ColorsValue.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.five),
                                  ),
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      width: Dimens.one,
                                      color: ColorsValue.maincolor,
                                    ),
                                  ),
                                  value: isTrems,
                                  activeColor: ColorsValue.maincolor,
                                  checkColor: ColorsValue.white,
                                  onChanged: (value) {
                                    setState(() {
                                      isTrems = value!;
                                    });
                                  },
                                ),
                              ),
                              Dimens.boxWidth10,
                              Text(
                                'trem_accept'.tr,
                                style: isTrems
                                    ? Styles.mainGuj80014
                                    : Styles.blackGuj80014,
                              ),
                            ],
                          ),
                          Dimens.boxHeight20,
                          ElevatedButton(
                            onPressed: () {
                              if (isTrems) {Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize:
                                  Size(Dimens.hundredThirty, Dimens.fourty),
                              backgroundColor: isTrems
                                  ? ColorsValue.maincolor
                                  : ColorsValue.lightMainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimens.ten,
                                ),
                              ),
                            ),
                            child: Text(
                              'move_on'.tr,
                              style: Styles.whiteGuj70014,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /////
  ///
  ///
  String? feeReceiptKharachPic;

  Future feeReceipt(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      feeReceiptKharachPic = await sevaoPresenter.uploadLoan(
          filePath: imageFile?.path ?? "", isLoading: true);
    }
    update();
  }

  String? feeReceiptHostelPic;

  Future feeReceiptHostel(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      feeReceiptHostelPic = await sevaoPresenter.uploadLoan(
          filePath: imageFile?.path ?? "", isLoading: true);
    }
    update();
  }

  String? selectKutumbValue = "";
  String relation = "";
  String kutumMemberName = "";

  List<GetFamilyData> selectKutumbLists = [
    GetFamilyData(
      relation: "Select Member",
      id: '',
    ),
  ];

  Future<void> getKutumbFamily() async {
    var response = await sevaoPresenter.getFullFamily(
      isLoading: false,
    );
    if (response != null) {
      selectKutumbLists = [
        GetFamilyData(
          relation: "Select Member",
          id: '',
        ),
      ];
      selectKutumbLists.addAll(response.data ?? []);
    }
    update();
  }

  String? selectCommitteMembersValue = "";

  List<VillageRepresentativesData> selectCommitteMembersLists = [
    VillageRepresentativesData(
      user: User(name: "Select Member"),
      id: '',
    ),
  ];

  Future<void> getCommitteemembers() async {
    var response = await sevaoPresenter.getCommitteemembers(
      isLoading: true,
    );
    if (response != null) {
      selectCommitteMembersLists = [
        VillageRepresentativesData(
          user: User(name: "Select Member"),
          id: '',
        ),
      ];

      selectCommitteMembersLists.addAll(response.data ?? []);

      update();
    }
  }

  String? selectVillageMembersValue = "";

  List<VillageRepresentativesData> selectVillageMembersLists = [
    VillageRepresentativesData(
      user: User(name: "Select Member"),
      id: '',
    ),
  ];

  Future<void> getVillageReMembersApi() async {
    var response = await sevaoPresenter.getCommitteeMembersApi(
      isLoading: true,
    );
    if (response?.data != null) {
      selectVillageMembersLists = [
        VillageRepresentativesData(
          user: User(name: "Select Member"),
          id: '',
        ),
      ];
      selectVillageMembersLists.addAll(response?.data ?? []);

      update();
    }
  }
}
