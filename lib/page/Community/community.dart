import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  late CommunityRecipeBloc _bloc;
  late CommunityRecipeModel communityRecipe;
  late List<CommunityRecipeModel> listCommunityRecipe;

  @override
  void initState() {
    super.initState();
    _bloc = CommunityRecipeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder(
          future: _bloc.fetchCommunityRecipe(),
          builder: (BuildContext context, AsyncSnapshot<CommunityRecipeModel?> snapshot) {
            if (snapshot.hasData) {
              listCommunityRecipe = snapshot.data!;
              print(communityRecipe);
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