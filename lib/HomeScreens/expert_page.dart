import 'package:flutter/material.dart';

class ExpertPage extends StatelessWidget {
  const ExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> expertPoses = [
      {
        'image': 'assets/expert/Handstand.png',
        'name': 'Handstand (Adho Mukha Vrksasana)',
        'description':
            'A challenging pose where the body is supported on the hands with the legs extended upward.',
      },
      {
        'image': 'assets/expert/ForearmStand.png',
        'name': 'Forearm Stand (Pincha Mayurasana)',
        'description':
            'An inverted pose supported by the forearms, with legs extended upward.',
      },
      {
        'image': 'assets/expert/Scorpionpose.png',
        'name': 'Scorpion Pose (Vrischikasana)',
        'description':
            'An advanced inversion with the body bent and legs arched over the head.',
      },
      {
        'image': 'assets/expert/ForearmStand.png',
        'name': 'Peacock Pose (Mayurasana)',
        'description':
            'A balancing pose where the body is supported on the hands and the legs are extended behind.',
      },
      {
        'image': 'assets/expert/FireFly.png',
        'name': 'Firefly Pose (Tittibhasana)',
        'description':
            'A balance pose with the body lifted and legs extended to the side.',
      },
      {
        'image': 'assets/poses/pose2.png',
        'name': 'Eight-Angle Pose (Astavakrasana)',
        'description':
            'A balancing pose where the body is twisted and supported by the arms.',
      },
      {
        'image': 'assets/poses/pose3.png',
        'name': 'King Pigeon Pose (Eka Pada Rajakapotasana)',
        'description':
            'A deep backbend and hip opener with one leg extended behind and the other bent in front.',
      },
      {
        'image': 'assets/poses/pose4.png',
        'name': 'Full Lotus Pose (Padmasana)',
        'description':
            'A seated pose with legs crossed and feet resting on the thighs.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expert Level'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: expertPoses.length,
          itemBuilder: (context, index) {
            final pose = expertPoses[index];
            return GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        pose['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Flexible(
                    child: Text(
                      pose['name']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 28, 51, 54),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
