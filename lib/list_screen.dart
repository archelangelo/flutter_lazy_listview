import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _pairList = <WordPair>[WordPair.random()];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _itemFetcher = _ItemFetcher();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _pairList.length,
      itemBuilder: (BuildContext context, int index) {
        // TODO: Display the list items and load more when needed
        return ListTile(
          leading: Text(index.toString(), style: _biggerFont),
          title: Text(_pairList[index].asPascalCase, style: _biggerFont),
        );
      },
    );
  }
}

class _ItemFetcher {
  final _count = 103;
  final _itemsPerPage = 5;
  int _currentPage = 0;

  // This async function simulates fetching results from Internet, etc.
  Future<List<WordPair>> fetch() async {
    final list = <WordPair>[];
    final n = _count - _currentPage * _itemsPerPage;
    await Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < n; i++) {
        list.add(WordPair.random());
      }
    });
    _currentPage++;
    return list;
  }
}