import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 80.0, // Height of the AppBar
      pinned: true,
      flexibleSpace: ClipPath(
        clipper: CustomAppBarClipper(),
        child: Container(
          color: const Color.fromARGB(255, 131, 184, 227),
          child: FlexibleSpaceBar(
            centerTitle: true,
            title: const Text(
              'YOG',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            background: Container(
              color: const Color.fromARGB(255, 131, 184, 227),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: PopupMenuButton<String>(
            iconSize: 24.0, // Adjust the size based on the AppBar height
            onSelected: (String value) async {
              // Handle menu item selection
              switch (value) {
                case 'User Profile':
                  // Navigate to user profile
                  print('Navigate to User Profile');
                  break;
                case 'Privacy':
                  // Navigate to privacy settings
                  print('Navigate to Privacy');
                  break;
                case 'Invite a Friend':
                  // Invite a friend
                  print('Invite a Friend');
                  break;
                case 'Open Instagram':
                  // Open Instagram
                  print('Open Instagram');
                  break;
                case 'Open Facebook':
                  // Open Facebook
                  print('Open Facebook');
                  break;
                case 'Logout':
                  await _handleLogout(context);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                _buildPopupMenuItem('User Profile', Icons.person),
                _buildPopupMenuItem('Privacy', Icons.lock),
                _buildPopupMenuItem('Invite a Friend', Icons.person_add),
                _buildPopupMenuItem('Open Instagram', Icons.camera_alt),
                _buildPopupMenuItem('Open Facebook', Icons.face),
                _buildPopupMenuItem('Logout', Icons.exit_to_app),
              ];
            },
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String title, IconData icon) {
    return PopupMenuItem<String>(
      value: title,
      child: Row(
        children: [
          Icon(icon, size: 20.0),
          const SizedBox(width: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logout failed: $e'),
        ),
      );
    }
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 25); // Adjusted for less curve
    var firstControlPoint = Offset(size.width / 3, size.height - 15);
    var firstEndPoint = Offset(size.width, size.height - 25);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
