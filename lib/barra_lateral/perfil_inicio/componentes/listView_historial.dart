import './row_historial.dart';
import '../simulacion_API/simulacionAPI_perfil_inicio.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class HistorialListView extends StatefulWidget {
  HistorialListView(
      {Key? key, required this.title, required this.simulacionDatosAPI})
      : super(key: key);

  final String title;
  final List<Historial> simulacionDatosAPI;

  @override
  State<HistorialListView> createState() => _HistorialListViewState();
}

class _HistorialListViewState extends State<HistorialListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
      ListTile(
        title: Text(widget.title,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Montserrat',
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                )),
        tileColor: const Color(0xFFF5F5F5),
        dense: false,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
      ),
      Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              itemCount: widget.simulacionDatosAPI.length,
              itemBuilder: (BuildContext context, int index) {
                return HistorialRow(
                  data: widget.simulacionDatosAPI[index],
                );
              }))
    ]));
//--------------------------------------------------------------------------------------------------------------------------------------------
  }
}
