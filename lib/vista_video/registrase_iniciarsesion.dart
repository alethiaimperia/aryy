import 'package:aryy_version8/flutter_flow/flutter_flow_theme.dart';
import 'package:aryy_version8/flutter_flow/flutter_flow_widgets.dart';
import 'package:aryy_version8/vista_video/video_widget.dart';
//import 'package:connexionvideo/create_login.dart';
//import 'package:connexionvideo/home_signin_widget.dart';
//import 'package:connexionvideo/sign_in.dart';
//import 'package:connexionvideo/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles/my_icons.dart';

class MenuFrame extends StatelessWidget {
  PageController pageController = PageController();
  Duration _animationDuration = Duration(milliseconds: 500);

  void _changePage(int page) {
    pageController.animateToPage(page,
        duration: _animationDuration, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: Stack(
          // 1. Agrego StackFit.expand: una propiedad para expandir los elementos jojo
          fit: StackFit.expand,
          children: <Widget>[
            VideoWidget(),
            Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(22, 500, 22, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ARYY_LOGO_MORADO,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(22, 70, 22, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                Navigator.pushNamed(context, "Registrarse");
                              },
                              text: 'Registrarse',
                              options: FFButtonOptions(
                                width: 300,
                                height: 40,
                                //color: Color(0xFF7900FF),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      //color: Colors.white,
                                      color: Color(0xFF7900FF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(22, 20, 22, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "sesion_huella_dactilar");
                              },
                              text: 'Iniciar sesión',
                              options: FFButtonOptions(
                                width: 300,
                                height: 40,
                                color: Color(0xFF7900FF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
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
            /* Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                SafeArea(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.heartBroken,
                            color: Color.fromRGBO(245, 48, 111, 1.0),
                            size: 60.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'CONN',
                                style: TextStyle(
                                  fontSize: 38.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(245, 48, 111, 1.0),
                                ),
                              ),
                              Text(
                                'EXION',
                                style: TextStyle(
                                  fontSize: 38.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Find and meet people around to find LOVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
                /*Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: <Widget>[
                      HomeSignInWidget(
                        goToPageCallback: (page) {
                          _changePage(page);
                        },
                      ),
                      SignIn(),
                      CreateLogin(
                        cancelBackToHome: () {
                          _changePage(0);
                        },
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
//            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                colors: [
//                  Color.fromRGBO(255, 123, 67, 1.0),
//                  Color.fromRGBO(245, 50, 111, 1.0),
//                ],
          ),
//            ),
//          ),
        ),*/
          ],
        ));
  }
}
