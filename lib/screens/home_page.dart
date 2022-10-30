import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/success_page.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
import '../route_folder/route_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? searchTerm;

  void submit() async {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
    final form = formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    try {
      await context.read<AppProvider>().getResult(searchTerm!);
       Navigator.pushNamed(context, RouteName.successpage);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (_) => SuccessScreen()));
    } catch (e) {
      showDialog(
          builder: (_) {
            return AlertDialog(
              content: Text('Something went wrong'),
            );
          },
          context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppProvider>().state;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Search term is required';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      searchTerm = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: appState == AppState.loading ? null : submit,
                      child: Text(
                        appState == AppState.loading
                            ? "Loading.."
                            : 'Get Result',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
