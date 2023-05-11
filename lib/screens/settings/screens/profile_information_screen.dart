import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/main.dart';
import 'package:socialv/models/woo_commerce/country_model.dart';
import 'package:socialv/screens/profile/components/custom_text.dart';

import '../../../utils/constants.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  String? name;
  String? date;
  String? biography;
  String? phone;
  String? email;
  String? address;
  String? emergency_contact;
  String? cnic;
  String? academic_qualification;
  String? blood_group;
  String? nik;

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("nameController")!;
      date = prefs.getString("dateController")!;
      biography = prefs.getString("biographyController")!;
      phone = prefs.getString("phoneController")!;
      email = prefs.getString("emailController")!;
      address = prefs.getString("addressController")!;
      emergency_contact = prefs.getString("emergencyContactController")!;
      cnic = prefs.getString("cnicController")!;
      academic_qualification = prefs.getString("qualificationController")!;
      blood_group = prefs.getString("bloodGroupController")!;
      nik = prefs.getString("nikController")!;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language.personalInfo, style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.iconColor),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(label: "Basic Information",fontweight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                    child: Container(
                      color: Colors.white60,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Name'),
                              SizedBox(width: 100),
                              CustomText(label: name ?? ''),
                            ],
                          ),
                         //TODO check karny k liay comment kia ha
                         /* SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Gender'),
                              CustomText(label: 'name'),
                            ],
                          ),*/
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Birthday'),
                              SizedBox(width: 100),
                              CustomText(label: date ?? ""),
                            ],
                          ),
                          //TODO check karny k liay comment kia ha
                          /*SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Location'),
                              CustomText(label: 'name'),
                            ],
                          ),*/
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Biography'),
                              SizedBox(width: 100),
                              Expanded(
                                child: CustomText(label: biography ?? "",
                                    overflow: TextOverflow.ellipsis,),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  CustomText(label: "Personal Data",fontweight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                    child: Container(
                      color: Colors.white60,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Phone'),
                              SizedBox(width: 100),
                              CustomText(label: phone ?? ""),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Email'),
                              SizedBox(width: 100),
                              CustomText(label: email ?? ''),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'address'),
                              SizedBox(width: 100),
                              Expanded(child: CustomText(label: address ?? '',)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Emergency Contact'),
                              CustomText(label: emergency_contact ?? ''),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Academic Qualification'),
                              CustomText(label: academic_qualification ?? ''),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Blood Group'),
                              CustomText(label: blood_group ?? ''),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Next of Kin'),
                              CustomText(label: nik ?? ''),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  /*CustomText(label: "SocialNetworks"),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 20),
                    child: Container(
                      color: Colors.white60,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'LinkedIn'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Facebook'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Twitter'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
