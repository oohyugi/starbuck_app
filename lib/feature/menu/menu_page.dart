import 'dart:async';

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:starbuck_app/feature/detail.dart';
import 'package:starbuck_app/feature/store/store_page.dart';
import 'package:starbuck_app/helper/helper.dart';
import 'package:starbuck_app/model/coffee_mdl.dart';
import 'package:starbuck_app/widget/custom_tab_indicator.dart';

import 'bloc/menu_bloc.dart';
import 'bloc/menu_event.dart';
import 'bloc/menu_state.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  MenuBloc menuBloc = MenuBloc();
  List<MenuItemMdl> listProduct = List();
  String _textLocation = "Green Pramuka";

  @override
  void initState() {
    super.initState();
    menuBloc..add(FetchAllMenu());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Store",
                  style: Theme
                      .of(context)
                      .textTheme
                      .title,
                ),
                InkWell(
                  onTap: () async {
                    String result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StorePage()));

                    if (result != null) {
                      _textLocation = result;
                      menuBloc.add(FetchAllMenu());
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        _textLocation,
                        style: TextStyle(
                            fontSize: 14, color: Colors.black87),
                      ),
                      Icon(
                        Icons.place,
                        color: Theme
                            .of(context)
                            .primaryColor,
                        size: 14,
                      ),
                      Text(
                        "4km",
                        style: TextStyle(
                            fontSize: 10, color: Colors.black87),
                      ),
                    ],
                  ),
                )
              ],
            ),

          ],
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: BlocBuilder(
        bloc: menuBloc,
        builder: (context, state) {
          if (state is LoadingMenu) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ResponseSuccess) {
            listProduct.addAll(state.listDataMenu);
          }
          if (state is ResponseFailed) {
            return errorView(errorMessage: state.errorMessage);
          }
//        return listProduct();
          return ProductView(listProduct: listProduct, bloc: menuBloc,);
        },
      ),
    );
  }

  Widget errorView({@required String errorMessage}) {
    return Center(
      child: Text(errorMessage),
    );
  }
}

class ProductView extends StatefulWidget {
  final List<MenuItemMdl> listProduct;
  final MenuBloc bloc;

  ProductView({Key key, @required this.listProduct, this.bloc})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductViewState();
  }
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Widget> tabWidget = List();
  bool isTapTab = false;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();

  Future gotoTabIndex(Iterable<ItemPosition> value) async {
    int index = 0;
    tabController.index = value.elementAt(index++).index;
  }

  @override
  void initState() {
    tabController =
        TabController(length: widget.listProduct.length, vsync: this);
    tabController.addListener(tabListener);

    for (var tabItem in widget.listProduct) {
      tabWidget.add(Tab(
          child: Text(
        tabItem.name,
      )));
    }

    itemPositionListener.itemPositions.addListener(() {
      if (!isTapTab) {
        gotoTabIndex(itemPositionListener.itemPositions.value);
      }
    });

    super.initState();
  }

  tabListener() {
    if (isTapTab) {
      _scrollToIndex(tabController.index);
    }
  }


  Future _scrollToIndex(int index) async {
    await itemScrollController.jumpTo(index: tabController.index);
    Timer(Duration(milliseconds: 600), () {
      isTapTab = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: tabWidget,
              isScrollable: true,
              unselectedLabelColor: Colors.black26,
              labelColor: Theme.of(context).primaryColor,
              controller: tabController,
              indicator: CircleTabIndicator(
                  color: Theme.of(context).primaryColor, radius: 2),
              onTap: (index) {
                isTapTab = true;
              },
            ),
            Expanded(
              child: ScrollablePositionedList.builder(
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionListener,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListWithHeader(
                          menu: widget.listProduct[index],
                          indexHeader: index,
                        ),
                      ],
                    );
                  },
                  itemCount: widget.listProduct.length),
            ),
          ],
        ),
      ),
    );
  }
}

class ListWithHeader extends StatelessWidget {
  final MenuItemMdl menu;
  final int indexHeader;

  ListWithHeader({Key key, @required this.menu, @required this.indexHeader})
      : super(key: key);

  List<MenuItemMdl> listProductMdl = List();

  int itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listProductWidget = List();
    for (var itemMenu in menu.products) {
      listProductWidget.add(ItemProduct(
        product: itemMenu,
      ));
    }

    return Container(
      key: Key("$indexHeader"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              menu.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          Column(
            children: listProductWidget,
          )
        ],
      ),
    );
  }
}

class ItemProduct extends StatelessWidget {
  final ProductsMdl product;

  ItemProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgUrl = product.assets.thumbnail.large.uri;
    return OpenContainerWrapper(
      transitionType: ContainerTransitionType.fade,
      closeContainer: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: imgUrl != null
              ? CachedNetworkImage(
            imageUrl: imgUrl,
            placeholder: (context, url) =>
                Container(
                  color: Colors.black26,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                  ),
                ),
          )
              : Container(
              color: Colors.black26,
              child: SizedBox(
                width: 50,
                height: 50,
              )),
        ),
        title: Text(
          product.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text("Rp25.000.000"),
      ),
      openContainer: OrderDetailPage(imgProduct: imgUrl,
        productName: product.name,
        categoryName: product.formCode,),

    );
  }
}
