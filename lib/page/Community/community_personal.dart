import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/community_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/utils/build_image_widget.dart';
import 'package:pantry_saver_fe/utils/tags_widget.dart';

class CommunityPersonalPage extends StatefulWidget {
  @override
  _CommunityPersonalPageState createState() => _CommunityPersonalPageState();
}

class _CommunityPersonalPageState extends State<CommunityPersonalPage> {
  late CommunityBloc _bloc;
  late List<CommunityRecipeModel> listCommunityRecipe;

  @override
  void initState() {
    super.initState();
    _bloc = CommunityBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(children: [
        //MUNGKIN BISA DIPAKE NTAR IDK HUEHUEHUE
        //FutureBuilder(
        //     future: _bloc.fetchPersonal(),
        //     builder: (BuildContext context,
        //         AsyncSnapshot<List<CommunityRecipeModel>?> snapshot) {
        //       if (snapshot.hasData) {
        //         listCommunityRecipe = snapshot.data!;
        //         print(listCommunityRecipe);
        //         return Container();
        //       } else if (!snapshot.hasData) {
        //         return Center(
        //           child: CircularProgressIndicator(
        //             valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
        //           ),
        //         );
        //       }
        //       return Container();
        //     }),
        Stack(children: <Widget>[
          Container(
            child: BuildImageWidget(
                imagePath: 'assets/images/salmonbenedict2.png',
                onClicked: () {}),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: greyPrimary,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(5)),
                  child: Icon(Icons.add),
                  onPressed: () {}),
            ],
          ),
          // const SizedBox(height: 50),
          Container(
            padding: EdgeInsets.only(top: 150, right: 15, left: 15),
            child: Card(
              color: Colors.white,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //     decoration: BoxDecoration(
                      //         color: orangePrimary,
                      //         borderRadius: BorderRadius.only(
                      //             topRight: Radius.circular(30.0),
                      //             bottomRight: Radius.circular(30.0))),
                      //     child: buildImage()),

                      Container(
                        margin:
                            EdgeInsets.only(top: 5, left: 25.0, right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Egg Benedict",
                                style: TextStyle(
                                    color: orangePrimary, fontSize: 24)),
                            Text(
                              "by Alex Somad",
                              style: TextStyle(color: greyPrimary),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 25.0),
                        child: Row(
                          children: [
                            Text(
                              "Jul 10 2020",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
        const SizedBox(height: 24),
        Container(
          padding: EdgeInsets.only(right: 15, left: 15),
          child: Card(
            color: greenLight,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //     decoration: BoxDecoration(
                    //         color: orangePrimary,
                    //         borderRadius: BorderRadius.only(
                    //             topRight: Radius.circular(30.0),
                    //             bottomRight: Radius.circular(30.0))),
                    //     child: buildImage()),
                    Container(
                        // height: 60,
                        padding: EdgeInsets.only(
                            top: 10, right: 15, left: 15, bottom: 10),
                        child: TagsWidget(text: "Egg", onClicked: () {})),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 26),
        Container(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ingredients: "),
                Text("100gr eggs, 400gr bread, 50gr lemon, 5gr oregano"),
                const SizedBox(height: 24),
                Text("Steps :"),
                Text(
                    '''1. Poach the egg, ensure the water is not at a boil, but hot enough that putting your hand over the pot is uncomfortable.
2. Toast the bread slices
3. Whisk or blend an egg yolk with lemon, salt, pepper and oregano. Whisk oil in slowly until around 140 grams have been drizzled in. This is the hollandaise, but it's not hollandaise because it uses oil instead of butter so it's mayonnaise.
4. Assemble the egg benedict, egg first, then bread, then hollandaise/mayo.''')
              ],
            )),
        const SizedBox(height: 40),
      ]),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
