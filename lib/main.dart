import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/amplifyconfiguration.dart';

import 'screens/home.dart';

import 'package:amplify_storage_s3/amplify_storage_s3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(const MyApp());
}

Future<void> configureAmplify() async {
  try {
    await Amplify.addPlugins([AmplifyStorageS3()]);
    await Amplify.configure(amplifyconfig);
    print('Successfully configured Amplify');
  } catch (e) {
    print('Failed to configure Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
