import 'package:flutter/material.dart';
import 'package:gtnm/screens/search.dart';

class SearchBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10,),
            Text(
              "Search...",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
      },
    );
  }
}