import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:life_time/pages/planting.dart';

class Home extends StatefulWidget {
  int plantingTimeLeft;
  int plantingTimeDone;

  Home({Key key, this.plantingTimeLeft, this.plantingTimeDone})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _timeValue = 1;

  void _updateTime(int start, int end, int laps) {
    if (end == 0) {
      end = 24;
    }
    setState(() {
      _timeValue = end;
    });
  }

  String _formatTime(int timeValue) {
    int hour = timeValue * 5 ~/ 60;
    int min = timeValue * 5 % 60;
    String formatTime;
    formatTime = (hour > 9 && min > 9)
        ? '$hour : $min'
        : (hour < 10 && min > 9)
            ? '0$hour : $min'
            : (hour < 10 && min < 10) ? '0$hour : 0$min' : '$hour : 0$min';
    return formatTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[500],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleCircularSlider(
                24,
                1,
                height: 300,
                width: 300,
                baseColor: Colors.brown[400],
                handlerColor: Colors.green[800],
                selectionColor: Colors.green[800],
                showHandlerOutter: true,
                showRoundedCapInSelection: true,
                sliderStrokeWidth: 13,
                onSelectionChange: _updateTime,
                child: Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/bush.png'))),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${_formatTime(_timeValue)}",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                elevation: 7,
                focusColor: Colors.teal[600],
                focusElevation: 0,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Planting(plantingTimeLeft: this._timeValue * 5 * 60),
                    ),
                  );
                },
                /*() => Navigator.pushNamed(context, '/planting',
                    arguments: <String, int>{
                      'plantingTime': this._timeValue * 5 * 60,
                    }),*/
                child: Text(
                  'Planter',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                color: Colors.teal[800],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      )),
    );
  }
}
