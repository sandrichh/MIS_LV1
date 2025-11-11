import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String getTimeRemaining() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) {
      return "Испитот поминал";
    }

    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(title: Text(exam.subjectName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Предмет: ${exam.subjectName}",
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                Text("Датум и време: ${dateFormat.format(exam.dateTime)}"),
                const SizedBox(height: 10),
                Text("Простории: ${exam.rooms.join(', ')}"),
                const SizedBox(height: 20),
                Text("Преостанато време: ${getTimeRemaining()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
