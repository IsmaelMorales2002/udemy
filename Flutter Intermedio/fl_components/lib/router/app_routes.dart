import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter{

  static const initialRouter = 'home';

  static final menuOptions = <MenuOption>[
    //borrar Home
    //MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home),
    MenuOption(route: 'listview1', name: 'ListViwe Tipo 1', screen: const ListView1Screen(), icon: Icons.list),
    MenuOption(route: 'listview2', name: 'ListView Tipo 2', screen: const ListView2Screen(), icon: Icons.list_alt_outlined),
    MenuOption(route: 'alet', name: 'Alertas -Alert', screen: const AlertScreen(), icon: Icons.notification_add),
    MenuOption(route: 'card', name: 'Tarjetas - Cards', screen: const CardScreen(), icon: Icons.card_travel_sharp),
    MenuOption(route: 'avatar', name: 'Avatar - Circule', screen: const AvatarScreen(), icon: Icons.supervised_user_circle_outlined),
    MenuOption(route: 'animated', name: 'Animated - Container', screen: const AnimatedScreen(), icon: Icons.play_circle_outline),
    MenuOption(route: 'inputs', name: 'Text Inputs', screen: const InputsScreen(), icon: Icons.input_outlined),
    MenuOption(route: 'slider', name: 'Slider && Checks', screen: const SliderScreen(), icon: Icons.sledding_rounded),
    MenuOption(route: 'listviembuilder', name: 'IndinitiSrol & Pull to refresh', screen: const ListViewBuilderScreen(), icon: Icons.build_circle_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes()
  {
     Map<String, Widget Function(BuildContext)> appRoutes={};
     appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route : (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
  /* static Map<String, Widget Function(BuildContext)> routes = {
        'home'     : (BuildContext context) => const HomeScreen(),
        'alet'     : (BuildContext context) => const AlertScreen(),
        'card'     : (BuildContext context) => const CardScreen(),
        'listview1': (BuildContext context) => const ListView1Screen(),
        'listview2': (BuildContext context) => const ListView1Screen(),
      }; */
  
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
          builder: (context) => const ListView1Screen(),
        );
  }

}