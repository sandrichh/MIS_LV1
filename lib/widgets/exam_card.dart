import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');
    final isPast = exam.dateTime.isBefore(DateTime.now());


    return Card(
      color: isPast ? Colors.green[100] : Colors.deepOrangeAccent[100],
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(exam.subjectName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text("${dateFormat.format(exam.dateTime)} "
                    "${timeFormat.format(exam.dateTime)}"),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.meeting_room, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(", ")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
