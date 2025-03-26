import 'package:flutter/cupertino.dart';
import 'variables.dart';

class Settings extends StatefulWidget {
  final Function(String) onLocationChanged;
  final Function(Color) onColorChanged;
  final Function(Brightness) onChangeMode;
  final Function(bool) onChangeMetric;

  const Settings({
    super.key,
    required this.onLocationChanged,
    required this.onColorChanged,
    required this.onChangeMode,
    required this.onChangeMetric,
  });

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController _locationData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: mode),
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Settings"),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chevron_back, color: darkColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
             
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
