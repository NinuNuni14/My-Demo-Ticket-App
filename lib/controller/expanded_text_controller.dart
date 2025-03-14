import 'package:get/get.dart';

class ExpandedTextController extends GetxController {
  var isExpaned = false.obs;

  void toggleExpansion() {
    isExpaned.value = !isExpaned.value;
  }
}
