import 'package:flutter/material.dart';
import 'package:gtnm/models/product_model.dart';
import 'package:gtnm/ultis/global.dart';
import 'package:gtnm/ultis/loadJson.dart';
import 'package:gtnm/widgets/category_item.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with TickerProviderStateMixin{
  String _currentCategory = '';

  List<ProductModel> _products = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();    
    _tabController= TabController(length: 8, vsync: this);
  }

  Stream<bool> _isChangeCategory() async*{
    await Future<void>.delayed(const Duration(seconds: 1));
    yield _currentCategory != m_app.currentCatogary;
    setState((){
      _currentCategory = m_app.currentCatogary;
    });
  }

  Future<List<ProductModel>> _loadProduct(bool change) async {
    if(change){      
      print('load ' + _currentCategory);
      // var list = await loadProductData();
      var list = m_products;
      _products = _currentCategory == 'hot'? list.sublist(0,10) : list.where((item) => item.category == _currentCategory).toList();
      _toTab(_currentCategory);
    }
    return _products;
  }
  void _toTab(String name){
    switch(name){  
    case 'hot': _tabController.animateTo(0); break;
    case 'laptop': _tabController.animateTo(1); break;
    case 'linh kien': _tabController.animateTo(2); break;
    case 'man hinh': _tabController.animateTo(3); break;
    case 'chuot phim': _tabController.animateTo(4); break;
    case 'tai loa': _tabController.animateTo(5); break;
    case 'console': _tabController.animateTo(6); break;
    case 'phu kien': _tabController.animateTo(7); break;
    }
  }

  void _tabChange(int index){
    switch(index){  
    case 0:{m_app.currentCatogary = 'hot';}break;
    case 1:{m_app.currentCatogary = 'laptop';}break;
    case 2:{m_app.currentCatogary = 'linh kien';}break;
    case 3:{m_app.currentCatogary = 'man hinh';}break;
    case 4:{m_app.currentCatogary = 'chuot phim';}break;
    case 5:{m_app.currentCatogary = 'tai loa';}break;
    case 6:{m_app.currentCatogary = 'console';}break;
    case 7:{m_app.currentCatogary = 'phu kien';}break;
    }
  }

  // ignore: non_constant_identifier_names
  Widget _ItemList(List<ProductModel> products){
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
          childAspectRatio: 3/4,
          crossAxisCount: 2,
          crossAxisSpacing: 5,  
          mainAxisSpacing: 5, 
      ),  
      itemBuilder: (BuildContext context, int index){ 
        return CategoryItem(model: products[index],);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _isChangeCategory(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError || !snapshot.hasData) return Container();
          return FutureBuilder(
            future: _loadProduct(snapshot.data!),
            builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator(),);
              return Column(
                children: [
                  Container(
                    color: Theme.of(context).backgroundColor,
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Theme.of(context).accentColor,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Theme.of(context).accentColor,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: 'Hot',),
                        Tab(text: 'Laptop',),
                        Tab(text: 'Linh kiện PC',),
                        Tab(text: 'Màn hình',),
                        Tab(text: 'Chuột - Bàn phím',),
                        Tab(text: 'Tai nghe - Loa',),
                        Tab(text: 'Console',),
                        Tab(text: 'Phụ kiện',),
                      ],
                      onTap:  (index){_tabChange(index);},
                    ),
                  ),
                  Expanded(
                    child:  Container(
                      padding: EdgeInsets.all(10),
                      child: _ItemList(_products)
                    ),
                  )
                ]
              );
            }
          );
        },
      )
    );
  }
}
