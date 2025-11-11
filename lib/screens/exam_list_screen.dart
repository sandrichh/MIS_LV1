import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';
import 'package:intl/intl.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = [
      Exam(
          subjectName: "Веб програмирање",
          dateTime: DateTime(2025, 6, 20, 9, 0),
          rooms: ["Лаб. 13", "Лаб. 200в"],
          ),
      Exam(
          subjectName: "Бази на податоци",
          dateTime: DateTime(2025, 5, 25, 12, 0),
          rooms: ["Лаб. 200АБ", "Лаб 138", "Лаб. 215"],
          ),
      Exam(
          subjectName: "Оперативни системи",
          dateTime: DateTime(2025, 7, 2, 10, 30),
          rooms: ["Лаб 138", "Лаб. 215"],
          ),
      Exam(
          subjectName: "Мобилни Информациски Системи",
          dateTime: DateTime(2025, 5, 10, 9, 0),
          rooms: ["Лаб. 2", "Лаб. 3"],
          ),
      Exam(
          subjectName: "Интернет технологии",
          dateTime: DateTime(2026, 6, 28, 8, 30),
          rooms: ["Лаб. 215", "Лаб. 200АБ"],
          ),
      Exam(
          subjectName: "Компјутерски мрежи",
          dateTime: DateTime(2025, 5, 22, 13, 0),
          rooms: ["B2"],
          ),
      Exam(
          subjectName: "Анализа 2",
          dateTime: DateTime(2025, 6, 10, 9, 0),
          rooms: ["C2"],
          ),
      Exam(
          subjectName: "Архитектура на компјутери",
          dateTime: DateTime(2026, 1, 15, 11, 0),
          rooms: ["A4"]
          ),
      Exam(
          subjectName: "Вештачка интелигенција",
          dateTime: DateTime(2026, 2, 5, 10, 0),
          rooms: ["A5"],
          ),
      Exam(
          subjectName: "Алгоритми и податочни структури",
          dateTime: DateTime(2025, 6, 15, 9, 0),
          rooms: ["Lab 3"],
          ),
    ];

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 231070"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExamDetailScreen(exam: exam),
              ),
            ),
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Вкупно испити: ${exams.length}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
