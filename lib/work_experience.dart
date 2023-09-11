import 'package:flutter/material.dart';

class WorkExperienceList extends StatelessWidget {
  final List<String> workExperiences;
  final Function(int) onDelete; 

  WorkExperienceList({required this.workExperiences, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Work Experience",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(workExperiences.length, (index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Icon(
                  Icons.ballot_outlined,
                  size: 12,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    workExperiences[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    onDelete(
                        index); 
                  },
                ),
              ],
            );
          }),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
