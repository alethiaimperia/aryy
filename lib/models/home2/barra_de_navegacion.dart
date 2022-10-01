import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BotonBarraNavegacion {
  IconData iconData;
  BotonBarraNavegacion(this.iconData);
}

late List<BotonBarraNavegacion> barradeNavegacion = <BotonBarraNavegacion>[
  BotonBarraNavegacion(Icons.calendar_month),
  BotonBarraNavegacion(Icons.medical_services),
  BotonBarraNavegacion(Icons.shopping_cart),
  BotonBarraNavegacion(Icons.person)
];

CurvedNavigationBar GetBarradeNavegacion() {
  return CurvedNavigationBar(
      color: HexColor("#7900ff"),
      backgroundColor: Colors.white,
      buttonBackgroundColor: HexColor("b380ff"),
      height: 50,
      animationDuration: const Duration(milliseconds: 200),
      //index: 2,
      animationCurve: Curves.bounceInOut,
      onTap: (index) {
        debugPrint("current Index is $index");
      },
      items: barradeNavegacion
          .map((boton) => Icon(
                boton.iconData,
                size: 30,
                color: Colors.white,
              ))
          .toList());
}