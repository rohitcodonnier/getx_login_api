import 'package:get/get.dart';

showAppSnackbar(String tittle) {
  return Get.showSnackbar(GetSnackBar(
    message: tittle,
    duration: const Duration(seconds: 3),
  ));
}
