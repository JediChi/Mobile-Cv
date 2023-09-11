import 'package:cv_app/customized.styling.dart';
import 'package:cv_app/work_experience.dart';
import 'package:flutter/material.dart';

class EditCv extends StatefulWidget {
  final Function(String, String, String, String, List<String>) onSave;

  EditCv({Key? key, required this.onSave}) : super(key: key);
  @override
  State<EditCv> createState() => _EditCvState();
}

class _EditCvState extends State<EditCv> {
  String fullName = "";
  String slackUserName = "";
  String githubHandle = "";
  String biography = "";
  List<String> workExperiences = [];

  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackUserNameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController biographyController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fullNameController.text = "Adanma Akanno";
    slackUserNameController.text = "Adanma Akanno";
    githubHandleController.text = "github.com/JediChi";
    biographyController.text = "Very dedicated";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit your Cv"),
        backgroundColor: Color.alphaBlend(Colors.brown, Colors.green),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            buildEditRow("Full Name:", fullNameController),
            buildEditRow("Slack Username:", slackUserNameController),
            buildEditRow("Github Handle:", githubHandleController),
            buildEditRow("Biography:", biographyController),
            WorkExperienceList(
              workExperiences: workExperiences,
              onDelete: (index) {
                setState(() {
                  workExperiences.removeAt(index);
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: workExperienceController,
                    decoration: InputDecoration(
                      labelText: "Add Work Experience",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final newExperience = workExperienceController.text;
                    if (newExperience.isNotEmpty) {
                      setState(() {
                        workExperiences.add(newExperience);
                        workExperienceController.text = "";
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                fullName = fullNameController.text;
                slackUserName = slackUserNameController.text;
                githubHandle = githubHandleController.text;
                biography = biographyController.text;

                widget.onSave(fullName, slackUserName, githubHandle, biography,
                    workExperiences);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.alphaBlend(Colors.brown, Colors.green),
              ),
              child: const Text("Save Changes"),
            )
          ],
        ),
      ),
    );
  }
}
