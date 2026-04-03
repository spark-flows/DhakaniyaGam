import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dhakaniya_gam/app/app.dart';
import 'package:dhakaniya_gam/app/navigators/navigators.dart';
import 'package:dhakaniya_gam/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterController extends GetxController {
  RegisterController(this.registerPresenter);

  final RegisterPresenter registerPresenter;

  @override
  void onInit() {
    villagesApi();
    businessCategoriesApi();
    committeeMembersApi();
    super.onInit();
  }

  bool isValid = false;
  var dailcode = '+91';

  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController surnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController otherBusinessController = TextEditingController();

  Future<bool> imagePermissionCheack(BuildContext context) async {
    final status;
    var permanentlyDenied;
    var statusCamera;
    var permanentlyDeniedCamera;
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt < 33) {
        status = await Permission.storage.request().isDenied;
        permanentlyDenied =
            await Permission.storage.request().isPermanentlyDenied;
        statusCamera = await Permission.camera.request().isDenied;
        permanentlyDeniedCamera =
            await Permission.camera.request().isPermanentlyDenied;
      } else {
        status = await Permission.photos.request().isDenied;
        permanentlyDenied =
            await Permission.photos.request().isPermanentlyDenied;
        statusCamera = await Permission.camera.request().isDenied;
        permanentlyDeniedCamera =
            await Permission.camera.request().isPermanentlyDenied;
      }
    } else {
      status = await Permission.photos.request().isDenied;
      permanentlyDenied = await Permission.photos.request().isPermanentlyDenied;
    }
    if (status ||
        permanentlyDenied ||
        statusCamera ||
        permanentlyDeniedCamera) {
      // ignore: use_build_context_synchronously
      Get.dialog(
        AlertDialog(
          backgroundColor: ColorsValue.white,
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
              onPressed: () async {
                Navigator.pop(context);
                await openAppSettings();
              },
            ),
            TextButton(
              child: Text(
                "deny".tr,
                style: Styles.blackGuj60014,
              ),
              onPressed: () {
                Navigator.pop(context);
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

  final pickerProfile = ImagePicker();
  File? imageFile;
  String? profilePic;
  String? frontAdharPic;
  String? backAdharPic;

  Future setProfilePic(ImageSource camera) async {
    final pickedFile = await pickerProfile.pickImage(source: camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      profilePic = await registerPresenter.uploadResiterProfilePic(
          filePath: imageFile?.path ?? "", isLoading: true);
      update();
    }
  }

  Future uploadFrontAdharPic() async {
    final pickedFile =
        await pickerProfile.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      var imageFile = File(pickedFile.path);
      frontAdharPic = await registerPresenter.uploadAdharPic(
          filePath: imageFile.path ?? "", isLoading: true);
      print(frontAdharPic);
    }
    update();
  }

  Future uploadBackAdharPic() async {
    final pickedFile =
        await pickerProfile.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      var imageFile = File(pickedFile.path);
      backAdharPic = await registerPresenter.uploadAdharPic(
          filePath: imageFile.path ?? "");
    }
    update();
  }

  Future<void> registerApi() async {
    var response = await registerPresenter.registerApi(
      profile_pic: profilePic ?? "",
      villageId: selectValue ?? "",
      surname: surnameController.text,
      name: nameController.text,
      fathername: fatherNameController.text,
      countryCode: dailcode,
      mobile: mobileNumberController.text,
      email: emailController.text,
      current_address: addressController.text,
      businessCategoryId: selectBusinessValue ?? "",
      other_business:
          selectBusinessValue != "" ? "" : otherBusinessController.text,
      village_representative: selectCommitteeValue ?? "",
      front_aadhara: frontAdharPic ?? "",
      back_aadhara: backAdharPic ?? "",
    );
    if (response?.data != null) {
      RouteManagement.goToOtpScreen(
          mobileNumberController.text, response?.data?.accessToken ?? "");
    } else {
      // Utility.errorMessage(response?.message ?? "");
    }
  }

  String? selectValue = "";

  bool categorySelect = false;
  List<VillageDatum> categoryLists = [
    VillageDatum(gujaratiName: "ગામનું નામ પસંદ કરો", id: ''),
  ];

  Future<void> villagesApi() async {
    var response = await registerPresenter.villagesApi(
      search: "",
      isLoading: false,
    );
    if (response?.data != null) {
      categoryLists = [
        VillageDatum(gujaratiName: "ગામનું નામ પસંદ કરો", id: '')
      ];
      categoryLists.addAll(response?.data ?? []);
      update();
    }
  }

  String? selectBusinessValue = "";

  List<BusinessCategoriesDatum> selectBusinessLists = [
    BusinessCategoriesDatum(
      gujaratiName: "Other",
      id: '',
    ),
  ];

  Future<void> businessCategoriesApi() async {
    var response = await registerPresenter.businessCategoriesApi(
      isLoading: false,
    );
    if (response?.data != null) {
      selectBusinessLists = [
        BusinessCategoriesDatum(
          gujaratiName: "Other",
          id: '',
        ),
      ];
      selectBusinessLists.addAll(response?.data ?? []);
      update();
    }
  }

  String? selectCommitteeValue = "";
  String? fullname = "";

  List<CommitteeMembersDatum> selectCommitteeLists = [
    CommitteeMembersDatum(
      user: CommitteeMembersUser(
        name: 'તમારા ગામ પ્રતિનિધિ પસંદ કરો',
        id: '',
      ),
      id: '',
    ),
  ];

  Future<void> committeeMembersApi() async {
    var response = await registerPresenter.committeeMembersApi(
      isLoading: false,
    );
    if (response?.data != null) {
      selectCommitteeLists = [
        CommitteeMembersDatum(
          user: CommitteeMembersUser(
              name: 'તમારા ગામ પ્રતિનિધિ પસંદ કરો', id: ''),
          id: '',
        ),
      ];
      selectCommitteeLists.addAll(response?.data ?? []);
      print(selectCommitteeLists);
      update();
    }
  }
}
