import 'package:flutter/material.dart';
import 'package:learnflutter/components/custom_text_widget.dart';
import 'package:learnflutter/models/theme_services.dart';
import 'package:provider/provider.dart';

class ThemeAnimationScreen extends StatefulWidget {
  const ThemeAnimationScreen({super.key});

  @override
  State<ThemeAnimationScreen> createState() => _ThemeAnimationScreenState();
}

class _ThemeAnimationScreenState extends State<ThemeAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    bool themeServices = context.watch<ThemeServices>().isDarkModeOn;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List "),
        centerTitle: true,
        actions: [
          IconButton(
              iconSize: 40,
              onPressed: () {
                Provider.of<ThemeServices>(context, listen: false)
                    .toggleTheme();
              },
              icon: themeServices
                  ? const Icon(Icons.toggle_on_sharp)
                  : const Icon(
                      Icons.toggle_off_sharp,
                    ))
        ],
      ),
      body: Center(
        child: Container(
          height: screenHeight * 0.7,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 15)
              ],
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: themeServices
                      ? const [
                          Color(0xff94A9ff),
                          Color(0xff6866cc),
                          Color(0xff200f75),
                        ]
                      : const [
                          Color(0Xddfffa66),
                          Color(0xddffa057),
                          Color(0xdd940899)
                        ])),
          child: Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: (screenHeight * 0.7) * 0.45,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: themeServices ? Colors.blueGrey[200] : Colors.white,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: themeServices ? 'Too Dark ?' : 'Too Bright ?',
                      fontStyle: FontStyle.italic,
                      size: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextWidget(
                      text: themeServices ? "Go White!" : "Go Black!",
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    Switch(
                        value: themeServices,
                        onChanged: (_) {
                          Provider.of<ThemeServices>(context, listen: false)
                              .toggleTheme();
                        })
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
