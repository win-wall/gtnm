import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtnm/models/message_model.dart';

class MessageItem extends StatelessWidget{
  MessageItem({required this.model});
  MessageModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        alignment: model.from == 'supporter'? Alignment.centerLeft : Alignment.centerRight,
        width: double.infinity,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: model.from == 'supporter'? Colors.grey[200] : Colors.blue[50],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(model.content),
        )
      ),
      onTap: (){},
    );
  }
}