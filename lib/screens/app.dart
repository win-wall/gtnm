import 'package:flutter/material.dart';
import 'package:gtnm/screens/account.dart';
import 'package:gtnm/screens/cart.dart';
import 'package:gtnm/screens/explore.dart';
import 'package:gtnm/screens/home.dart';
import 'package:gtnm/screens/login.dart';
import 'package:gtnm/screens/online_support.dart';
import 'package:gtnm/ultis/global.dart';
import 'package:gtnm/widgets/search_bar.dart';

class AppScreen extends StatefulWidget {
  AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int _currentIndex = 0;


  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _openDrawer(){
    if(!_scaffoldKey.currentState!.isDrawerOpen){
      _scaffoldKey.currentState!.openDrawer();
    }
    else Navigator.pop(context);
  }

  void _selectCategory(String category){
    _openDrawer();
    _tabController.animateTo(1);
    m_app.currentCatogary = category;
  }

  // ignore: non_constant_identifier_names
  Widget _Drawer(){
    return Drawer(
      child: Column(
        children: [
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: _openDrawer,
            ),
            title: Text('Danh Mục'),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: Text('Nổi Bật'),
                  onTap: ()=>_selectCategory('hot'),
                ),
                ListTile(
                  title: Text('Laptop'),
                  onTap: ()=>_selectCategory('laptop'),
                ),
                ListTile(
                  title: Text('Linh kiện PC'),
                  onTap: ()=>_selectCategory('linh kien'),
                ),
                ListTile(
                  title: Text('Màn hình'),
                  onTap: ()=>_selectCategory('man hinh'),
                ),
                ListTile(
                  title: Text('Chuột - Bàn phím'),
                  onTap: ()=>_selectCategory('chuot phim'),
                ),
                ListTile(
                  title: Text('Tai nghe - Loa'),
                  onTap: ()=>_selectCategory('tai loa'),
                ),
                ListTile(
                  title: Text('Console'),
                  onTap: ()=>_selectCategory('console'),
                ),
                ListTile(
                  title: Text('Phụ kiện'),
                  onTap: ()=>_selectCategory('phu kien'),
                ),
                Divider(color: Colors.black26,),
                ListTile(
                  title: Text('Tìm cửa hàng'),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Chính sách'),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Liên hệ'),
                  onTap: (){},
                ),
              ],
            ),
          )
        ],
      )
    );
  }

  Widget _BottomButton({text, icon, onPressed}){
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Tab(
        icon: Icon(icon, color: Colors.white,),
        child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            )
        ),
      ),
    );
  }

  Widget _BottomBar(){
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomButton(
              text: 'Trang Chủ',
              icon: Icons.water_damage,
              onPressed: (){
                _tabController.animateTo(0);
                setState(() {
                  _currentIndex = 0;
                });
              },
          ),
          _BottomButton(
              text: 'Khám Phá',
              icon: Icons.volunteer_activism,
              onPressed: (){
                _tabController.animateTo(1);
                setState(() {
                  _currentIndex = 1;
                });
              },
          ),
          _BottomButton(
            text: 'Tư Vấn',
            icon: Icons.message,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => OnlineSupportScreen()));
            },
          ),
          _BottomButton(
              text: 'Giỏ Hàng',
              icon: Icons.add_shopping_cart,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
              },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      key: _scaffoldKey,
      drawer: _Drawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: _openDrawer,
          icon: Icon(Icons.menu),
        ),
        title: SearchBar(),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications_rounded)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomeScreen(),
                ExploreScreen(),
              ],
            ),
          ),
          _BottomBar(),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
