import 'package:flutter/material.dart';
import 'package:taskmanagement/Screens/privacySecurity.dart';

import '../components/upper_header.dart';
import 'MenuPage.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: he * 0.03, right: he * 0.03),
        child: Column(children: [
          upperHeader("Help", context, false, page: const menuPage()),
          SizedBox(
            height: he * 0.042,
          ),
          CustomOption('Report a Problem', Icons.report_gmailerrorred, () {}),
          CustomOption('Account Status', Icons.account_box_outlined, () {}),
          CustomOption('Privacy & Security help', Icons.security, () {}),
          CustomOption(
              'Submit Request', Icons.settings_applications_outlined, () {}),
        ]),
      ),
    ));
  }
}
