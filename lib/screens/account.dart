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

  Widget _Button({image, text, tap}){
    return Flexible(
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image( image: NetworkImage(image), width: 50, height: 50,),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
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
          _Button(image: 'http://www.kyosemi.co.jp/mgt/wp-content/uploads/products/kpdg020c/kpdg020c.jpg', text: 'Thông tin', tap: (){ print('print');}),
          _Button(image: 'http://www.kyosemi.co.jp/mgt/wp-content/uploads/products/kpdg020c/kpdg020c.jpg', text: 'Yêu thích', tap: (){}),
          _Button(image: 'http://www.kyosemi.co.jp/mgt/wp-content/uploads/products/kpdg020c/kpdg020c.jpg', text: 'Đã mua', tap: (){}),
          _Button(image: 'http://www.kyosemi.co.jp/mgt/wp-content/uploads/products/kpdg020c/kpdg020c.jpg', text: 'Giao hàng', tap: (){}),
          _Button(image: 'http://www.kyosemi.co.jp/mgt/wp-content/uploads/products/kpdg020c/kpdg020c.jpg', text: 'Đánh giá', tap: (){}),

        ],
      )
    );
  }
}
