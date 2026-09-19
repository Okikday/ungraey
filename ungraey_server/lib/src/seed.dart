import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

Future<void> seedTesterAccount(Serverpod pod) async {
  final session = await pod.createSession();
  try {
    const email = 'tester@ungraey.com';
    const password = 'tester123';
    const userName = 'Tester';

    var user = await UserInfo.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    if (user == null) {
      user = await Emails.createUser(session, userName, email, password);
      print('Tester account created: $email / $password');
    }

    if (user != null) {
      final hash = await Emails.generatePasswordHash(password);
      var auth = await EmailAuth.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user!.id!),
      );

      if (auth == null) {
        await EmailAuth.db.insertRow(
          session,
          EmailAuth(
            userId: user.id!,
            email: email,
            hash: hash,
          ),
        );
        print('Created EmailAuth entry for $email');
      } else {
        auth.hash = hash;
        auth.email = email;
        await EmailAuth.db.updateRow(session, auth);
        print('Updated password hash for $email');
      }
    }

    // Reset any failed sign-in attempts so the tester account is never locked out
    await EmailFailedSignIn.db.deleteWhere(
      session,
      where: (t) => t.email.equals(email),
    );
  } catch (e) {
    print('Error seeding tester account: $e');
  } finally {
    await session.close();
  }
}
