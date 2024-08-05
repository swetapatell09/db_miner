import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:db_miner/screen/db_model/db_model.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class likeController extends GetxController {
  RxList<dbModel> likelist = <dbModel>[].obs;

  Future<void> likeData() async {
    List<dbModel>? l1 = await DBHelper.helper.readQuery();
    likelist.value = l1!;
  }

  Future<void> setwallpapaer(wallpepar) async {
    try {
      var result = await AsyncWallpaper.setWallpaper(
        url: wallpepar,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );
    } on PlatformException {
      var result = 'Failed to get wallpaper.';
    }
  }

  Future<void> setwallpapaer1(wallpepar1) async {
    try {
      var result = await AsyncWallpaper.setWallpaper(
        url: wallpepar1,
        wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );
    } on PlatformException {
      var result = 'Failed to get wallpaper.';
    }
  }
}
