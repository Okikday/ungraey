import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

Future<void> seedTesterAccount(Serverpod pod) async {
  final session = await pod.createSession();
  try {
    final user = await UserInfo.db.findFirstRow(
      session,
      where: (t) => t.email.equals('tester@ungraey.com'),
    );
    if (user == null) {
      final userInfo = await Emails.createUser(session, 'Tester', 'tester@ungraey.com', 'tester123');
      if (userInfo != null) {
        print('Tester account created: tester@ungraey.com / tester123');
      } else {
        print('Failed to create tester account.');
      }
    } else {
      print('Tester account already exists.');
    }
  } catch (e) {
    print('Error seeding tester account: $e');
  } finally {
    await session.close();
  }
}
