import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/Screens/Widgets/text_form_field_container.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/auth_controller.dart';
import 'package:gold_crowne/controller/my_account_controller.dart';
import 'package:gold_crowne/models/user_response_model.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyAccount extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  File? imageFile;


  MyAccountController _accountController = Get.put(MyAccountController());
  MyAccount(){
    username.text = _accountController.user.value.name!;
    email.text = _accountController.user.value.email!;
    phoneNumber.text = _accountController.user.value.phoneNo!;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,

        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: primayBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center ,
                    children: [
                      PageTopHeading('MY ACCOUNT'),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                          () => CircleAvatar(
                              radius: 45,
                              foregroundImage: _accountController.state.value == AppState.free ? NetworkImage(_accountController.user.value.profileImageUrl!):
                              imageFile != null?Image.file(imageFile!).image : Image.asset('assets/onboard1.png').image
                                  ,
                            ),
                          ),
                          Transform.translate(
                              offset: Offset(-10, 20),
                              child: GestureDetector(
                                onTap: (){
                                  _showPicker(context);
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  maxRadius: 16,
                                  child: Image.asset(
                                    "assets/edit.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Spacer(),
                      TextFormFieldContainer(TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          contentPadding: hintPadding,
                          hintStyle:
                              Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
                          label: Text(
                            'Name',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          isCollapsed: false,
                          errorStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 11.0, color: Colors.red),
                        ),
                        textInputAction: TextInputAction.next,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white70, fontSize: 14.0),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val){
                          _accountController.user.update((val) {
                            val?.name = username.text;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                      )),
                      TextFormFieldContainer(TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          contentPadding: hintPadding,
                          hintStyle:
                              Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
                          label: Text(
                            'Email',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          isCollapsed: false,
                          errorStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 11.0, color: Colors.red),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white70, fontSize: 14.0),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val){
                          _accountController.user.update((val) {
                            val?.email = email.text;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value.trim())) {
                            return 'please enter correct format';
                          }
                          return null;
                        },
                      )),
                      TextFormFieldContainer(TextFormField(
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          contentPadding: hintPadding,
                          hintStyle:
                              Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
                          label: Text(
                            'Number',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          isCollapsed: false,
                          errorStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 11.0, color: Colors.red),
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white70, fontSize: 14.0),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val){
                          _accountController.user.update((val) {
                            val?.phoneNo = phoneNumber.text;
                          });
                        },
                        validator: (value) {
                          return null;
                        },
                      )),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          if(!formKey.currentState!.validate()){
                            return;
                          }
                          _accountController.updateUser();
                        },
                        child: Text(
                          "Update",
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _showPicker(context) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library',style: TextStyle(color: Colors.black),),
                    onTap: () {
                      _pickImage();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera',style: TextStyle(color: Colors.black)),
                  onTap: () {
                    _pickCameraImage();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<Null> _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      _cropImage();
      _accountController.state.value = AppState.picked;
    }
  }

  Future<Null> _pickCameraImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      _cropImage();
      _accountController.state.value = AppState.picked;
    }
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile!.path,
        maxHeight: 150,
        maxWidth: 150,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],cropStyle: CropStyle.circle,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: primaryColor,
            toolbarWidgetColor: Colors.black,
            backgroundColor:Colors.black,
            activeControlsWidgetColor:primaryColor,
            initAspectRatio: CropAspectRatioPreset.original,
            hideBottomControls: true,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Image',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      _accountController.updateProfilePic(imageFile!);
      _accountController.state.value = AppState.cropped;
    }
  }

  void _clearImage() {
    imageFile = null;
    _accountController.state.value = AppState.free;
  }

}
