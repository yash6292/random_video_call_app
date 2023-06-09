import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_video_call_app/Utils/color_utils.dart';
import 'package:random_video_call_app/widgets/launch_url.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10),
          titlePadding: const EdgeInsets.only(top: 15),
          contentPadding: const EdgeInsets.only(top: 10, bottom: 25),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actionsPadding:
              const EdgeInsets.only(right: 15, bottom: 10, left: 15),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800),
                  child: const Text("Yes"),
                ),
                // const Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorUtil.whiteColor),
                  child: const Text("No",
                      style: TextStyle(color: ColorUtil.blackColor)),
                ),
                // const Spacer(),
                ElevatedButton(
                  onPressed: () => launchUrl("https://play.google.com/store/apps/details?id=com.videocall.randomvideocall"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorUtil.whiteColor),
                  child: const Text("Rate Us",
                      style: TextStyle(color: ColorUtil.blackColor)),
                )
              ],
            )
          ],
          title: Column(
            children: [
              Icon(Icons.exit_to_app_rounded,
                  size: 35, color: Colors.red.shade800),
              const SizedBox(height: 5),
              const Text("Are you sure?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content:
              const Text("Do you want to exit?", textAlign: TextAlign.center),
        );
      });
}
