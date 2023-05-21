// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:socialv/main.dart';
// import 'package:socialv/models/woo_commerce/country_model.dart';
// import 'package:socialv/screens/profile/components/custom_text.dart';
// import 'package:socialv/screens/profile/model/profile_info_model.dart';
//
// import '../../../utils/constants.dart';
//
// class InfromationScreen extends StatefulWidget {
//   const InfromationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<InfromationScreen> createState() => _InfromationScreenState();
// }
//
// class _InfromationScreenState extends State<InfromationScreen> {
//   String? name;
//   String? date;
//   String? biography;
//   String? phone;
//   String? email;
//   String? address;
//   String? emergency_contact;
//   String? cnic;
//   String? academic_qualification;
//   String? blood_group;
//   String? nik;
//   String? staffno;
//   String? grading;
//   String? license;
//   String? apes;
//   String? designation;
//   String? joining_date;
//   String? retierment_date;
//   String? utilization_date;
//   String? posting_station;
//   String? qualification;
//   String? company;
//   String? department;
//   String? division;
//   String? section;
//   String? gender;
//
//   String? location;
//
//   String? martialstatus;
//
//   late SharedPreferences prefs;
//
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initial();
//   }
//   void initial() async {
//     prefs = await SharedPreferences.getInstance();
//     setState(() {
//       name = prefs.getString("nameController")!;
//       gender = prefs.getString("gender")!;
//       date = prefs.getString("dateController")!;
//       biography = prefs.getString("biographyController")!;
//       phone = prefs.getString("phoneController")!;
//       location = prefs.getString("location")!;
//       email = prefs.getString("emailController")!;
//       address = prefs.getString("addressController")!;
//       martialstatus = prefs.getString("martial_status")!;
//       emergency_contact = prefs.getString("emergencyContactController")!;
//       cnic = prefs.getString("cnicController")!;
//       academic_qualification = prefs.getString("qualificationController")!;
//       blood_group = prefs.getString("bloodGroupController")!;
//       nik = prefs.getString("nikController")!;
//       staffno = prefs.getString("staffNoController")!;
//       grading = prefs.getString("gradingController")!;
//       license = prefs.getString("licenseController")!;
//       apes = prefs.getString("apesController")!;
//       designation = prefs.getString("de signationController")!;
//       joining_date = prefs.getString("dojController")!;
//       retierment_date = prefs.getString("dorController")!;
//       utilization_date = prefs.getString("douController")!;
//       posting_station = prefs.getString("sopController")!;
//       qualification = prefs.getString("pqController")!;
//       company = prefs.getString("companyController")!;
//       department = prefs.getString("departmentController")!;
//       division = prefs.getString("divController")!;
//       section = prefs.getString("secController")!;
//
//
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(language.personalInfo, style: boldTextStyle(size: 20)),
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: context.iconColor),
//           onPressed: () {
//             finish(context);
//           },
//         ),
//       ),
//
//       body: ListView(
//         children: [
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   CustomText(label: "Basic Information",fontweight: FontWeight.bold),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0,bottom: 20),
//                     child: Container(
//                       color: Colors.grey,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Name'),
//                               SizedBox(width: 100),
//                               CustomText(label:name ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           //TODO check karny k liay comment kia ha
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Gender'),
//                               CustomText(label: gender?? ""),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Birthday'),
//                               SizedBox(width: 100),
//                               CustomText(label: date ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           //TODO check karny k liay comment kia ha
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Location'),
//                               CustomText(label: location ?? ""),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Biography'),
//                               SizedBox(width: 100),
//                               Expanded(
//                                 child: CustomText(label: biography ?? "",
//                                   overflow: TextOverflow.ellipsis,),
//                               ),
//                             ],
//                           ),
//
//                           SizedBox(height: 10),
//                         ],
//                       ),
//                     ),
//                   ),
//                   CustomText(label: "Personal Data",fontweight: FontWeight.bold),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0,bottom: 20),
//                     child: Container(
//                       color: Colors.grey,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Phone'),
//                               SizedBox(width: 100),
//                               CustomText(label: phone ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Email'),
//                               SizedBox(width: 100),
//                               CustomText(label:email ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'address'),
//                               SizedBox(width: 100),
//                               Expanded(child: CustomText(label: address ?? "",
//                                   overflow: TextOverflow.ellipsis)),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'martial status'),
//                               SizedBox(width: 100),
//                               Expanded(child: CustomText(label: martialstatus ?? "",
//                                   overflow: TextOverflow.ellipsis)),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Emergency Contact'),
//                               CustomText(label: emergency_contact ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'CNIC'),
//                               CustomText(label: cnic ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Academic Qualification'),
//                               CustomText(label: academic_qualification ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Blood Group'),
//                               CustomText(label: blood_group ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Next of Kin'),
//                               CustomText(label: nik ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                         ],
//                       ),
//                     ),
//                   ),
//                   CustomText(label: "Professional Information",fontweight: FontWeight.bold),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10.0,bottom: 20),
//                     child: Container(
//                       color: Colors.grey,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Staff No'),
//                               SizedBox(width: 100),
//                               CustomText(label: staffno ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Grading'),
//                               SizedBox(width: 100),
//                               CustomText(label:grading ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'License'),
//                               SizedBox(width: 100),
//                               Expanded(child: CustomText(label: license ?? "",
//                                   overflow: TextOverflow.ellipsis)),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Apes'),
//                               CustomText(label: apes ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Designation'),
//                               CustomText(label: designation ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Date of Joining'),
//                               CustomText(label: joining_date ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Date of Retirement'),
//                               CustomText(label: retierment_date ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Date of Utilization'),
//                               CustomText(label: utilization_date ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Station of posting'),
//                               CustomText(label: posting_station ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Professional Qualification'),
//                               CustomText(label: qualification ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Company'),
//                               CustomText(label: company ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Department'),
//                               CustomText(label: department ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'Division'),
//                               CustomText(label: division ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomText(label: 'section'),
//                               CustomText(label: section ?? "",
//                                   overflow: TextOverflow.ellipsis),
//                             ],
//                           ),
//                           SizedBox(height: 10),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//
//
//     );
//   }
// }

