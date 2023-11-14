import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildCategorySection('Education', [
              _buildExperienceCard(
                'Elementary School',
                'SD Kristen Gamaliel',
                '2010 - 2016',
                'Studying Elementary School Lesson',
              ),
              _buildExperienceCard(
                'Junior High School',
                'SMP Kristen Gamaliel',
                '2016 - 2019',
                'Studying Junior High School Lesson',
              ),
              _buildExperienceCard(
                'Senior High School',
                'SMA Kristen Gamaliel',
                '2019 - 2022',
                'Studying Senior High School Lesson',
              ),
              _buildExperienceCard(
                'College',
                'Ciputra University',
                '2022 - Now',
                'Studying Informatics Lesson',
              ),
            ]),
            _buildCategorySection('Achievements', [
              _buildExperienceCard(
                'Robot Competition',
                'Politeknik Negeri Semarang',
                'February 2023',
                'Awarded Second Place in Elektro Expo Competition Transporter Robot',
              ),
              _buildExperienceCard(
                'Kemdikbud Program',
                'Entrepreneurship Program (P2MW)',
                'June 2022',
                'Recipient of P2MW Assistance to Create a 3D Printing Business',
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, List<Widget> cards) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: cards,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(
      String title, String company, String period, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.grey[800],
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              company,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              period,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
