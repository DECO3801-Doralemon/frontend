import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/community_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';
import 'package:pantry_saver_fe/utils/build_image_widget.dart';

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
                            Text("by Alex Somad")
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
      ]),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
