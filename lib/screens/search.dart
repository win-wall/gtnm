import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  @override
  void initState() {
    super.initState();
  }

  void _search(String value){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: TextField(
          autofocus: true,
          onSubmitted: _search,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(),
    );
  }
}
