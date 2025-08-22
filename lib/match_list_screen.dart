import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'match_detail_screen.dart';

class MatchListScreen extends StatelessWidget {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("matches");

  MatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match List"),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: ref.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
            final rawData = snapshot.data!.snapshot.value;


            Map<String, dynamic> dataMap = {};
            if (rawData is Map) {
              dataMap = Map<String, dynamic>.from(rawData);
            } else if (rawData is List) {
              for (int i = 0; i < rawData.length; i++) {
                if (rawData[i] != null) {
                  dataMap[i.toString()] = rawData[i];
                }
              }
            }

            final matchKeys = dataMap.keys.toList();

            return ListView.builder(
              itemCount: matchKeys.length,
              itemBuilder: (context, index) {
                final key = matchKeys[index];
                final matchRaw = dataMap[key];
                final match = Map<String, dynamic>.from(matchRaw);

                return ListTile(
                  title: Text("${match['team1']} vs ${match['team2']}"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MatchDetailScreen(match: match),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
