import 'package:quran/model/rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;
  NavItemModel({required this.title, required this.rive});
}

List<NavItemModel> bottonNavItems = [
  NavItemModel(
    title: 'Home',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'HOME',
      stateMachineName: 'HOME_interactivity',
    ),
  ),
  NavItemModel(
    title: 'Star',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'LIKE/STAR',
      stateMachineName: 'STAR_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Timer',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Settings',
    rive: RiveModel(
      src: 'assets/RiveAssets/icons.riv',
      artboard: 'SETTINGS',
      stateMachineName: 'SETTINGS_Interactivity',
    ),
  ),
];
