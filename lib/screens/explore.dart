import 'package:flutter/material.dart';
import 'package:gtnm/models/app_model.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>{
  String _currentCategory = 'noi bat';

  @override
  void initState() {
    super.initState();
  }

  Stream<bool> _isChangeCategory() async*{
    yield _currentCategory != m_appState.currentCatogary;
    setState((){
      _currentCategory = m_appState.currentCatogary;
    });
  }

  void _load() async{
    print('load ' + _currentCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _isChangeCategory(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError || !snapshot.hasData) return Container();
          if(snapshot.data!) _load();
          return Center(
            child: Text( _currentCategory),
          );
        },
      )
    );
  }
}
