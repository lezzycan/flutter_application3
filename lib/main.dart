import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'route_folder/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ),
      //  home: const SuccessScreen(),
      onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}


  

