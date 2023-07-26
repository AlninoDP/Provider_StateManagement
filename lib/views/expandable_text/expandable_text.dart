import 'package:flutter/material.dart';
import 'package:learnflutter/components/custom_text_widget.dart';
import 'package:learnflutter/models/theme_services.dart';
import 'package:provider/provider.dart';

class ExpandableTextScreen extends StatelessWidget {
  const ExpandableTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool themeServices = context.watch<ThemeServices>().isDarkModeOn;
    String text =
        'tulisan ini panjang sampai tidak bisa muat dalam empat line, maka dari itu kita gunakan show dialog dan alert box';
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: 'Expandable Text'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Text(
                  text,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: text.length > 108
                    ? ButtonTextCustom(txt: text)
                    : const SizedBox.shrink(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonTextCustom extends StatelessWidget {
  final String txt;
  const ButtonTextCustom({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Full Text'),
                content: Text(txt),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'))
                ],
              );
            });
      },
      child: const Text(
        'Show More...',
        style: TextStyle(fontSize: 15, color: Colors.blue),
      ),
    );
  }
}

class ButtonDialog extends StatelessWidget {
  final String txt;
  const ButtonDialog({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Full Text'),
                  content: Text(txt),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'))
                  ],
                );
              });
        },
        child: const Text('show more'));
  }
}
