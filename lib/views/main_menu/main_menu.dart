import 'package:flutter/material.dart';
import 'package:learnflutter/components/custom_text_widget.dart';
import 'package:learnflutter/models/count_model.dart';
import 'package:learnflutter/models/theme_services.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    bool themeServices = context.watch<ThemeServices>().isDarkModeOn;
    return Consumer<CountModel>(builder: (context, countModel, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Provider Management (${countModel.count})"),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: CustomTextWidget(
              text: "Counting . . . (${countModel.count})",
              size: 25,
              fontWeight: FontWeight.bold,
              color: countModel.count >= 10 ? Colors.green : Colors.red,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CountModel>(context, listen: false)
                          .decrement();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CountModel>(context, listen: false)
                          .increment();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      );
    });
  }
}
