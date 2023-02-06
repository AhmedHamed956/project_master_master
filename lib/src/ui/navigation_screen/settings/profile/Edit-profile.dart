import 'dart:developer';
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/Models/getProfile_Model.dart';
import 'package:project/Models/model/location_model.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/appar.dart';
import 'package:project/src/ui/components/component.dart';
import 'package:project/src/ui/location/mapping_set.dart';

import '../../../../../Models/model/user_model.dart';
import '../../../../../generated/l10n.dart';
import '../../../../common/global.dart';

class EditProfile extends StatefulWidget {
  UserModel? model;
  final String? country;
  final String? city;
  final String? street;
  final String? location;

  EditProfile(
      {super.key,
      this.model,
      this.country,
      this.city,
      this.street,
      this.location});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FocusNode _focusNode = new FocusNode();
  FocusNode _focusNode2 = new FocusNode();
  FocusNode _focusNode3 = new FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  File? photo;
  String? uploadImage;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xAFF59B81E),
      Color(0xAFF59B81E),
      Color(0xAFFB0C81F),
    ],
  ).createShader(
    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  LocationModel? _savedLocation;
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.getSavedLocation();
    print(widget.location);
    super.initState();
    nameController.text = widget.model!.name.toString();
    phoneController.text = widget.model!.phone.toString();
    emailController.text = widget.model!.email.toString();

    //Add Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);
    _focusNode3.addListener(_onLoginUserNameFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    bool isTextClear = true;

    return BlocConsumer<HomeCubit, HomeAppState>(listener: (context, state) {
      if (state is GetSavedLocationSuccessStates) {
        _savedLocation = state.model;
      }
      if (state is PostEditProfileSuccessStates) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      index: 4,
                    )));
        print("done");
      }
      if (state is PostEditProfileErrorStates) {
        print("error");
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: mainBackgourndColor,
          appBar: AppBarWidget(
            label: '',
          ),
          body: SingleChildScrollView(
              child: Stack(alignment: Alignment.topCenter, children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 25, left: 26),
                child: Column(children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                            child: uploadImage == null
                                ? SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: widget.model?.avatar == "user.svg"
                                        ? SvgPicture.network(
                                            '$domainlink${widget.model?.avatar}',
                                          )
                                        : Image.network(
                                            '$domainlink${widget.model?.avatar}',
                                          ))
                                : SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.file(photo!))),
                        onTap: () {
                          pickFromGallery();
                        },
                      ),
                      const Icon(
                        Icons.camera_alt_rounded,
                        color: greencolor,
                        size: 30,
                      )
                    ],
                  ),
                  // InkWell(
                  //   child: Container(
                  //       child: uploadImage == null
                  //           ? Container(
                  //               height: 100,
                  //               width: 100,
                  //               child: Image.asset(
                  //                 'assets/icons/Rectangle 5.png',
                  //               ),
                  //             )
                  //           : Container(
                  //               height: 100,
                  //               width: 100,
                  //               child: Image.file(photo))),
                  //   onTap: () {
                  //     pickFromGallery();
                  //   },
                  // ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    children: [
                      Text(
                        S.current.your_information,
                        style: const TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Stack(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: SizedBox(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            // textAlign: TextAlign.right,
                            keyboardType: TextInputType.text,
                            controller: nameController,
                            style: const TextStyle(color: textColor),
                            maxLines: 2,
                            decoration: InputDecoration(
                              suffixIcon: isTextClear == false
                                  ? null
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isTextClear = true;
                                          nameController.clear();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Colors.black,
                                      ),
                                    ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(126, 132, 138, 1),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: textFieldColor, width: 0.0),
                              ),
                            ),
                            focusNode: _focusNode,
                            onChanged: (val) {
                              setState(() {
                                if (nameController.text.isEmpty) {
                                  isTextClear = true;
                                } else {
                                  isTextClear = false;
                                }
                              });
                            },
                          ),
                        )),
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          color: Colors.white,
                          // input outline default seems using 4.0 as padding from their source
                          child: Text(S.current.name,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: _focusNode.hasFocus
                                      ? textfieldLabelcolor
                                      : textfieldLabelcolor)))
                    ])
                  ]),
                  const SizedBox(height: 24),
                  Stack(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: SizedBox(
                            height: 56,
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                                // textAlign: TextAlign.right,
                                keyboardType: TextInputType.text,
                                controller: phoneController,
                                style: const TextStyle(color: textColor),
                                maxLines: 2,
                                decoration: InputDecoration(
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                126, 132, 138, 1))),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: textFieldColor, width: 0.0)),
                                    suffixIcon: isTextClear == false
                                        ? null
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isTextClear = true;
                                                phoneController.clear();
                                              });
                                            },
                                            icon: const Icon(Icons.clear,
                                                color: Colors.black))),
                                focusNode: _focusNode2,
                                onChanged: (val) {
                                  setState(() {
                                    if (phoneController.text.isEmpty) {
                                      isTextClear = true;
                                    } else {
                                      isTextClear = false;
                                    }
                                  });
                                }))),
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          color: Colors.white,
                          // input outline default seems using 4.0 as padding from their source
                          child: Text(S.current.phone_number,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: _focusNode2.hasFocus
                                      ? textfieldLabelcolor
                                      : textfieldLabelcolor)))
                    ])
                  ]),
                  const SizedBox(height: 24),
                  Stack(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: SizedBox(
                            height: 56,
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                                // textAlign: TextAlign.right,
                                keyboardType: TextInputType.text,
                                controller: emailController,
                                style: const TextStyle(color: textColor),
                                maxLines: 2,
                                decoration: InputDecoration(
                                    suffixIcon: isTextClear == false
                                        ? null
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isTextClear = true;
                                                emailController.clear();
                                              });
                                            },
                                            icon: const Icon(Icons.clear,
                                                color: Colors.black)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                126, 132, 138, 1))),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: textFieldColor,
                                            width: 0.0))),
                                focusNode: _focusNode3,
                                onChanged: (val) {
                                  setState(() {
                                    if (emailController.text.isEmpty) {
                                      isTextClear = true;
                                    } else {
                                      isTextClear = false;
                                    }
                                  });
                                }))),
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          color: Colors.white,
                          // input outline default seems using 4.0 as padding from their source
                          child: Text(S.current.email_address,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: _focusNode3.hasFocus
                                      ? textfieldLabelcolor
                                      : textfieldLabelcolor)))
                    ])
                  ]),
                  const SizedBox(height: 25),
                  const Divider(color: dividerColor, thickness: 1),
                  const SizedBox(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.current.location,
                            style: const TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 12),
                        Row(children: [
                          Expanded(
                              child: Text(
                                  _savedLocation?.name ??
                                      S.current.enter_Adresss,
                                  style: const TextStyle(
                                      color: textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                          InkWell(
                              child: Column(children: [
                                Container(
                                    height: 24,
                                    width: 24,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/Vector-9.png')))),
                                const SizedBox(height: 8),
                                Text(S.current.open_map,
                                    style: const TextStyle(
                                        color: button1color,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400))
                              ]),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MappingSet(
                                            mappingset: 'changelocation',
                                            profilemodel: widget.model,
                                            getLocation: true)));
                              })
                        ])
                      ]),
                  const SizedBox(height: 10),
                  const Divider(color: dividerColor, thickness: 1),
                  const SizedBox(height: 10),
                  Text(S.current.delete_profile,
                      style: TextStyle(
                          foreground: Paint()..shader = linearGradient,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 10),

                  ConditionalBuilder(
                      condition: State is! PostEditProfileLoadingState,
                      builder: (context) => SizedBox(
                          width: 378,
                          height: 56,
                          child: ingridentbutton(
                              function: () {
                                HomeCubit.get(context).editProfile(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    avatar: photo?.path,
                                    id: widget.model?.id,
                                    latlong: widget.location);
                              },
                              color1: button1color,
                              color2: button2color,
                              text: S.current.update)),
                      fallback: (context) => const Center(
                          child:
                              CircularProgressIndicator(color: button2color)))
                ]))
          ])));
    });
  }

  void _onLoginUserNameFocusChange() {
    //Force updated once if focus changed
    setState(() {});
  }

  Future pickFromGallery() async {
    if (Platform.isAndroid) {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.photo = imageTemp);
        log(photo!.path.toString());
        uploadImage = photo?.path.toString();
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    } else {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.photo = imageTemp);
        uploadImage = photo?.path.toString();
        log(this.photo.toString());
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }
  }

  @override
  void dispose() {
    //Dispose Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);
    _focusNode3.addListener(_onLoginUserNameFocusChange);

    super.dispose();
  }
}
