import 'package:flutter/material.dart';
import 'package:lab_1/model/lab_words.dart';
import 'package:lab_1/data/words.dart';

class WordsScreen extends StatefulWidget {
  const WordsScreen({super.key});

  @override
  WordsScreenState createState() => WordsScreenState();
}

class WordsScreenState extends State<WordsScreen> {
  final List<LabWord> savedWords = [];

  Widget _buildList() {
    return ListView(
      children: [
        for (final word in labWords)
          ListTile(
            title: ListTile(
              title: Text(word.word),
              trailing: Icon(
                word.isSaved ? Icons.star : Icons.star_border,
                color: word.isSaved ? Colors.yellow : Colors.grey,
              ),
            ),
            onTap: () {
              setState(
                () {
                  word.isSaved = !word.isSaved;
                  if (word.isSaved) {
                    savedWords.add(word);
                  } else {
                    savedWords.remove(word);
                  }
                },
              );
            },
          ),
      ],
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
                title: const Text(
              'Saved Words',
              style: TextStyle(color: Colors.yellow),
            )),
            body: ListView(
              children: [
                for (final word in savedWords)
                  ListTile(
                    title: Text(word.word),
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
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lab 1 Words",
          style: TextStyle(color: Colors.yellow),
        ),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(
              Icons.list,
              color: Colors.yellow,
            ),
          )
        ],
      ),
      body: _buildList(),
    );
  }
}
