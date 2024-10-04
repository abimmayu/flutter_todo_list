import 'package:go_router/go_router.dart';
import 'package:todo_list/feature/checklist/presentation/screen/checklist_detail_screen.dart';
import 'package:todo_list/feature/checklist/presentation/screen/checklist_screen.dart';
import 'package:todo_list/feature/checklist/presentation/screen/create_checklist_screen.dart';
import 'package:todo_list/feature/checklist/presentation/screen/create_item_screen.dart';
import 'package:todo_list/feature/checklist/presentation/screen/detail_item_screen.dart';
import 'package:todo_list/feature/login/presentation/screen/login_screen.dart';
import 'package:todo_list/feature/login/presentation/screen/register_screen.dart';

enum AppRoute {
  loginScreen,
  registerScreen,
  checklistScreen,
  createChecklistScreen,
  detailChecklistScreen,
  createItemScreen,
  detailItemScreen,
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.loginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: AppRoute.registerScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/checklist',
      name: AppRoute.checklistScreen.name,
      builder: (context, state) => const ChecklistScreen(),
      routes: [
        GoRoute(
          path: 'create',
          name: AppRoute.createChecklistScreen.name,
          builder: (context, state) => const CreateChecklistScreen(),
        ),
        GoRoute(
          path: 'detail-checklist',
          name: AppRoute.detailChecklistScreen.name,
          builder: (context, state) {
            return const ChecklistDetailScreen(
              checklistTitle: 'Ini detail',
              items: ['Item 1', 'Item 2', 'Item 3'],
            );
          },
          routes: [
            GoRoute(
              path: 'create-item',
              name: AppRoute.createItemScreen.name,
              builder: (context, state) => const CreateItemScreen(),
            ),
            GoRoute(
              path: 'detail-item',
              name: AppRoute.detailItemScreen.name,
              builder: (context, state) => ItemDetailScreen(
                title: 'Ini detail item',
                description: 'Ini deskripsi item',
                dueDate: DateTime.now(),
                priority: 1,
                isCompleted: false,
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
