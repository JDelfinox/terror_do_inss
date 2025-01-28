import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgendaScrenn(),
    );
  }
}
class AgendaScrenn extends StatefulWidget{
  @override
  _AgendaScrennState createState() => _AgendaScrennState();
}
class _AgendaScrennState extends State<AgendaScrenn> {
  final DateTime _selectedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {
    DateTime.now(): ['Tomar Carverdilol', 'Tomar Metformina', 'Tomar Enalapril', 'Hidroginástica'],
  };

  @override
  Widget build(BuildContext context) {
    final String dayOfMonth = DateFormat('d').format(_selectedDay);
    final String dayOfWeek = DateFormat('EEEE').format(_selectedDay);
    final String monthAndYear = DateFormat('MMMM').format(_selectedDay);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Text(
                  'Hoje', 
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayOfMonth,
                      style: TextStyle(
                      fontSize: 48, 
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dayOfWeek, 
                        style: TextStyle(
                          fontSize: 24, 
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          monthAndYear,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]
            )
          ),  
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: ListView.builder(
                itemCount: _events[_selectedDay]?.length ?? 0,
                itemBuilder: (context, index) {
                  final event = _events[_selectedDay]![index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.event, color: Colors.blue),
                      title: Text(
                        event,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text('Horário: ${index + 7}:00 AM'),
                    )
                  );
                }
              ),
            )
          )
        ]
      ),
    );
    
  }
  
  


}