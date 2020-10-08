import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../../constants.dart' as Constants;

void main() => runApp(new MyCalendar());

class MyCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Color(Constants.COLOR_PRIMARY),
        accentColor: Color(Constants.COLOR_ACCENT),
      ),
      home: new MyCalendarPage(title: 'Calendar'),
    );
  }
}

class MyCalendarPage extends StatefulWidget {
  MyCalendarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyCalendarPageState createState() => new _MyCalendarPageState();
}

class _MyCalendarPageState extends State<MyCalendarPage> {
  DateTime _currentDate = DateTime(2020, 10, 8);
  DateTime _currentDate2 = DateTime(2020, 10, 10);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2020, 10));

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 10, 29): [
        new Event(
          date: new DateTime(2020, 10, 29),
          title: 'The Prophet Muhammad\'s Birthday',
          icon: _eventIcon,
        ),
      ],
      new DateTime(2020, 8, 20): [
        new Event(
          date: new DateTime(2020, 8, 20),
          title: 'Muharram',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {
    _markedDateMap.addAll(new DateTime(2020, 8, 31), [
      new Event(
        date: new DateTime(2020, 8, 31),
        title: 'Hari Merdeka',
        icon: _eventIcon,
      ),
    ]);
    _markedDateMap.addAll(new DateTime(2020, 9, 16), [
      new Event(
        date: new DateTime(2020, 9, 16),
        title: 'Malaysia Day',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Color(Constants.COLOR_ACCENT),
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),

      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarousel,
              ), // This trailing comma makes auto-formatting nicer for build methods.
              //custom icon without header
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ),
            ],
          ),
        ));
  }
}
