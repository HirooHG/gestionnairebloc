
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestionnairebloc/router/routes.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomBottomNavBarState();
  }
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          if(value == 0) {
            context.go(Routes.home.path);
          } else {
            context.go(Routes.add.path);
          }

          index = value;
        });
      },
      currentIndex: index,
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "add"
        )
      ],
    );
  }
}
