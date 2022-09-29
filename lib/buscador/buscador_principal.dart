import '../models/buscador_respuestaApi/RespuestaApi.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

// Factory this class later
class Sugerencias {
  String nombre;
  IconData icono;
  Color colorFondo;
  Sugerencias(this.nombre, this.icono, this.colorFondo);
}

class _HomePageWidgetState extends State<HomePageWidget> {
  ApiCallResponse? apiResult;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? busquedaInputController;
  TextEditingController? ubicacionInputController;

  @override
  void initState() {
    super.initState();
    busquedaInputController = TextEditingController();
    ubicacionInputController = TextEditingController();
  }

  void LlamaAPIBuscador(TextEditingController? textEditingController) async {
    var _shouldSetState = false;
    apiResult = await GetBarraBusquedaCall.call(
      search: textEditingController!.text,
      mod: 'searchmed',
    );
    _shouldSetState = true;
    if ((apiResult?.succeeded ?? true)) {
      final resultSearch =
          getJsonField(apiResult?.jsonBody, r'''$[*]''').toList();
      dataList = resultSearch[1];
//    Convert api response into proper response class
//    respuestaApi = respuestaApiFromJson(getJsonField(apiResult?.jsonBody,r'''$[*]''').toString());
    }
    if (_shouldSetState) setState(() {});
    return;
  }

  @override
  void dispose() {
    busquedaInputController?.dispose();
    ubicacionInputController?.dispose();
    super.dispose();
  }

  // Upon the api call result, style the listView
  late List<Sugerencias> sugerencias = <Sugerencias>[
    new Sugerencias(
        "Especialista", Icons.medical_services_outlined, Color(0xFF7900FF)),
    new Sugerencias("Medicamento", FontAwesomeIcons.pills, Color(0xFF4700FF)),
    new Sugerencias("Síntoma", Icons.saved_search, Color(0xFFB380FF)),
    new Sugerencias("Prueba de triglicéridos", FontAwesomeIcons.microscope,
        Color(0xFF5101CC))
  ];
  // Icons.medical_services_outlined
  int _selectedIndex = 0;
  List<dynamic> dataList = [];
  // Handle Respuesta de la api
  late RespuestaApi respuestaApi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 10, 40, 10),
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0xFFDABFFF),
                                        offset: Offset(0, 0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0xFFF4EDFF),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 2, 10, 0),
                                    child: TextFormField(
                                      controller: busquedaInputController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'busquedaInputController',
                                        Duration(milliseconds: 500),
                                        () async {
                                          LlamaAPIBuscador(
                                              busquedaInputController);
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            'Doctores, medicamentos, estudios y más...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFCCCCCC),
                                              fontWeight: FontWeight.w300,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                        suffixIcon: busquedaInputController!
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  busquedaInputController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 22,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40, 10, 40, 10),
                              child: Container(
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0xFFDABFFF),
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0xFFF4EDFF),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 2, 10, 0),
                                  child: TextFormField(
                                    controller: ubicacionInputController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'ubicacionInputController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Filtra por zona, ciudad, código postal',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFCCCCCC),
                                            fontWeight: FontWeight.w300,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.location_on_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                      suffixIcon: ubicacionInputController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                ubicacionInputController
                                                    ?.clear();
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListTile(
                              title: Text(
                                'Sugerencias',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF999999),
                                    ),
                              ),
                              tileColor: Color(0xFFF5F5F5),
                              dense: false,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            ),
                            Expanded(
                                child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(5),
                              scrollDirection: Axis.vertical,
                              itemCount: dataList?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child: ListTile(
                                        selected: index == _selectedIndex,
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = index;
                                          });
                                        },
                                        leading: CircleAvatar(
                                          backgroundColor:
                                              sugerencias[0].colorFondo,
                                          child: Icon(
                                            sugerencias[0].icono,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: Text(
                                            '${dataList[index]['drnombre'].toString()}'),
                                        subtitle:
                                            Text('${sugerencias[0].nombre}'),
//                                        selected: index == _selectedIndex,
                                      )),
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
