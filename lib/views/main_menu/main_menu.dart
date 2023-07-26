import 'package:flutter/material.dart';
import 'package:learnflutter/components/custom_text_widget.dart';
import 'package:learnflutter/models/count_model.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountModel>(builder: (context, countModel, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Provider Management (${countModel.count})"),
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
                    child: const Icon(Icons.remove)),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CountModel>(context, listen: false)
                          .increment();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      );
    });
  }
}
