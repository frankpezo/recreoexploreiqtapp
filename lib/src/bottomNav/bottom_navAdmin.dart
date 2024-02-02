import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/src/pages/user/favorite_screen.dart';
import 'package:recreoexploreiqtapp/src/pages/user/home_screen.dart';
import 'package:recreoexploreiqtapp/src/pages/user/profile_screen.dart';

class BottomNavUser extends StatefulWidget {
  BottomNavUser({Key? key}) : super(key: key);

  @override
  State<BottomNavUser> createState() => _BottomNavUserState();
}

class _BottomNavUserState extends State<BottomNavUser> {
  //1. Contador que nos permitirá detectar el cambio
  //2.Lista de las páginas del navBar
  int currentIndex = 0;
  List<Widget> pages = [
    HomeUserScreen(),
    FavoriteUserScreen(),
    ProfileUserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //3. Diseño del navBar
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: Offset(8, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF238F8F),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: currentIndex,
            //1.1. El estado que nos permitirá hacer el cambio
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              //4.1. Aquí se producirá el cambio de página y de iconos
              _buildNavItem(
                  Icons.home_outlined, Icons.home, "Inicio", currentIndex == 0),
              _buildNavItem(Icons.favorite_outline, Icons.favorite, "Favoritos",
                  currentIndex == 1),
              _buildNavItem(Icons.person_outline, Icons.person, "Perfil",
                  currentIndex == 2),
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }

//4. Función para que podamos hacer el cambio de icono a la hora de seleccionar uno
  BottomNavigationBarItem _buildNavItem(IconData unselectedIcon,
      IconData selectedIcon, String label, bool isSelected) {
    return BottomNavigationBarItem(
      icon: Icon(isSelected ? selectedIcon : unselectedIcon),
      label: label,
    );
  }
}
