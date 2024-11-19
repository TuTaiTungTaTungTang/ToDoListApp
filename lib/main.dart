<<<<<<< HEAD
import 'package:ct484_project/constants/colors.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/user.dart'; // Đảm bảo import trang User
import './shared/app_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: tdBGColor,
          title: Center(
            child: Text(
              'To Do List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24, // Kích thước chữ lớn hơn
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserPage(), // Chuyển đến trang User
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Bo góc
                child: Image.asset(
                  'assets/images/z5454229034776_1d84ce7f2709be82c56d968a422066ef.jpg', // Thay đường dẫn hình ảnh của bạn
                  height: 40, // Chiều cao hình ảnh
                  width: 40, // Chiều rộng hình ảnh
                ),
              ),
            ),
          ],
        ),
        backgroundColor: tdBGColor,
        drawer: AppDrawer(),
        body: Home(),
      ),
=======
import 'package:ct484_project/auth/main_page.dart';
import 'package:ct484_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

/// Import HiveDataStore và Model Task
import '../data/hive_data_store.dart';
import '../models/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Khởi tạo Firebase
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Lỗi khởi tạo Firebase: $e");
  }

  /// Khởi tạo Hive
  await Hive.initFlutter();

  /// Đăng ký Adapter cho Hive
  Hive.registerAdapter<Task>(TaskAdapter());
  Hive.registerAdapter<UserProfile>(
      UserProfileAdapter()); // Đăng ký UserProfile

  /// Mở box Hive
  final box = await Hive.openBox<Task>("tasksBox");
  await Hive.openBox<UserProfile>('userProfileBox'); // Mở box UserProfile

  /// Đồng bộ hóa dữ liệu từ Firebase sang Hive
  final dataStore = HiveDataStore();
  await dataStore.syncFromFirebase();

  runApp(BaseWidget(child: const MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({super.key, required this.child}) : super(child: child);

  /// Khởi tạo HiveDataStore để quản lý dữ liệu
  final HiveDataStore dataStore = HiveDataStore();

  @override
  // ignore: overridden_fields
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Không tìm thấy widget BaseWidget.');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light); // Giá trị mặc định là Light Mode

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TO DO LÍT APP',
          theme: ThemeData(
            scaffoldBackgroundColor:
                Colors.white, // Nền sáng cho toàn bộ ứng dụng
            primaryColor: Colors.blue,
            brightness: Brightness.light,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: Colors.black,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),
              displaySmall: TextStyle(
                color: Color.fromARGB(255, 234, 234, 234),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              headlineMedium: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
              headlineSmall: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              titleSmall: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.black,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black, // Màu nền cho Dark Mode
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: Colors.black,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              displayMedium: TextStyle(
                color: Colors.black,
                fontSize: 21,
              ),
              displaySmall: TextStyle(
                color: Color.fromARGB(255, 200, 200, 200),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              headlineMedium: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
              headlineSmall: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              titleSmall: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          themeMode: currentMode,
          home: const Main_Page(),
        );
      },
>>>>>>> f786b41 (update project final)
    );
  }
}
