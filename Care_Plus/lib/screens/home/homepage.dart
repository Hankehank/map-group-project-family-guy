import 'package:flutter/material.dart';
import 'package:Care_Plus/screens/profile/profile_screen.dart' as profile_page;
import 'package:Care_Plus/screens/Home/ManageMedicineSchedule.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'title': 'Appointment Reminder', 'icon': Icons.calendar_today},
    {'title': 'Add Medicine Reminder', 'icon': Icons.medication_outlined},
    {'title': 'Locate Nearby Hospital', 'icon': Icons.local_hospital},
    {'title': 'Contact Relatives', 'icon': Icons.phone_in_talk},
    {'title': 'Emergency Location', 'icon': Icons.emergency_share},
    {'title': 'Documents', 'icon': Icons.description_outlined},
    {'title': 'Node', 'icon': Icons.device_hub},
    {'title': 'Relative', 'icon': Icons.group},
  ];

  void _navigateToComingSoon(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComingSoonPage(title: title)),
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ComingSoonPage(title: 'Settings'),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      '/login',
    ); // 确保你在 main.dart 注册了 '/login' 路由
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color.fromARGB(255, 2, 95, 59);

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 3, 3, 3),
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: 'Care Plus',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 3, 3, 3),

                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent, // 背景透明
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => profile_page.ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 176, 201, 152),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 3, 3, 3),

                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings', style: TextStyle(fontSize: 18)),
              onTap: () => _navigateToSettings(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout', style: TextStyle(fontSize: 18)),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 243, 230),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: features.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = features[index];
                  return Material(
                    color: const Color.fromARGB(255, 216, 242, 203),
                    borderRadius: BorderRadius.circular(16),
                    elevation: 4,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap:
                          () => _navigateToComingSoon(context, item['title']),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item['icon'], size: 50, color: themeColor),
                            const SizedBox(height: 16),
                            Text(
                              item['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20, // 字体大小调整
                                fontWeight: FontWeight.bold, // 加粗
                                fontStyle: FontStyle.italic, // 斜体
                                color: Color.fromARGB(255, 0, 0, 0), // 颜色
                                //letterSpacing: 1.1, // 字符间距
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComingSoonPage extends StatelessWidget {
  final String title;

  const ComingSoonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 216, 242, 203),
      ),
      body: const Center(
        child: Text(
          'Coming Soon...',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
