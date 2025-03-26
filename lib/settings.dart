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
              child: Column(
                children: [
                  //FIRST LINE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CupertinoColors.systemFill,
                              ),
                              child: Icon(
                                CupertinoIcons.location,
                                size: 20,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: darkColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: CupertinoButton(
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text(
                                    "Location",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),

                                  content: Container(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),

                                    child: CupertinoTextField(
                                      placeholder: "Ex. Manila..",
                                      controller: _locationData,
                                    ),
                                  ),

                                  actions: [
                                    CupertinoButton(
                                      child: Text("Save"),
                                      onPressed: () {
                                        setState(() {
                                          widget.onLocationChanged(
                                            _locationData.text,
                                          ); //
                                          citylocation = _locationData.text;
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),

                                    CupertinoButton(
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                          color: CupertinoColors.destructiveRed,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "$citylocation",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: darkColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                CupertinoIcons.chevron_right,
                                size: 20,
                                color: CupertinoColors.systemGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //SECOND LINE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CupertinoColors.systemFill,
                              ),
                              child: Icon(
                                CupertinoIcons.color_filter,
                                size: 20,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Icon",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: darkColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: CupertinoButton(
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  content: CupertinoPicker(
                                    itemExtent: 45,
                                    onSelectedItemChanged: (int index) {
                                      setState(() {
                                        switch (index) {
                                          case 0:
                                            colorIcon =
                                                CupertinoColors.systemPurple;
                                            break;
                                          case 1:
                                            colorIcon =
                                                CupertinoColors.destructiveRed;
                                            break;
                                          case 2:
                                            colorIcon = CupertinoColors.black;
                                            break;
                                          case 3:
                                            colorIcon =
                                                CupertinoColors.systemBlue;
                                            break;
                                          case 4:
                                            colorIcon =
                                                CupertinoColors.activeGreen;
                                            break;
                                          case 5:
                                            colorIcon =
                                                CupertinoColors.activeOrange;
                                            break;
                                          case 6:
                                            colorIcon =
                                                CupertinoColors.systemYellow;
                                            break;
                                          case 7:
                                            colorIcon =
                                                CupertinoColors.systemPink;
                                            break;
                                          case 8:
                                            colorIcon =
                                                CupertinoColors.systemTeal;
                                            break;
                                        }
                                      });
                                    },
                                    children: [
                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Purple",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors
                                                          .systemPurple,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Red",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors.systemRed,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Black",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color: CupertinoColors.black,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Blue",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors
                                                          .systemBlue,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Green",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors
                                                          .activeGreen,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Orange",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors
                                                          .activeOrange,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Yellow",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors
                                                          .systemYellow,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Pink",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors
                                                          .systemPink,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // OPTION END

                                      // OPTION START
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Teal",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      CupertinoColors
                                                          .systemTeal,
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // OPTION END
                                    ],
                                  ),

                                  actions: [
                                    CupertinoButton(
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                          color: CupertinoColors.destructiveRed,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.onColorChanged(colorIcon);
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: colorIcon,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                CupertinoIcons.chevron_right,
                                size: 20,
                                color: CupertinoColors.systemGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //THIRD LINE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CupertinoColors.systemFill,
                              ),
                              child: Icon(
                                CupertinoIcons.thermometer,
                                size: 20,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Celcius °C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: darkColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoSwitch(
                              value: isCelsius,
                              onChanged: (bool value) {
                                setState(() {
                                  isCelsius = value;
                                });
                                widget.onChangeMetric(isCelsius);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //FOURTH LINE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CupertinoColors.systemFill,
                              ),
                              child: Icon(
                                CupertinoIcons.moon_circle,
                                size: 20,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Dark Mode",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: darkColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoSwitch(
                              value: isDark,
                              onChanged: (bool value) {
                                setState(() {
                                  if (value == true) {
                                    mode = Brightness.dark;
                                    darkColor = CupertinoColors.white;
                                  } else {
                                    mode = Brightness.light;
                                    darkColor = CupertinoColors.black;
                                  }
                                  widget.onChangeMode(mode); //
                                  isDark = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //END
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
