import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sugar/core/database_provider/app_services_database_provider.dart';
import 'package:sugar/core/models/meal_model.dart';
import 'package:sugar/di.dart';
import 'package:sugar/features/auth/ui/login/login.dart';
import 'package:sugar/features/auth/ui/register/register.dart';
import 'package:sugar/features/home/ui/home_wrapper.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/main/ui/main_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/profile/ui/profile_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/pages/emergency_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/pages/meal_planning_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/pages/meal_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/pages/medecation_reminder_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/pages/my_folder.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/pages/my_folder_culumative_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/pages/my_folder_glucose_screen.dart';
import 'package:sugar/features/home/ui/nav_bar_pages/settings/ui/settings_screen.dart';
import 'package:sugar/features/intro/intro_screen.dart';
import 'package:sugar/features/questions/ui/person_details.dart';
import 'package:sugar/features/questions/ui/questions_screen.dart';
import 'core/constants/app_routes.dart';

class AppRouter {
  AppRouter._();
  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorHome');
  static final _shellNavigatorNews = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorNews');
  static final _shellNavigatorAi = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorAi');
  static final _shellNavigatorWatchList = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorWatchList');
  static final _shellNavigatorMore = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorMore');
  static final _shellNavigatorOrders = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorOrders');
  static final _shellNavigatorOptofolio = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorOptofolio');
  static final _shellNavigatorRequests = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorRequests');

  // static final _shellNavigatorSplash = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorSplash');
  // static final _shellNavigatorIntro = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorIntro');
  // static final _shellNavigatorChooseLang = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorChooseLang');
  // static final _shellNavigatorChooseInterests = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorChooseInterests');
  // static final _shellNavigatorSignin = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorSignin');
  // static final _shellNavigatorSignup = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorSignup');
  // static final _shellNavigatorForgetPassword = GlobalKey<NavigatorState>(debugLabel: '_shellNavigatorForgetPassword');

  static GoRouter router = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser != null ? AppRoutes.main : AppRoutes.intro, // FirebaseAuth.instance.currentUser != null ? AppRoutes.main :
    // initialExtra: "/",
    // initialLocation: AppServicesDBprovider.isFirstOpen()
    //     ? AppRoutes.intro
    //     : FirebaseAuth.instance.currentUser != null
    //         ? AppRoutes.main
    //         : AppRoutes.signIn,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    },

