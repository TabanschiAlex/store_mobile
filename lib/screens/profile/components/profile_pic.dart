import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:project_cartridje_mobile/config/colors_config.dart';
import 'package:project_cartridje_mobile/controllers/client_controller.dart';

class ProfilePic extends StatelessWidget {
  final ClientController _clientController = Get.find<ClientController>();

  ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/Profile Image.png"),
                ),
                Positioned(
                  right: -16,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: const Color(0xFFF5F6F9),
                      ),
                      onPressed: () {},
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            _clientController.client!.firstname +
                " " +
                _clientController.client!.secondName,
            style: const TextStyle(
                color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      );
    });
  }
}
