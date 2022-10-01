import 'package:aryy_version8/splash_screen.dart';
import 'package:aryy_version8/vista_video/registrase_iniciarsesion.dart';
import 'package:flutter/material.dart';
import 'index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba',
        initialRoute: "splash",
        //initialRoute: "registrarse_iniciosesion",
        routes: {
          "splash": (_) => SplashScreen(),
          "bienvenida": (_) => const HomePageWidget(),
          "iniciarsesion": (_) => const IniciarsesionWidget(),
          "Registrarse": (_) => const RegistrarseWidget(),
          "registrarse_formulario": (_) => const RegistrarseFormularioWidget(),
//          "home2_inicio": (_) => const Home2Widget(),
          "home2_inicio": (_) => const BarraInferiorNavegacion(),
          "buscar_especialista": (_) => const BuscarEspecialistaWidget(),
          "sesion_huella_dactilar": (_) => const SesionHuellaDactilarWidget(),
          "codigo_verificacion": (_) => const CodigoVerificacionWidget(),
          //OPCIONES DE BARRA LATERAL
          "barra_perfil": (_) => const BarraLateralPerfilWidget(),
          "barra_ayuda": (_) => const BarraLateralAyudaWidget(),
          "barra_configuraciones": (_) =>
              const BarraLateralConfiguracionesWidget(),
          "barra_favoritos": (_) => const BarraLateralFavoritosWidget(),
          "barra_metodos": (_) => const BarraLateralMetodopagoWidget(),
          "barra_privacidad": (_) => const BarraLateralPrivacidadWidget(),
          "barra_promociones": (_) => const BarraLateralPromocionesWidget(),
          "barra_recompensas": (_) => const BarraLateralRecompensasWidget(),
          "barra_ubicaciones": (_) => const BarraLateralUbicacionesWidget(),
          "configurar_pin_datos": (_) =>
              const ConfigurarPinDatosbiometricosWidget(),
          "nueva_ubicacion": (_) => const NuevaUbicacionWidget(),
          "olvidaste_contraseña": (_) => const OlvidasteContrasenaWidget(),
          "registrarse_iniciosesion": (_) =>
              MenuFrame(), //VISTA CON VIDEO DE FONDO
        },
        home: SplashScreen());
    //home: MenuFrame());
  }

  static of(BuildContext context) {}
}



/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'aryy-version2',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}*/
