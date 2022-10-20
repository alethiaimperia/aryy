import '../flutter_flow/flutter_flow_widgets.dart';
import './simulacion_api.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

import 'boton_elegir_horario.dart';

enum TipodeEncabezado { diaSemana, fecha }

// Se preparan para poder separarlos por componentes mas tarde

Padding NavigationButton(BuildContext context, IconData icon) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 0,
          buttonSize: 45,
          fillColor: FlutterFlowTheme.of(context).primaryColor,
          icon: Icon(
            icon,
            color: FlutterFlowTheme.of(context).primaryBackground,
            size: 30,
          ),
          onPressed: () {
            print('Nav button pressed ...');
          },
        )
      ],
    ),
  );
}

List<Widget> CitasDelDia(BuildContext context, String title, String subTitle,
    List<APISimulation> citas) {
  return <Widget>[
    TextoEncabezado(context, title, TipodeEncabezado.diaSemana),
    Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: TextoEncabezado(context, subTitle, TipodeEncabezado.fecha),
    ),
    for (var i = 0; i < citas.length; i++) ...[
      BotonElegirHorario(context, citas[i]),
    ]
  ];
}

Text TextoEncabezado(
    BuildContext context, String text, TipodeEncabezado tipodeEncabezado) {
  return Text(
    text,
    style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: tipodeEncabezado == TipodeEncabezado.diaSemana
              ? FontWeight.w600
              : FontWeight.w300,
        ),
  );
}

Padding BotonElegirHorario(BuildContext context, APISimulation cita) {
  return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: FFButtonWidget(
        onPressed: () {
          print('${cita.hora} pressed ...');
        },
        text: cita.hora,
        options: FFButtonOptions(
          width: 90,
          height: 45,
          elevation: 0,
          color: cita.disponibilidad == Disponibilidad.disponible
              ? const Color.fromARGB(255, 245, 237, 255)
              : FlutterFlowTheme.of(context).primaryBackground,
          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Montserrat',
              color: cita.disponibilidad == Disponibilidad.disponible
                  ? FlutterFlowTheme.of(context).primaryColor
                  : FlutterFlowTheme.of(context).primaryText,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              decoration: cita.disponibilidad == Disponibilidad.disponible
                  ? TextDecoration.none
                  : TextDecoration.lineThrough),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
      ));
}
