import 'package:dd3challenge/presentation/flows/character/character_binding.dart';
import 'package:dd3challenge/presentation/flows/character/character_page.dart';
import 'package:dd3challenge/presentation/flows/home/home_binding.dart';
import 'package:dd3challenge/presentation/flows/home/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = "/home";
  static const character = "/character";

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: character,
      page: () => CharacterPage(),
      binding: CharacterBinding(),
    )
  ];
}
