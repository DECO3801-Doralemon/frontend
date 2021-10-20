import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/community_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/CommunityRecipe.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
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
      body: FutureBuilder(
          future: _bloc.fetchPersonal(),
          builder: (BuildContext context, AsyncSnapshot<List<CommunityRecipeModel>?> snapshot) {
            if (snapshot.hasData) {
              listCommunityRecipe = snapshot.data!;
              print(listCommunityRecipe);
              return Container();
            }
            else if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
                ),
              );
            }
            return Container();
          }),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}