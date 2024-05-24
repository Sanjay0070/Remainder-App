import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Reminder {
  String day;
  TimeOfDay time;
  String activity;

  Reminder({
    required this.day,
    required this.time,
    required this.activity,
  }); // Mark parameters as required
}

class ReminderApp extends StatefulWidget {
  const ReminderApp({super.key}); // Pass key to super constructor

  @override
  _ReminderAppState createState() => _ReminderAppState();
}

class _ReminderAppState extends State<ReminderApp> {
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  final List<String> activities = [
    'Wake up',
    'Go to gym',
    'Breakfast',
    'Meetings',
    'Lunch',
    'Quick nap',
    'Go to library',
    'Dinner',
    'Go to sleep',
  ];

  late String selectedDay; // Mark as late to be initialized later
  late TimeOfDay selectedTime; // Mark as late to be initialized later
  late String selectedActivity; // Mark as late to be initialized later

  late AudioCache audioCache; // Mark as late to be initialized later
  late AudioPlayer audioPlayer;


  @override
  void initState() {
    super.initState();
    selectedDay = daysOfWeek[0];
    selectedTime = TimeOfDay.now();
    selectedActivity = activities[0];
    audioCache = AudioCache(); // Initialize audioCache
  }

  void playChime() {
  // Play the audio file using the audioPlayer instance
  audioPlayer.play("D:\Flutter Project\flutter_application_1\assets\audio\windows-reminder-777.mp3" as Source);
}


  void setReminder() {
    // Logic to set reminder
    // For simplicity, you can print the reminder details for now
    print(
        'Reminder set for $selectedDay at $selectedTime for $selectedActivity');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonFormField(
              value: selectedDay,
              items: daysOfWeek.map((day) {
                return DropdownMenuItem(
                  value: day,
                  child: Text(day),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDay = value.toString(); // Convert value to string
                });
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                TimeOfDay? picked = await showTimePicker(
                  // Mark picked as nullable
                  context: context,
                  initialTime: selectedTime,
                );
                if (picked != null) {
                  setState(() {
                    selectedTime = picked;
                  });
                }
              },
              child: Text(
                'Selected Time: ${selectedTime.format(context)}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              value: selectedActivity,
              items: activities.map((activity) {
                return DropdownMenuItem(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedActivity =
                      value.toString(); // Convert value to string
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // Replace RaisedButton with ElevatedButton
              onPressed: () {
                setReminder();
                // For now, play a chime sound as a placeholder for reminder alert
                playChime();
              },
              child: const Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Reminder App',
    home: ReminderApp(),
  ));
}