    routes: [
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutes.splash,
      //   name: AppRoutes.splash,
      //   builder: (context, state) => SplashScreen(key: state.pageKey),
      // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutes.chooseLang,
      //   name: AppRoutes.chooseLang,
      //   builder: (context, state) => SelectLangScreen(key: state.pageKey),
      // ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.intro,
        name: AppRoutes.intro,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.signIn,
        name: AppRoutes.signIn,
        builder: (context, state) => const Login(),
        pageBuilder: defaultPageBuilder(const Login()),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        builder: (context, state) => const Register(),
        pageBuilder: defaultPageBuilder(const Register()),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.questions,
        name: AppRoutes.questions,
        builder: (context, state) => const QuestionsScreen(),
        pageBuilder: defaultPageBuilder(const QuestionsScreen()),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.personDetails,
        name: AppRoutes.personDetails,
        builder: (context, state) => const PersonDetails(),
        pageBuilder: defaultPageBuilder(const PersonDetails()),
      ),
      StatefulShellRoute.indexedStack(
        // parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return HomeWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            initialLocation: AppRoutes.main,
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.main,
                name: AppRoutes.main,
                builder: (BuildContext context, GoRouterState state) => MainScreen(
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          StatefulShellBranch(navigatorKey: _shellNavigatorWatchList, routes: [
            GoRoute(
              path: '/X',
              name: '/X',
              builder: (context, state) => Container(),
            )
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorMore, routes: [
            GoRoute(
              path: '/Y',
              name: '/Y',
              builder: (context, state) => Container(),
            )
          ]),
          StatefulShellBranch(
            // initialLocation: AppRoutes.news,
            navigatorKey: _shellNavigatorNews,
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoutes.settings,
                  name: AppRoutes.settings,
                  builder: (BuildContext context, GoRouterState state) => SettingsScreen(
                        key: state.pageKey,
                      ),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: AppRoutes.emergency,
                      name: AppRoutes.emergency,
                      builder: (context, state) => const Emergency(),
                      pageBuilder: defaultPageBuilder(const Emergency()),
                    ),
                    GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: AppRoutes.myFolder,
                        name: AppRoutes.myFolder,
                        builder: (context, state) => const MyFolderScreen(),
                        pageBuilder: defaultPageBuilder(const MyFolderScreen()),
                        routes: [
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: AppRoutes.myFolderGlucose,
                            name: AppRoutes.myFolderGlucose,
                            builder: (context, state) => const MyFolderGlucoseScreen(),
                            pageBuilder: defaultPageBuilder(const MyFolderGlucoseScreen()),
                          ),
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: AppRoutes.myFolderCumulative,
                            name: AppRoutes.myFolderCumulative,
                            builder: (context, state) => const MyFolderCumulativeScreen(),
                            pageBuilder: defaultPageBuilder(const MyFolderCumulativeScreen()),
                          )
                        ]),
                    GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: AppRoutes.medicationReminder,
                        name: AppRoutes.medicationReminder,
                        builder: (context, state) => const MedecationReminderScreen(),
                        pageBuilder: defaultPageBuilder(const MedecationReminderScreen()),
                        routes: []),
                    GoRoute(parentNavigatorKey: _rootNavigatorKey, path: AppRoutes.mealPlanning, name: AppRoutes.mealPlanning, builder: (context, state) => const MealPlanningScreen(), routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: AppRoutes.meal,
                        name: AppRoutes.meal,
                        builder: (context, state) => MealScreen(
                          meal: state.extra as Meal,
                        ),
                      )
                    ]),
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAi,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.profile,
                name: AppRoutes.profile,
                builder: (BuildContext context, GoRouterState state) => BlocProvider.value(
                  value: profileCubit..getUserData(),
                  child: ProfileScreen(key: state.pageKey),
                ),
              ),
            ],
          ),

          /// Brach Setting
        ],
      ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutes.profile,
      //   name: AppRoutes.profile,
      //   builder: (context, state) => Profile(),
      //   pageBuilder: defaultPageBuilder(Profile()),
      // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutes.editProfile,
      //   name: AppRoutes.editProfile,
      //   builder: (context, state) => EditProfile(),
      //   pageBuilder: defaultPageBuilder(EditProfile()),
      // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutes.packages,
      //   name: AppRoutes.packages,
      //   builder: (context, state) => Packages(
      //     initialIndex: state.extra as int,
      //   ),
      //   // pageBuilder: defaultPageBuilder(Packages(

      //   // )),
      // ),

      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutesAF.signIn,
      //   name: AppRoutesAF.signIn,
      //   builder: (context, state) => const AfSignInScreen(),
      //   pageBuilder: defaultPageBuilder(const AfSignInScreen()),
      // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutesAF.signUp,
      //   name: AppRoutesAF.signUp,
      //   builder: (context, state) => const AfSignUpScreen(),
      //   pageBuilder: defaultPageBuilder(const AfSignUpScreen()),
      // ),
      // StatefulShellRoute.indexedStack(
      //     builder: (context, state, navigationShell) {
      //       return BlocProvider(
      //         create: (context) => getIt<TransfersCubit>(),
      //         child: TransfersWrapper(
      //           navigationShell: navigationShell,
      //         ),
      //       );
      //     },
      //     branches: [
      //       StatefulShellBranch(navigatorKey: _transfersCashKey, routes: [
      //         GoRoute(
      //           path: AppRoutesAF.transfersCash,
      //           name: AppRoutesAF.transfersCash,
      //           builder: (context, state) {
      //             return TransfersCashTab();
      //           },
      //         )
      //       ]),
      //       StatefulShellBranch(navigatorKey: _transfersStocksKey, routes: [
      //         GoRoute(
      //           path: AppRoutesAF.transfersStocks,
      //           name: AppRoutesAF.transfersStocks,
      //           builder: (context, state) {
      //             return TransfersStocksTab();
      //           },
      //         )
      //       ])
      //     ]),
      // // GoRoute(
      // //   path: "/test",
      // //   builder: (context, state) {
      // //     return AyatTimingWidget();
      // //   },
      // // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutesAF.sell,
      //   name: AppRoutesAF.sell,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => getIt<BuyAndSellCubit>(),
      //     child: SellScreen(
      //       stockAndTPLUSModel: state.extra as StockAndTPLUSModel?,
      //     ),
      //   ),
      //   // pageBuilder: defaultPageBuilder(const SellScreen()),
      // ),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: AppRoutesAF.buy,
      //   name: AppRoutesAF.buy,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => getIt<BuyAndSellCubit>(),
      //     child: BuyScreen(
      //       stock: state.extra as PortfolioItemModel?,
      //     ),
      //   ),
      //   // pageBuilder: defaultPageBuilder(const BuyScreen()),
      // ),
      // StatefulShellRoute.indexedStack(
      //     builder: (context, state, navigationShell) {
      //       return BlocProvider.value(
      //         value: clientCubit,
      //         child: HomeWrapper(
      //           navigationShell: navigationShell,
      //         ),
      //       );
      //     },
      //     branches: [
      //       StatefulShellBranch(navigatorKey: _shellNavigatorGuROW, routes: [
      //         GoRoute(
      //           path: '/X',
      //           name: 'X',
      //           builder: (context, state) => Container(),
      //         )
      //       ]),
      //       StatefulShellBranch(navigatorKey: _shellNavigatorOrders, routes: [
      //         GoRoute(
      //           path: AppRoutesAF.orders,
      //           name: AppRoutesAF.orders,
      //           builder: (context, state) {
      //             return OrdersWrapper();
      //           },
      //         )
      //       ])
      //       // StatefulShellBranch(
      //       //   navigatorKey: _shellNavigatorOrders,
      //       //   routes: [
      //       //     StatefulShellRoute.indexedStack(
      //       //       builder: (context, state, navigationShell) {
      //       //         return OrdersWrapper(
      //       //           navigationShell: navigationShell,
      //       //         );
      //       //       },
      //       //       branches: [
      //       //         StatefulShellBranch(
      //       //           navigatorKey: _allTabKey,
      //       //           routes: [
      //       //             GoRoute(
      //       //               path: AppRoutesAF.allTab,
      //       //               name: AppRoutesAF.allTab,
      //       //               builder: (context, state) => AllOrdersTab(
      //       //                 orders: state.extra as List<Order>,
      //       //               ),
      //       //             ),
      //       //           ],
      //       //         ),
      //       //         StatefulShellBranch(
      //       //           navigatorKey: _completedTabKey,
      //       //           routes: [
      //       //             GoRoute(
      //       //               path: AppRoutesAF.completedTab,
      //       //               name: AppRoutesAF.completedTab,
      //       //               builder: (context, state) => CompletedOrdersTab(
      //       //                 orders: state.extra as List<Order>,
      //       //               ),
      //       //             ),
      //       //           ],
      //       //         ),
      //       //         StatefulShellBranch(
      //       //           navigatorKey: _pendingTabKey,
      //       //           routes: [
      //       //             GoRoute(
      //       //               path: AppRoutesAF.pendingTab,
      //       //               name: AppRoutesAF.pendingTab,
      //       //               builder: (context, state) => PendingOrdersTab(
      //       //                 orders: state.extra as List<Order>,
      //       //               ),
      //       //             ),
      //       //           ],
      //       //         ),
      //       //         StatefulShellBranch(
      //       //           navigatorKey: _canceledTabKey,
      //       //           routes: [
      //       //             GoRoute(
      //       //               path: AppRoutesAF.canceledTab,
      //       //               name: AppRoutesAF.canceledTab,
      //       //               builder: (context, state) => CanceledOrdersTab(
      //       //                 orders: state.extra as List<Order>,
      //       //               ),
      //       //             ),
      //       //           ],
      //       //         ),
      //       //       ],
      //       //     ),
      //       //   ],
      //       // ),
      //       ,
      //       StatefulShellBranch(navigatorKey: _shellNavigatorOptofolio, routes: [
      //         GoRoute(
      //           path: AppRoutesAF.portfolio,
      //           name: AppRoutesAF.portfolio,
      //           builder: (context, state) => PortfolioScreen(),
      //         )
      //       ]),
      //       StatefulShellBranch(initialLocation: AppRoutesAF.depositTab, navigatorKey: _shellNavigatorRequests, routes: [
      //         StatefulShellRoute.indexedStack(
      //           builder: (context, state, navigationShell) {
      //             return RequestsWrapper(
      //               navigationShell: navigationShell,
      //             );
      //           },
      //           branches: [
      //             StatefulShellBranch(navigatorKey: _depositTabKey, routes: [
      //               GoRoute(
      //                 path: AppRoutesAF.depositTab,
      //                 name: AppRoutesAF.depositTab,
      //                 builder: (context, state) => DepositTab(),
      //               ),
      //             ]),
      //             StatefulShellBranch(navigatorKey: _withdrawalTabKey, routes: [
      //               GoRoute(
      //                 path: AppRoutesAF.withdrawalTab,
      //                 name: AppRoutesAF.withdrawalTab,
      //                 builder: (context, state) => WithdrawalTab(),
      //               ),
      //             ]),
      //             StatefulShellBranch(navigatorKey: _blockStockTabKey, routes: [
      //               GoRoute(
      //                 path: AppRoutesAF.blockStockTab,
      //                 name: AppRoutesAF.blockStockTab,
      //                 builder: (context, state) => BlockStockTab(),
      //               ),
      //             ]),
      //             StatefulShellBranch(navigatorKey: _tPlusZeroTabKey, routes: [
      //               GoRoute(
      //                 path: AppRoutesAF.tPlusZeroTab,
      //                 name: AppRoutesAF.tPlusZeroTab,
      //                 builder: (context, state) => TPlusZeroTab(),
      //               ),
      //             ]),
      //             StatefulShellBranch(navigatorKey: _complainTabKey, routes: [
      //               GoRoute(
      //                 path: AppRoutesAF.complainTab,
      //                 name: AppRoutesAF.complainTab,
      //                 builder: (context, state) => ComplainTab(),
      //               ),
      //             ]),
      //             StatefulShellBranch(navigatorKey: _suggestionTabKey, routes: [
      //               GoRoute(
      //                 path: AppRoutesAF.suggestionTab,
      //                 name: AppRoutesAF.suggestionTab,
      //                 builder: (context, state) => SuggestionTab(),
      //               ),
      //             ]),
      //           ],
      //         )
      //       ]),
      //       StatefulShellBranch(navigatorKey: _shellNavigatorMore, routes: [
      //         GoRoute(
      //           path: '/Y',
      //           name: '/Y',
      //           builder: (context, state) => Container(),
      //         )
      //       ]),
      //     ]),
      // GoRoute(
      //   path: AppRoutesAF.myStatement,
      //   name: AppRoutesAF.myStatement,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => getIt<MyStatementCubit>(),
      //     child: MyStatementScreen(),
      //   ),
      //   // pageBuilder: defaultPageBuilder(const MyStatementScreen()),
      // ),
      // GoRoute(
      //     path: AppRoutesAF.myInvoice,
      //     name: AppRoutesAF.myInvoice,
      //     builder: (context, state) => BlocProvider(
      //           create: (context) => getIt<InvoicesCubit>(),
      //           child: MyInvoiceScreen(),
      //         ),
      //     routes: [
      //       GoRoute(
      //           path: AppRoutesAF.myInvoiceDetails,
      //           name: AppRoutesAF.myInvoiceDetails,
      //           builder: (context, state) {
      //             final dateformat = DateFormat("dd-MM-yyyy");
      //             return BlocProvider.value(
      //               value: state.extra as InvoicesCubit,
      //               child: MyInvoiceDetailsScreen(
      //                 fromDatetime: dateformat.parse(state.uri.queryParameters['fromDatetime']!),
      //                 toDatetime: dateformat.parse(
      //                   state.uri.queryParameters['toDatetime']!,
      //                 ),
      //                 // cubit: state.extra as InvoicesCubit,
      //               ),
      //             );
      //           }),
      //     ])
    ],
  );
}

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(Widget child) => (BuildContext context, GoRouterState state) {
      return _buildPageWithDefaultTransition<T>(
        context: context,
        state: state,
        child: child,
      );
    };
