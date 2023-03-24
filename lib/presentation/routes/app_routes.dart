import 'package:dd3challenge/presentation/flows/character/character_binding.dart';
import 'package:dd3challenge/presentation/flows/character/character_page.dart';
import 'package:dd3challenge/presentation/flows/character_list/character_list_binding.dart';
import 'package:dd3challenge/presentation/flows/character_list/character_list_page.dart';
import 'package:dd3challenge/presentation/flows/home/home_binding.dart';
import 'package:dd3challenge/presentation/flows/home/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = "/home";
  static const character = "/character";
  static const characterList = "/character_list";

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
    ),
    GetPage(
      name: characterList,
      page: () => CharacterListPage(),
      binding: CharacterListBinding(),
    )
  ];
}
