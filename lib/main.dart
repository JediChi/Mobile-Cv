import 'package:cv_app/customized.styling.dart';
import 'package:cv_app/edit.dart';
import 'package:cv_app/work_experience.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyCvApp());
}

class MyCvApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Cv',
      theme: ThemeData(
        primaryColor: Color.alphaBlend(Colors.brown, Colors.green),
      ),
      home: CVPage(),
    );
  }
}

class CVPage extends StatefulWidget {
  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  String fullName = "Adanma Akanno";
  String slackUsername = "Adanma Akanno";
  String githubHandle = "github.com/JediChi";
  String biography = "I am a mobile and backend developer";
  List<String> workExperiences = [
    "Interned at Genesys Tech Hub",
    "Currently interning at HNG",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.alphaBlend(Colors.brown, Colors.green),
        title: const Text("Mobile Cv"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildInfoRow("Full Name:", fullName),
            buildInfoRow("Slack Username:", slackUsername),
            buildInfoRow("GitHub Handle:", githubHandle),
            buildInfoRow("Biography:", biography),
            WorkExperienceList(
              workExperiences: workExperiences,
              onDelete: (index) {
                setState(() {
                  workExperiences.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditCv(onSave: (newFullName,
                  newSlackUsername,
                  newGithubHandle,
                  newBiography,
                  newWorkExperienceList) {
                // Update the state with the new values
                setState(() {
                  fullName = newFullName;
                  slackUsername = newSlackUsername;
                  githubHandle = newGithubHandle;
                  biography = newBiography;
                  workExperiences = newWorkExperienceList;
                });
              }),
            ),
          );
        },
        backgroundColor: Color.alphaBlend(Colors.brown, Colors.green),
        child: Icon(Icons.edit),
      ),
    );
  }
}
