import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:socialv/configs.dart';
import 'package:socialv/main.dart';
import 'package:socialv/screens/profile/components/custom_text.dart';
import 'package:socialv/utils/common.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Links", style: boldTextStyle(size: 20)),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.iconColor),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: (){
                if (!appStore.isLoading) openWebPage(context, url: GOOGLE_URL);
              },
              child: CustomText(label: "https://www.google.com/",fontweight: FontWeight.bold),
          ),
          TextButton(
              onPressed: (){
                if (!appStore.isLoading) openWebPage(context, url: YOUTUBE_URL);
              },
              child: CustomText(label: "https://www.youtube.com/",fontweight: FontWeight.bold),
          ),
          TextButton(
              onPressed: (){
                if (!appStore.isLoading) openWebPage(context, url: SUPPORT_URL);
              },
              child: CustomText(label: "https://iqonic.desky.support",fontweight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
