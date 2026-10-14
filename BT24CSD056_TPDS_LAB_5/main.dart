import 'package:flutter/material.dart';

void main() => runApp(const StudentPortalApp());

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Portal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF246BFD)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter email and password to continue')),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const PortalScreen()),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF246BFD), Color(0xFF123B88)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 38,
                          backgroundColor: Color(0xFFE5EDFF),
                          child: Icon(Icons.school, size: 42, color: Color(0xFF246BFD)),
                        ),
                        const SizedBox(height: 16),
                        const Text('STUDENT PORTAL',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        const Text('Sign in to manage your learning'),
                        const SizedBox(height: 26),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email or Student ID',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please contact your college administrator.')),
                            ),
                            child: const Text('Forgot password?'),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: login,
                            icon: const Icon(Icons.login),
                            label: const Padding(
                              padding: EdgeInsets.all(13),
                              child: Text('LOGIN'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text('Demo app • Enter any non-empty credentials',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PortalScreen extends StatefulWidget {
  const PortalScreen({super.key});

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  int selectedIndex = 0;

  final pages = const [
    DashboardPage(),
    CoursesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Portal', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('You are all caught up!')),
            ),
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Courses'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Welcome back, Kundan Patidar!',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text('Here is your academic summary.'),
        const SizedBox(height: 18),
        const Row(
          children: [
            Expanded(child: StatCard(title: 'Attendance', value: '87%', icon: Icons.calendar_month, color: Colors.blue)),
            SizedBox(width: 12),
            Expanded(child: StatCard(title: 'CGPA', value: '8.45', icon: Icons.trending_up, color: Colors.green)),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(child: StatCard(title: 'Assignments', value: '8/10', icon: Icons.assignment_outlined, color: Colors.orange)),
            SizedBox(width: 12),
            Expanded(child: StatCard(title: 'Credits', value: '92/100', icon: Icons.star_outline, color: Colors.purple)),
          ],
        ),
        const SizedBox(height: 22),
        const Text('Academic Performance',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const SubjectCard(name: 'Data Structures', detail: 'Marks: 88/100 • Attendance: 92%', progress: .92),
        const SubjectCard(name: 'Database Systems', detail: 'Marks: 81/100 • Attendance: 86%', progress: .86),
        const SubjectCard(name: 'Artificial Intelligence', detail: 'Marks: 91/100 • Attendance: 90%', progress: .90),
        const SubjectCard(name: 'Computer Networks', detail: 'Marks: 76/100 • Attendance: 79%', progress: .79),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String name;
  final String detail;
  final double progress;

  const SubjectCard({
    super.key,
    required this.name,
    required this.detail,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 5),
            Text(detail, style: const TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: progress, minHeight: 7, borderRadius: BorderRadius.circular(8)),
          ],
        ),
      ),
    );
  }
}

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final courses = const [
    ['Data Structures', 'Dr. Mehta', '4 Credits', Icons.account_tree],
    ['Database Systems', 'Prof. Shah', '3 Credits', Icons.storage],
    ['Artificial Intelligence', 'Dr. Rao', '4 Credits', Icons.psychology],
    ['Computer Networks', 'Prof. Iyer', '3 Credits', Icons.lan],
    ['Web Technology', 'Prof. Patil', '3 Credits', Icons.web],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('My Courses', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        for (final course in courses)
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE5EDFF),
                child: Icon(course[3] as IconData, color: const Color(0xFF246BFD)),
              ),
              title: Text(course[0] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${course[1]} • ${course[2]}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(course[0] as String),
                  content: Text('Instructor: ${course[1]}\n${course[2]}\nStatus: Enrolled'),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 12),
        const CircleAvatar(
          radius: 48,
          child: Text('RS', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 14),
        const Center(child: Text('Kundan Patidar', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
        const Center(child: Text('B.Tech • Computer Science')),
        const SizedBox(height: 28),
        const ProfileItem(icon: Icons.badge_outlined, title: 'Student ID', value: 'STU2026-104'),
        const ProfileItem(icon: Icons.email_outlined, title: 'Email', value: 'kundan.patidar@example.com'),
        const ProfileItem(icon: Icons.school_outlined, title: 'Semester', value: 'Semester 5'),
        const ProfileItem(icon: Icons.calendar_today_outlined, title: 'Academic Year', value: '2026–2027'),
        const SizedBox(height: 18),
        OutlinedButton.icon(
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          ),
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileItem({super.key, required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
