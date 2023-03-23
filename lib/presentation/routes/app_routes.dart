import 'package:dd3challenge/presentation/flows/home/home_binding.dart';
import 'package:dd3challenge/presentation/flows/home/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = "/home";

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
