import 'package:flutter/material.dart';
import 'package:student_flutter_app/add_screen.dart';
import 'package:student_flutter_app/edit_screen.dart';
import 'package:student_flutter_app/student.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.people_alt, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 20,),
                const Text('รายชื่อนักศึกษา', style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),),
                const SizedBox(height: 5,),
                Text('นักศึกษาทั้งหมด ${Student.countItems} คน'),
              ],
            ),
            Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 55,
                ),
                child: studentList(context)
              ),
            )
            ),
          ],
        ),
      ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple.shade200,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const AddScreen()));
          },
          child: const Icon(Icons.add, size: 40,color: Colors.purple,),),
    );
  }

  Widget studentList(BuildContext context){
    return ListView.builder(
      itemCount: Student.countItems,
      itemBuilder: (contex, index){
        return Column(
          children: [
            Dismissible(
              key: Key(Student.studentItems[index]['id']),
              background: Container(
                decoration: const BoxDecoration(color: Colors.pink),
              ),
              onDismissed: (direction){
                if(direction == DismissDirection.endToStart){
                  Student.studentItems.removeAt(index);
                  setState(() {
                    Student.countItems = Student.studentItems.length;
                  });
                }
              }, 
              direction: DismissDirection.endToStart,
              child: studentTile(index)),
            const Divider(
              color: Colors.blueGrey,
              indent: 20,
              endIndent: 20,
              height: 1,
            )
          ],
        );
      });
  }

  Widget studentTile(int index){
    var id = Student.studentItems[index]['id'];
    var name = Student.studentItems[index]['name'];
    var score = Student.studentItems[index]['score'];

    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 60,
        right: 60,
      ),
      title: Text('${index+1}. $id $name $score', style: 
                                                    const TextStyle(color: Colors.pinkAccent, 
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.w500),
      ),
      trailing: Text(score.toString(),
                          style: const TextStyle(color: Colors.pinkAccent, 
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.w500),),
      onTap: (){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (context){
            return EditScreen(index: index);
          });
      },
    );
  }
}