import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/presentation/core/routes/routes.dart';
import 'package:flutter_map/presentation/core/theme/app_theme.dart';
import 'package:flutter_map/presentation/widgets/custom_animation.dart';

import 'blocs/map_bloc/map_bloc.dart';
import 'blocs/simple_bloc_observer.dart';


void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();

  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.blue
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.grey.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Map',
        // Theme define
        theme: getTheme(context)[AppTheme.Light],
        // Routing
        initialRoute: Routes.map,
        onGenerateRoute: AppRouter.generateRoute,
        builder: EasyLoading.init(),
      ),
    );
  }

  getProviders() {
    var _providers = [
      BlocProvider<MapBloc>(
        create: (context) => MapBloc(),
      ),
    ];
    return _providers;
  }
}
