import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// DATA_MODEL
class Student {
  final String imageUrl;
  final String name;
  final String studentId;
  final String position;

  Student({
    required this.imageUrl,
    required this.name,
    required this.studentId,
    required this.position,
  });
}

class StudentData extends ChangeNotifier {
  final List<Student> _students;

  List<Student> get students => _students;

  StudentData()
      : _students = <Student>[
          Student(
            imageUrl:
                'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg?id=1',
            name: 'Nguyễn Anh Quân',
            studentId: '20220844',
            position: 'Trưởng nhóm',
          ),
          Student(
            imageUrl:
                'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg?id=2',
            name: 'Nguyễn Văn Vũ',
            studentId: '20220839',
            position: 'Thành viên',
          ),
          Student(
            imageUrl:
                'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg?id=3',
            name: 'Nguyễn Thị An Bình',
            studentId: '20220997',
            position: 'Thành viên',
          ),
          Student(
            imageUrl:
                'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg?id=4',
            name: 'Nguyễn Sỹ Quang',
            studentId: '20220744',
            position: 'Thành viên',
          ),
          Student(
            imageUrl:
                'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg?id=5',
            name: 'Hoàng Minh Duy',
            studentId: '20220794',
            position: 'Thành viên',
          ),
        ];
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Giới thiệu sinh viên',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<StudentData>(
        create: (BuildContext context) => StudentData(),
        builder: (BuildContext context, Widget? child) =>
            const StudentIntroductionPage(),
      ),
    );
  }
}

class StudentIntroductionPage extends StatelessWidget {
  const StudentIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giới thiệu sinh viên'),
        centerTitle: true,
      ),
      body: Consumer<StudentData>(
        builder: (BuildContext context, StudentData studentData, Widget? child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: studentData.students.length,
            itemBuilder: (BuildContext context, int index) {
              final Student student = studentData.students[index];
              return StudentCard(student: student);
            },
          );
        },
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0), // Make it circular
                child: Image.network(
                  student.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) =>
                      const Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.grey,
                  ), // Fallback icon
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              student.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Mã sinh viên: ${student.studentId}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'Chức vụ: ${student.position}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}