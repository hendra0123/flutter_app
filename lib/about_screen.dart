import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/foto_profil.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Hendra Oktarizal Couwandy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    _buildListItem('Email', 'hoktarizal@student.ciputra.ac.id'),
                    _buildListItem('Address', 'Rajawali Street'),
                    _buildListItem('Hobby', 'Games, Sleep, Repeat'),
                    _buildListItem('Skills', 'Flutter, Dart, Java'),
                    _buildListItem('Lecture', 'Ciputra University'),
                    _buildListItem('Major', 'Full Stack Development'),
                    _buildListItem('Generation', '2022'),
                    _buildListItem('Mobile', '082190026622'),
                    _buildListItem('Instagram', '@hendra_oc_24'),
                    _buildListItem('Line', 'hendracouwandy'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
