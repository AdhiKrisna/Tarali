import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tarali/constants/constant_colors.dart';

import '../../routes/route_name.dart';

class ListDialog{
  static Widget contentDialog({
    required BuildContext context,
    required String imageName,
    required String message,
    required String successLabel,
    required void Function()? onSuccess,
    required String cancelLabel,
    required void Function()? onCancel,
  }){
    AnimationController animatedController =
    AnimationController(
      duration: const Duration(milliseconds: 300), // Animation duration
      vsync: Navigator.of(context), // TickerProvider
    );

    Animation<Offset> offsetAnimation =
    Tween<Offset>(
      begin: const Offset(-1.0, 0.0,), // Start from the left side
      end: Offset
          .zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: animatedController,
      curve: Curves.easeInOut,
    ));

    animatedController.forward();
    return SlideTransition(
      position: offsetAnimation,
      child: AlertDialog(
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.75,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/$imageName.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 16,
                        color: blackText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onCancel,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            ),
                            child: Text(
                              cancelLabel,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                color: lightBlue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onSuccess,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightBlue,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            ),
                            child: Text(
                              successLabel,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget dashboardDialog(BuildContext context){
    AnimationController animatedController =
    AnimationController(
      duration: const Duration(
          milliseconds: 300), // Animation duration
      vsync:
      Navigator.of(context), // TickerProvider
    );

    Animation<Offset> offsetAnimation =
    Tween<Offset>(
      begin: const Offset(
          -1.0, 0.0), // Start from the left side
      end: Offset
          .zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: animatedController,
      curve: Curves.easeInOut,
    ));

    animatedController.forward();
    return SlideTransition(
      position: offsetAnimation,
      child: AlertDialog(
        alignment: Alignment.topLeft,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: SizedBox(
          height:
          MediaQuery.of(context).size.height *
              0.42,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              const Text(
                "Halo,\nAdhi Krisna!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(color: Colors.black),
              ListTile(
                visualDensity: const VisualDensity(
                    vertical: -3),
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.history),
                title: const Text('Riwayat'),
                onTap: () {
                  Get.back();
                  Get.toNamed(RouteName.history);
                },
              ),
              ListTile(
                visualDensity: const VisualDensity(
                    vertical: -3),
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.edit),
                title:
                const Text('Nilai Tes Membaca'),
                onTap: () {
                  Get.back();
                  Get.toNamed(RouteName.toScoringPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}