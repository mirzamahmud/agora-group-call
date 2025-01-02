import 'package:agora_group_call/view/role/controller/role_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleView extends GetView<RoleController> {
  const RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.group, color: Colors.blue, size: 40),
          ),
          titleSpacing: 12,
          title: const Text(
            'Group Call',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(
              top: 40, start: 20, end: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ====================== middle section =======================================
              Text(
                'Video Calls and Meetings for everyone.',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text:
                        'Contact, collaborate, and celebrate from anywhere with ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                TextSpan(
                    text: 'Group Call.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700))
              ]))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.blue,
          label: const Text(
            'Join',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          icon: const Icon(Icons.videocam_outlined,
              color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
