import 'package:flutter/material.dart';

class OnlineSupportScreen extends StatefulWidget {
  OnlineSupportScreen({Key? key}) : super(key: key);

  @override
  _OnlineSupportScreenState createState() => _OnlineSupportScreenState();
}

class _OnlineSupportScreenState extends State<OnlineSupportScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tư Vấn'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Yêu cầu tư vấn ...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )),
                IconButton(onPressed: (){}, icon: Icon(Icons.send)),
              ],
            ),
          )
        ],
      )
    );
  }
}
