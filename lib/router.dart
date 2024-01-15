import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sik_baitulhikmah/features/dsp_spp/dsp_spp_page.dart';
import 'package:sik_baitulhikmah/features/pemasukan/pemasukan_page.dart';
import 'package:sik_baitulhikmah/features/pengeluaran/pengeluaran_page.dart';
import 'package:sik_baitulhikmah/features/rekap_kas/pemasukan_page.dart';
import 'package:sik_baitulhikmah/features/users/user_not_found_page.dart';
import 'package:sik_baitulhikmah/widgets/navigation/login_page.dart';

import 'features/dashboard/dashbord_page.dart';
import 'features/users/dummy_users.dart';
import 'features/users/user_page.dart';
import 'features/users/users_page.dart';
import 'widgets/widgets.dart';

part 'router.g.dart';

const routerInitialLocation = '/';

final router = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: kDebugMode,
  initialLocation: routerInitialLocation,
);

@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DashboardRoute>(
          path: '/dashboard',
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<UsersPageRoute>(
          path: '/users',
          routes: [
            TypedGoRoute<UserPageRoute>(
              path: ':userId',
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<PemasukanPageRoute>(
          path: '/pemasukan',
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<PengeluaranPageRoute>(
          path: '/pengeluaran',
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DspSppPageRoute>(
          path: '/dspdanspp',
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<RekapKasPageRoute>(
          path: '/rekapkas',
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DspSppPageRoute>(
          path: '/dspdanspp',
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<SignInPageRoute>(
          path: routerInitialLocation,
        ),
      ],
    ),
  ],
)
class ShellRouteData extends StatefulShellRouteData {
  const ShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return SelectionArea(
      child: ScaffoldWithNavigation(
        navigationShell: navigationShell,
      ),
    );
  }
}

class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashBoardPage();
  }
}

class DspSppPageRoute extends GoRouteData {
  const DspSppPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DspSppPage();
  }
}

class UsersPageRoute extends GoRouteData {
  const UsersPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UsersPage();
  }
}

class PemasukanPageRoute extends GoRouteData {
  const PemasukanPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PemasukanPage();
  }
}

class UserPageRoute extends GoRouteData {
  const UserPageRoute({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final user = dummyUsers.firstWhereOrNull((e) => e.userId == userId);
    return user == null
        ? UserNotFoundPage(userId: userId)
        : UserPage(user: user);
  }
}

class PengeluaranPageRoute extends GoRouteData {
  const PengeluaranPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PengeluaranPage();
  }
}

class RekapKasPageRoute extends GoRouteData {
  const RekapKasPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RekapKasPage();
  }
}

class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}
