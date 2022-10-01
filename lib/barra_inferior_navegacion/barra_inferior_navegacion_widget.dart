import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import '../index.dart';
import 'package:flutter/material.dart';

class BotonBarraNavegacion {
  IconData iconData;
  BotonBarraNavegacion(this.iconData);
}

late List<BotonBarraNavegacion> barradeNavegacion = <BotonBarraNavegacion>[
  BotonBarraNavegacion(Icons.calendar_month),
  BotonBarraNavegacion(Icons.medical_services),
  BotonBarraNavegacion(Icons.add_circle_outline),
  BotonBarraNavegacion(Icons.shopping_cart),
  BotonBarraNavegacion(Icons.person)
];

class BarraInferiorNavegacion extends StatefulWidget {
  const BarraInferiorNavegacion({Key? key}) : super(key: key);

  @override
  State<BarraInferiorNavegacion> createState() =>
      _BarraInferiorNavegacionState();
}

class _BarraInferiorNavegacionState extends State<BarraInferiorNavegacion> {
  int _index = 0;
  final screens = [
    const BuscarEspecialistaWidget(),
    const Home2Widget(),
    const Home2Widget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: CurvedNavigationBar(
            color: HexColor("#7900ff"),
            backgroundColor: Colors.white,
            buttonBackgroundColor: HexColor("b380ff"),
            height: 50,
            animationDuration: const Duration(milliseconds: 200),
            index: _index,
            animationCurve: Curves.bounceInOut,
            onTap: (index) {
              debugPrint("current Index is $index");
              // Por ahora se hace la navegacion directo en barra_inferior_navegacion_widget.
              // Previene ir a la pagina destino si ya estamos en ella
              // if (currentIndex != deltaIndex) {
              //   switch (index) {
              //     case 2:
              //       animacion_hacia_arriba(context, const BuscarEspecialistaWidget());
              //       break;
              //   }
              // }
              setState(() {
                _index = index;
              });
            },
            items: barradeNavegacion
                .map((boton) => Icon(
                      boton.iconData,
                      size: 30,
                      color: Colors.white,
                    ))
                .toList()));
  }
}
