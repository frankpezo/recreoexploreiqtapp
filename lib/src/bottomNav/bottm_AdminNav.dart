import 'package:flutter/material.dart';
import 'package:recreoexploreiqtapp/model/empresa_model.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/homeAdmin_screen.dart';
import 'package:recreoexploreiqtapp/src/pages/admin/profileAdmin_screen.dart';

class BottomNavAdmin extends StatefulWidget {
  final EmpresaModel? empresaB;
  final String? emailEmpresa;
  BottomNavAdmin({Key? key, required this.empresaB, this.emailEmpresa})
      : super(key: key);

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {
  //1. Contador que nos permitirá detectar el cambio
  int currentIndex = 0;
  //2. LIsta de las páginas del admin
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();

    pages = [
      HomeAdminScreen(
        empresaH: widget.empresaB,
        emailEA: widget.emailEmpresa,
      ),
      ProfileAdminScreen(
          //empresaP: widget.empresaB,
          ) // Inicializar pages después de que widget.user esté disponible
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //3. Diseño del navBar
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 85, vertical: 50),
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
              _buildNavItem(Icons.home_outlined, Icons.home,
                  "Inicio ${widget.emailEmpresa}", currentIndex == 0),
              _buildNavItem(Icons.person_outline, Icons.person, "Perfil",
                  currentIndex == 1),
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
