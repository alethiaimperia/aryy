import 'package:flutter/widgets.dart';

// Las animaciones de navegación entre vistas se guardarán aqui.

//
Route animacion_deslizar_arriba(StatefulWidget siguienteVistaWidget) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return siguienteVistaWidget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      // Aqui se define el tipo de animacion entre vistas
      return Align(
        child: SizeTransition(sizeFactor: animation, child: child),
      );
    },
    transitionDuration: const Duration(microseconds: 500),
  );
}
