import 'package:flutter/material.dart';

class MatchDetailScreen extends StatelessWidget {
  final Map<String, dynamic> match;
  const MatchDetailScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${match['team1']} vs ${match['team2']}"),
        backgroundColor: Colors.blue,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity, // Card full width
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // text left align
                    children: [
                      Text(
                        "${match['team1']} vs ${match['team2']}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${match['score1']?.toString() ?? ''} : ${match['score2']?.toString() ?? ''}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text("Time : ${match['time'] ?? ''}",
                          style: const TextStyle(fontSize: 16,fontWeight:FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("Total Time : ${match['total_time'] ?? ''}",
                          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
