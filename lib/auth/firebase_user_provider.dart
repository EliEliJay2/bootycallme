import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BootyCallMeFirebaseUser {
  BootyCallMeFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BootyCallMeFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BootyCallMeFirebaseUser> bootyCallMeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BootyCallMeFirebaseUser>(
      (user) {
        currentUser = BootyCallMeFirebaseUser(user);
        return currentUser!;
      },
    );
