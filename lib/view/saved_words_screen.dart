import 'package:flutter/material.dart';
import 'package:lab_1/model/lab_words.dart';

class SavedWordsScreen extends StatelessWidget {
  final List<LabWord> savedWords;

  const SavedWordsScreen({Key? key, required this.savedWords}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Words',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body: ListView.builder(
        itemCount: savedWords.length,
        itemBuilder: (context, index) {
          final word = savedWords[index];
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(word.word),
                    content: Text(word.definition),
                  );
                },
              );
            },
            child: ListTile(
              title: Text(word.word),
            ),
          );
        },
      ),
    );
  }
}
