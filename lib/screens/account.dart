import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>{
  @override
  void initState() {
    super.initState();
  }

  Widget _Button({icon, text, tap}){
    return Flexible(
      child: TextButton(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(icon),
              SizedBox(width: 20),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        onPressed: tap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tài Khoản'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('http://www.kyosemi.co.jp/mgt/wp-content/uploads/products/kpdg020c/kpdg020c.jpg'),
                      radius: 25,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'nananananana',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.logout),
                )

              ],
            ),
          ),
          Divider(),
          _Button(icon: Icons.edit, text: 'Thông tin', tap: (){ print('print');}),
          _Button(icon: Icons.favorite, text: 'Yêu thích', tap: (){}),
          _Button(icon: Icons.history, text: 'Đã mua', tap: (){}),
          _Button(icon: Icons.airport_shuttle, text: 'Giao hàng', tap: (){}),
          _Button(icon: Icons.add_comment, text: 'Đánh giá', tap: (){}),

        ],
      )
    );
  }
}
