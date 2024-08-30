import 'package:flutter/material.dart';

class BeginnerPage extends StatelessWidget {
  const BeginnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> beginnerPoses = [
      {
        'image': 'assets/beginner/Tadasana.png',
        'name': 'Mountain Pose (Tadasana)',
        'description':
            'A foundational standing pose that improves posture and balance.'
      },
      {
        'image': 'assets/beginner/Downward-Dog.png',
        'name': 'Downward Dog (Adho Mukha Svanasana)',
        'description':
            'An inversion pose that stretches the entire body and relieves tension.'
      },
      {
        'image': 'assets/beginner/Virabhadrasana.png',
        'name': 'Warrior I (Virabhadrasana I)',
        'description':
            'A powerful standing pose that builds strength and stamina.'
      },
      {
        'image': 'assets/beginner/Virabhadrasana2.png',
        'name': 'Warrior II (Virabhadrasana II)',
        'description':
            'An extension of Warrior I, enhancing balance and endurance.'
      },
      {
        'image': 'assets/beginner/TreePose.png', // Fixed image path
        'name': 'Tree Pose (Vrksasana)',
        'description':
            'A balancing pose that helps with concentration and stability.'
      },
      {
        'image': 'assets/beginner/BridgePose.png',
        'name': 'Bridge Pose (Setu Bandhasana)',
        'description':
            'A backbend that strengthens the back and opens the chest.'
      },
      {
        'image': 'assets/beginner/ChildPose.png',
        'name': 'Child’s Pose (Balasana)',
        'description':
            'A resting pose that gently stretches the back and relieves stress.'
      },
      {
        'image': 'assets/beginner/CatCowPose.png',
        'name': 'Cat-Cow Pose (Marjaryasana)',
        'description':
            'A sequence of poses that increases flexibility in the spine.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beginner Level'),
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
          itemCount: beginnerPoses.length,
          itemBuilder: (context, index) {
            final pose = beginnerPoses[index];
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
