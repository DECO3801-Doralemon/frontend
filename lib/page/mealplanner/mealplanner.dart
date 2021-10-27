
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/mealplan_model.dart';
import 'package:table_calendar/table_calendar.dart';

class MealPlanner extends StatefulWidget {
  @override
  MealPlannerState createState() => MealPlannerState();
}

class MealPlannerState extends State<MealPlanner> {
  //Calender Variable
  late final ValueNotifier<List<MealPlanModel>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


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
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 55, horizontal: 65),
                        child: Text(
                          "Description about the MealPlanner Page, what info does it show, etc.",
                          style: TextStyle(
                              fontSize: 21, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                /*
                Container(
                  margin: EdgeInsets.only(top: 214),
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0)),
                    color: Colors.white,
                  ),
                  child:
                ),*/
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                TableCalendar(
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
                        print(_selectedDay);
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
                const SizedBox(height: 8.0),
                /*
                Expanded(
                    child: ValueListenableBuilder<List<MealPlanModel>>(
                      valueListenable: _selectedEvents,
                      builder: (context, value, _) {
                        return ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ListTile(
                                  onTap: () => print('${value[index].recipe_name}'),
                                  title: Text('${value[index].recipe_name}'),
                                )
                            );
                          },
                        );
                      },
                    )
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}