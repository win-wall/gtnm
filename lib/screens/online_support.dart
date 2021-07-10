import 'package:flutter/material.dart';
import 'package:gtnm/models/message_model.dart';
import 'package:gtnm/widgets/message_item.dart';

class OnlineSupportScreen extends StatefulWidget {
  OnlineSupportScreen({Key? key}) : super(key: key);

  @override
  _OnlineSupportScreenState createState() => _OnlineSupportScreenState();
}

class _OnlineSupportScreenState extends State<OnlineSupportScreen>{
  List<MessageModel> _message = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _message.insert(0, MessageModel(
      content: 'Xin chào, chúng tôi có thể giúp gì cho bạn?', 
      from: 'supporter'));
  }

  void _send(){
    setState(() {
      _message.insert(0, MessageModel(
      content: _textEditingController.text, 
      from: 'user'));
    });
    _textEditingController.clear();
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
            child: ListView(
              reverse: true,
              children: _message.map((mes) {
                return MessageItem(model: mes);
              }).toList(),
            )
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: "Yêu cầu tư vấn ...",
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )),
                IconButton(onPressed: _send, icon: Icon(Icons.send)),
              ],
            ),
          )
        ],
      )
    );
  }
}
