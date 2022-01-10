// ignore_for_file: file_names

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterNetConn {
  static void checkInternetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      try {
        final result = await InternetAddress.lookup('https://www.google.com/');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        } else {
          Get.snackbar('No Internet!', 'Please check your connection',
              duration: const Duration(seconds: 3),
              icon: const Icon(
                Icons.signal_cellular_connected_no_internet_0_bar_sharp,
              ));
        }
      } on SocketException catch (_) {
        Get.snackbar('No Internet!', 'Please check your connection',
            duration: const Duration(seconds: 3),
            icon: const Icon(
              Icons.signal_cellular_connected_no_internet_0_bar_sharp,
            ));
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      try {
        final result = await InternetAddress.lookup('https://www.google.com/');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        } else {
          Get.snackbar('No Internet!', 'Please check your connection',
              duration: const Duration(seconds: 3),
              icon: const Icon(
                Icons.signal_wifi_connected_no_internet_4_rounded,
              ));
        }
      } on SocketException catch (_) {
        Get.snackbar('No Internet!', 'Please check your connection',
            duration: const Duration(seconds: 3),
            icon: const Icon(
              Icons.signal_wifi_connected_no_internet_4_rounded,
            ));
      }
    } else {
      Get.snackbar(
        'No Internet!',
        'Please check your connection',
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.signal_wifi_connected_no_internet_4_rounded,
        ),
      );
    }
  }
}
