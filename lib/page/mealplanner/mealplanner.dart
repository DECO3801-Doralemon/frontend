
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/mealplan_bloc.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/mealplan_model.dart';
import 'package:pantry_saver_fe/network/data/network_model.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:table_calendar/table_calendar.dart';

class MealPlanner extends StatefulWidget {
  @override
  MealPlannerState createState() => MealPlannerState();
}

class MealPlannerState extends State<MealPlanner> {
  //Calender Variable
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String today = DateTime.now().toIso8601String().substring(0,10);

  List<MealPlanModel> mealPlan = [];
  late MealPlanBloc bloc = MealPlanBloc();

  @override
  Widget build(BuildContext context) {
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
                'MealPlanner',
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
                            child: Image.asset('assets/images/mealplanner-bg.jpeg'),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundImage: AssetImage(
                                    'assets/images/facebook-default-no-profile-pic.jpg'),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Text(
                              "My Profile",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 55, horizontal: 65),
                        child: Text(
                          "The meal planner plans your meals according to the calendar date, "
                              "allowing you to plan what recipes you will be making ahead of time.",
                          style: TextStyle(
                              fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              //margin: EdgeInsets.only(bottom: 214),
              padding: EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    topLeft: Radius.circular(50.0)),
                color: Colors.white,
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2010),
                lastDay: DateTime.utc(2040),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      today = _selectedDay!.toIso8601String().substring(0,10);
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    topLeft: Radius.circular(50.0)),
                color: orangeBackground,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Meal for $today",
                        //overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'BalsamiqSans',
                          color: greenPrimary,
                        ),
                      ),
                      Text(
                        "See details",
                        //overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'BalsamiqSans',
                          color: greenPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: StreamBuilder<NetworkModel<MealPlanList>>(
                      stream: bloc.mealPlanStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          switch (snapshot.data!.status) {
                            case Status.LOADING:
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(greenPrimary),
                                ),
                              );
                              break;
                            case Status.COMPLETED:
                              mealPlan = snapshot.data!.data!.allMealPlan;
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: mealPlan.length,
                                  itemBuilder: (BuildContext context, int index) =>
                                      buildCard(context, index));
                              break;
                            case Status.ERROR:
                              break;
                          }
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      color: kPrimaryLightColor,
      margin: EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: (){},
        child: Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
            Text(
              mealPlan[index].recipe_name,//recipe name,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'BalsamiqSans',
                color: Colors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}