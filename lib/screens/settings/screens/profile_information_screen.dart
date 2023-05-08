import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/main.dart';
import 'package:socialv/models/woo_commerce/country_model.dart';
import 'package:socialv/screens/profile/components/custom_text.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  String? name;
  String? date;
  String? biography;

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
                  CustomText(label: "Basic Information"),
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
                              CustomText(label: biography ?? ""),
                            ],
                          ),

                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  /*CustomText(label: "Hobbies And Interest"),
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
                              CustomText(label: 'My Hobbies'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Music Brands'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Tv Shows'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Movies'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(label: 'Games'),
                              CustomText(label: 'name'),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  CustomText(label: "SocialNetworks"),
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
                  ),
*/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
