// ignore_for_file: prefer_const_constructors

import 'package:auth_playground/Shared/exports.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthServices().user,
      initialData: null,
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(360, 800),
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Wrapper(),
          ),
        ),
      ),
    );
  }
}
