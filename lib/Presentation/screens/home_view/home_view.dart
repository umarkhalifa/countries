import 'package:all_countries/Presentation/screens/home_view/home_view_landscape.dart';
import 'package:all_countries/Presentation/screens/home_view/home_view_portrait.dart';
import 'package:flutter/material.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(builder: (_, orientation){
          if (orientation == Orientation.portrait){
            return const HomePortrait();
          }else{
            return const HomeLandscape();
          }
        }),
      ),
    );
  }
}
