import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.done, color: Theme.of(context).primaryColor,size: 96,),
            SizedBox(height: 20,),
            Text('Thanh toán thành công', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text('Tiếp tục mua sắm'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
    );
  }
}