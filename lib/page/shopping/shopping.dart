import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/shopping_bloc.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/shopping_model.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';

class Shopping extends StatefulWidget {
  @override
  ShoppingState createState() => ShoppingState();
}

class ShoppingState extends State<Shopping> {
  bool closeTopContainer = false;

  ShoppingBloc bloc = ShoppingBloc();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        backgroundColor: greenPrimary,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(doubleSpace),
              child: Text(
                'Shopping',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'BalsamiqSans',
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child:  ListView(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                            child: Image.asset('assets/images/shopping_bg.jpeg'),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 55, horizontal: 65),
                        child: Text(
                          "Description about the Shopping Page, what info does it show, etc.",
                          style: TextStyle(
                              fontSize: 21, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 214),
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0)),
                    color: Colors.white,
                  ),
                  child: FutureBuilder(
                    future: bloc.fetchShopping(),
                    builder: (BuildContext context,
                      AsyncSnapshot<List<ShoppingModel>?> snapshot) {
                      if(snapshot.hasData) {
                        List<ShoppingModel> shopping = snapshot.data!;
                        print('if');
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: shopping.length,
                            itemBuilder: (context, index) => buildCard(context, index, shopping)
                        );
                      } else if (!snapshot.hasData) {
                        print('ElseIF');
                      }
                      return Container();
                    }),
                ),
              ],
            ),
          ],
        ),
      ),
      /*body: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                      child: Image.asset('assets/images/shopping_bg.jpeg'),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 55, horizontal: 65),
                  child: Text(
                    "Description about the Shopping Page, what info does it show, etc.",
                    style: TextStyle(
                        fontSize: 21, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

        ],
      )*/
    );
  }

  Widget buildCard(BuildContext context, int index, List<ShoppingModel> shopping) {
    //final ingredient = shopList[index];
    Size size = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        color: kPrimaryLightColor,
        child: InkWell(
          onTap: (){
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text(
                      shopping[index].name,//ingredient.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'BalsamiqSans',
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Qty: ${shopping[index].neededKg.toString()} kg(s)",
                      //"Qty: test kg(s)",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'BalsamiqSans',
                        color: Colors.white,
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
    );
  }
}