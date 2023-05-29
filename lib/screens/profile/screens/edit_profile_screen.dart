import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/components/file_picker_dialog_component.dart';
import 'package:socialv/components/loading_widget.dart';
import 'package:socialv/main.dart';
import 'package:socialv/models/members/profile_field_model.dart';
import 'package:socialv/network/rest_apis.dart';
import 'package:socialv/screens/profile/components/expansion_body.dart';
import 'package:socialv/screens/profile/screens/personal_detail_form.dart';
import 'package:socialv/screens/settings/screens/profile_information_screen.dart';
import 'package:socialv/utils/app_constants.dart';
import 'package:socialv/utils/cached_network_image.dart';

import '../components/custom_text.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String avatarUrl = appStore.loginAvatarUrl;
  String coverImage = AppImages.profileBackgroundImage;

  List<ProfileFieldModel> fieldList = [];

  bool isCover = false;

  TextEditingController nameCont = TextEditingController();

  FocusNode name = FocusNode();
  FocusNode mentionName = FocusNode();
  FocusNode dOB = FocusNode();
  FocusNode location = FocusNode();
  FocusNode bio = FocusNode();

  File? avatarImage;
  File? cover;

  bool isUpdate = false;

  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
    afterBuildCreated(() {
      init();
    });
  }

  Future<void> init() async {
    getFiledList();

    avatarUrl = appStore.loginAvatarUrl;
    nameCont.text = appStore.loginFullName;
    nameCont.selection = TextSelection.fromPosition(TextPosition(offset: nameCont.text.length));
    setState(() {});

    await getMemberCoverImage(id: appStore.loginUserId).then((value) {
      coverImage = value.first.image.validate();
      isCover = true;
      setState(() {});
    }).catchError((e) {
      coverImage = AppImages.profileBackgroundImage;
      isCover = false;
    });
  }

  Future<void> getFiledList() async {
    appStore.setLoading(true);
    isDetailChange = false;

    await getProfileFields().then((value) {
      fieldList = value;
      setState(() {});
      appStore.setLoading(false);
    }).catchError((e) {
      appStore.setLoading(false);
      toast(e.toString(), print: true);
    });
    setState(() {});
  }

  void update() {
    ifNotTester(() async {
      if (nameCont.text.isNotEmpty && nameCont.text != appStore.loginFullName) {
        appStore.setLoading(true);

        Map request = {"name": nameCont.text};

        await updateLoginUser(request: request).then((value) {
          appStore.setLoginFullName(value.name.validate());
          toast(language.profileUpdatedSuccessfully, print: true);

          if (avatarImage == null && cover == null) {
            appStore.setLoading(false);
            finish(context, true);
          }
        }).catchError((e) {
          appStore.setLoading(false);
          toast(e.toString(), print: true);
        });
      }

      if (avatarImage != null) {
        appStore.setLoading(true);
        await attachMemberImage(id: appStore.loginUserId, image: avatarImage).then((value) {
          init();
          if (cover == null) {
            appStore.setLoading(false);
            finish(context, true);
          }
        }).catchError((e) {
          appStore.setLoading(false);
          toast(language.somethingWentWrong);
        });
      }

      if (cover != null) {
        appStore.setLoading(true);
        await attachMemberImage(id: appStore.loginUserId, image: cover, isCover: true).then((value) {
          LiveStream().emit(OnAddPostProfile);
          appStore.setLoading(false);
          finish(context, true);
        }).catchError((e) {
          appStore.setLoading(false);
          toast(e.toString());
        });
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        finish(context, true);
        return Future.value(true);
      },
      child: Observer(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text(language.editProfile, style: boldTextStyle(size: 20)),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: context.iconColor),
              onPressed: () {
                finish(context, true);
              },
            ),
            // actions: [
            //   TextButton(
            //     onPressed: () async {
            //       if (!appStore.isLoading) update();
            //     },
            //     child: Text(
            //       language.update.capitalizeFirstLetter(),
            //       style: secondaryTextStyle(color: context.primaryColor),
            //     ),
            //   ).paddingSymmetric(vertical: 8, horizontal: 8),
            // ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          cover == null
                              ? cachedImage(
                                  coverImage,
                                  width: context.width(),
                                  height: 220,
                                  fit: BoxFit.cover,
                                ).cornerRadiusWithClipRRectOnly(topLeft: defaultRadius.toInt(), topRight: defaultRadius.toInt())
                              : Image.file(
                                  File(cover!.path.validate()),
                                  width: context.width(),
                                  height: 220,
                                  fit: BoxFit.cover,
                                ).cornerRadiusWithClipRRectOnly(topLeft: defaultRadius.toInt(), topRight: defaultRadius.toInt()),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: GestureDetector(
                              onTap: () async {
                                if (!appStore.isLoading) {
                                  FileTypes? file = await showInDialog(
                                    context,
                                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                                    title: Text(language.chooseAnAction, style: boldTextStyle()),
                                    builder: (p0) {
                                      return FilePickerDialog(isSelected: !isCover);
                                    },
                                  );
                                  if (file != null) {
                                    if (file == FileTypes.CANCEL) {
                                      ifNotTester(() async {
                                        appStore.setLoading(true);
                                        await deleteMemberCoverImage(id: appStore.loginUserId.toInt()).then((value) {
                                          toast(language.coverImageRemovedSuccessfully);
                                          init();
                                        }).catchError((e) {
                                          appStore.setLoading(false);
                                          toast(language.cRemoveCoverImage);
                                        });
                                      });
                                    } else {
                                      cover = await getImageSource(isCamera: file == FileTypes.CAMERA ? true : false);
                                      setState(() {});
                                      appStore.setLoading(false);
                                    }
                                  }
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(color: appColorPrimary, borderRadius: radius(100)),
                                child: Icon(Icons.edit_outlined, color: Colors.white, size: 18),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), shape: BoxShape.circle),
                                  child: avatarImage == null
                                      ? cachedImage(
                                          avatarUrl,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ).cornerRadiusWithClipRRect(100)
                                      : Image.file(
                                          File(avatarImage!.path.validate()),
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ).cornerRadiusWithClipRRect(100),
                                ),
                                Positioned(
                                  bottom: -4,
                                  right: -6,
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (!appStore.isLoading) {
                                        FileTypes? file = await showInDialog(
                                          context,
                                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                                          title: Text(language.chooseAnAction, style: boldTextStyle()),
                                          builder: (p0) {
                                            return FilePickerDialog(isSelected: avatarUrl.contains(AppImages.defaultAvatarUrl));
                                          },
                                        );

                                        if (file != null) {
                                          if (file == FileTypes.CANCEL) {
                                            ifNotTester(() async {
                                              appStore.setLoading(true);
                                              await deleteMemberAvatarImage(id: appStore.loginUserId).then((value) {
                                                avatarUrl = appStore.loginAvatarUrl;
                                                setState(() {});
                                              }).catchError((e) {
                                                appStore.setLoading(false);
                                                toast(language.somethingWentWrong);
                                              });
                                            });
                                          } else {
                                            avatarImage = await getImageSource(isCamera: file == FileTypes.CAMERA ? true : false);
                                            setState(() {});
                                            appStore.setLoading(false);
                                          }
                                        }
                                      }
                                    },
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: appColorPrimary, shape: BoxShape.circle),
                                      child: Icon(Icons.edit_outlined, color: Colors.white, size: 18),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 280,
                    ),
                    50.height,
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,top: 20.0,bottom: 5.0),
                      child: CustomText(label: "Basic Information",fontweight: FontWeight.bold),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(label: 'Username'),
                                Spacer(),
                                Expanded(
                                  child: CustomText(label:appStore.loginName,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(label: 'Full Name'),
                                Spacer(),
                                Expanded(child: CustomText(label: appStore.loginFullName, overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(label: 'Email'),
                                Spacer(),
                                Expanded(child: CustomText(label: appStore.loginEmail, overflow: TextOverflow.ellipsis,)),
                              ],
                            ),

                            SizedBox(height: 10),

                          ],
                        ),
                      ),

                    ),
                    60.height,
                  ],
                ),
              ),
              LoadingWidget().visible(appStore.isLoading).center(),
            ],
          ),
          floatingActionButton: SpeedDial( //Speed dial menu
            icon: Icons.menu, //icon on Floating action button
            activeIcon: Icons.close, //icon when menu is expanded on button
            backgroundColor: context.primaryColor, //background color of button
            foregroundColor: Colors.white, //font color, icon color in button
            activeBackgroundColor: Colors.blueGrey, //background color when menu is expanded
            activeForegroundColor: Colors.white, //button size
            visible: true,
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'), // action when menu opens
            onClose: () => print('DIAL CLOSED'), //action when menu closes

            elevation: 8.0, //shadow elevation of button
            shape: CircleBorder(), //shape of button

            children: [
              SpeedDialChild( //speed dial child
                child: Icon(Icons.edit),
                backgroundColor: context.primaryColor,
                foregroundColor: Colors.white,
                label: 'Edit Information',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {
                  if (!appStore.isLoading)
                    InfoForm().launch(context).then((value) {
                      isUpdate = value;
                    });
                }

              ),
              SpeedDialChild(
                child: Image.asset(ic_profile, height: 18, width: 18, color: context.primaryColor, fit: BoxFit.cover),
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                label: 'Personal Information',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {
                  if (!appStore.isLoading)
                    ProfileDetailScreen().launch(context).then((value) {
                      isUpdate = value;
                    });
                }
              ),

              //add more menu item childs here
            ],
          ),

          /*floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InfoForm(),));
            },
            child: Text('More Information'),
          ),*/

        ),
      ),
    );
  }
}
