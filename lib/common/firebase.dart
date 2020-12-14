import 'package:bustap/common/packages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: secondaryApp);