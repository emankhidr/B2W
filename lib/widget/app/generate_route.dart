import 'package:b2w/widget/app/routes_name.dart';
import 'package:flutter/material.dart';
import '../../features/chats/presentation/pages/contact_page.dart';
import '../../features/company_profile/presentation/pages/accessability_settings.dart';
import '../../features/company_profile/presentation/pages/company_profile.dart';
import '../../features/company_profile/presentation/pages/edit_about.dart';
import '../../features/company_profile/presentation/pages/followers.dart';
import '../../features/company_profile/presentation/pages/languge.dart';
import '../../features/company_profile/presentation/pages/settings_page.dart';
import '../../features/home/presentation/pages/add_people.dart';
import '../../features/home/presentation/pages/employee_app_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/job_app_page.dart';
import '../../features/home/presentation/pages/notification_page.dart';
import '../../features/home/presentation/pages/search_page.dart';
import '../../features/home/presentation/pages/user_profile_page.dart';
import '../../features/upload_jobs/presentation/pages/add_post_page.dart';
import '../../views/splash/splash_screen.dart';


class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splachScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.HomePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.CompanyProfile:
        return MaterialPageRoute(builder: (_) => CompanyProfile());
      case Routes.UserProfile:
        return MaterialPageRoute(builder: (_) => UserProfile());
      case Routes.LanguageSelectionScreen:
        return MaterialPageRoute(builder: (_) => LanguageSelectionScreen());
      case Routes.SettingsPage:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case Routes.AddPeopleScreen:
        return MaterialPageRoute(builder: (_) => AddPeopleScreen());
      case Routes.NotificationsPage:
        return MaterialPageRoute(builder: (_) => NotificationsPage());
      case Routes.PostJobPage:
        return MaterialPageRoute(builder: (_) => PostJobPage());
      case Routes.AccessibilitySettingsPage:
        return MaterialPageRoute(builder: (_) => AccessibilitySettingsPage());
      case Routes.ApplicationDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => ApplicationDetailsScreen(
                  applicant: {},
                ));

      case Routes.ContactsPage:
        return MaterialPageRoute(builder: (_) => ContactsPage());
      case Routes.EditAboutPage:
        return MaterialPageRoute(builder: (_) => EditAboutPage());
      case Routes.FollowersScreen:
        return MaterialPageRoute(builder: (_) => FollowersScreen());
      case Routes.JobApplicationsScreen:
        return MaterialPageRoute(builder: (_) => JobApplicationsScreen());

      case Routes.SearchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case Routes.AddPeopleScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.splachScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.splachScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.splachScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("حدث خطأ"),
              ),
              body: Center(child: Text("0000000")),
            ));
  }
}
