import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taia_care/src/constants/constants.dart';
import 'package:flutter_taia_care/src/localization/app_localizations.dart';
import 'package:flutter_taia_care/src/preferences/shared_pref.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/about.dart';
import 'package:flutter_taia_care/src/ui/account_registration.dart';
import 'package:flutter_taia_care/src/ui/add_medication.dart';
import 'package:flutter_taia_care/src/ui/connect_doctor.dart';
import 'package:flutter_taia_care/src/ui/dashboard.dart';
import 'package:flutter_taia_care/src/ui/delete_account.dart';
import 'package:flutter_taia_care/src/ui/doctor_appointments.dart';
import 'package:flutter_taia_care/src/ui/doctor_appointments_detail.dart';
import 'package:flutter_taia_care/src/ui/feedback.dart' as prefix0;
import 'package:flutter_taia_care/src/ui/general_information.dart';
import 'package:flutter_taia_care/src/ui/homepage.dart';
import 'package:flutter_taia_care/src/ui/intro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_taia_care/src/ui/login.dart';
import 'package:flutter_taia_care/src/ui/medication.dart';
import 'package:flutter_taia_care/src/ui/medicine_details.dart';
import 'package:flutter_taia_care/src/ui/messages_doctor.dart';
import 'package:flutter_taia_care/src/ui/notification_settings.dart';
import 'package:flutter_taia_care/src/ui/request_data.dart';
import 'package:flutter_taia_care/src/ui/reset_password.dart';
import 'package:flutter_taia_care/src/ui/send_feedback.dart';
import 'package:flutter_taia_care/src/ui/set_doctor_appointments.dart';
import 'package:flutter_taia_care/src/ui/settings.dart';
import 'package:flutter_taia_care/src/ui/share_report.dart';
import 'package:flutter_taia_care/src/ui/treatment_plan.dart';
import 'package:flutter_taia_care/src/ui/user_account.dart';
import 'package:flutter_taia_care/src/ui/your_doctor.dart';
import 'package:flutter_taia_care/src/ui/your_profile.dart';


// ignore: must_be_immutable
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

/*  static void setLocale(BuildContext context, Locale newLocale) async {
    Prefs.setLocale(newLocale).then((_) {
      print('setLocale()');
      _MyAppState state =
      context.ancestorStateOfType(TypeMatcher<_MyAppState>());

      state.setState(() {
        state.locale = newLocale;
      });
    });
  }

  static Locale getLocale(BuildContext context) {
    print('getLocale()');
    _MyAppState state = context.ancestorStateOfType(TypeMatcher<_MyAppState>());

    return state.locale;
  }*/
}

class _MyAppState extends State<MyApp> {
  Locale locale;
  bool localeLoaded = false;

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._fetchLocale().then((locale) {
      print('LANGUAGE_CODE_1: ${locale?.languageCode}');
      print('COUNTRY_CODE_1: ${locale?.countryCode}');
      if (locale == null) locale = Locale(Constant.LANG_GERMAN, '');
      Prefs.setLocale(locale);
      setState(() {
        print('LANGUAGE_CODE_11: ${locale?.languageCode}');
        print('COUNTRY_CODE_11: ${locale?.countryCode}');
        this.localeLoaded = true;
        this.locale = locale;
      });
    });
  }

  _fetchLocale() async {
    await Prefs.init();
    Locale locale = Prefs.getLocale();
    print('LANGUAGE_CODE: ${locale.languageCode}');
    print('COUNTRY_CODE: ${locale.countryCode}');
    return locale;
  }*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Styles.taiaGreen,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light, //or set color with: Color(0xFF0000FF)
    ));
    return Center(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Styles.taiaGreen,
              primaryColor: Styles.taiaGreen,
            primaryColorDark: Styles.taiaGreen,
            cursorColor: Styles.taiaGreen
        ),
        title: 'Taia Care',
       /* theme: ThemeData(
          primaryColorDark: Styles.blueColor,
          primaryColor: Styles.blueColor,
          accentColor: Colors.lightGreen,
          fontFamily: Platform.isIOS?'Almarai':'FA',
        ),*/
   /*     localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalCupertinoLocalizations.delegate,
//          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale(Constant.LANG_GERMAN, ''), // Arabic
          const Locale(Constant.LANG_ENGLISH, ''), // English
        ],
        locale: locale,*/
        routes: <String, WidgetBuilder>{
          Constant.HOMEPAGE: (BuildContext context) => HomePage(),
          Constant.INTRO: (BuildContext context) => IntroSlider(),
          Constant.REGISTER: (BuildContext context) => RegisterAccount(),
          Constant.LOGIN: (BuildContext context) => Login(),
          Constant.DASHBOARD: (BuildContext context) => Dashboard(),
          Constant.RESETPASSWORD: (BuildContext context) => ResetPassword(),
          Constant.YOURPROFILE: (BuildContext context) => YourProfile(),
          Constant.GENERALINFORMATION: (BuildContext context) => GeneralInformation(),
          Constant.MEDICATION: (BuildContext context) => Medication(),
          Constant.MEDICINEDETAILS: (BuildContext context) => MedicineDetails(),
          Constant.YOURDOCTOR: (BuildContext context) => YourDoctor(),
          Constant.SETTINGS: (BuildContext context) => Settings(),
          Constant.FEEDBACK: (BuildContext context) => prefix0.Feedback(),
          Constant.ABOUT: (BuildContext context) => About(),
          Constant.SENDFEEDBACK: (BuildContext context) => SendFeedBack(),
          Constant.USERACCOUNT: (BuildContext context) => UserAccount(),
          Constant.REQUESTDATA: (BuildContext context) => RequestData(),
          Constant.DELETEACCOUNT: (BuildContext context) => DeleteAccount(),
          Constant.DOCTORAPPOINTMENTS: (BuildContext context) => DoctorAppointments(),
          Constant.DOCTORAPPOINTMENTSDETAILS: (BuildContext context) => DoctorAppointmentDetails(),
          Constant.SETDOCTORAPPOINTMENTS: (BuildContext context) => SetDoctorAppointments(),
          Constant.MESSAGESDOCTOR: (BuildContext context) => MessagesDoctor(),
          Constant.SHAREREPORT: (BuildContext context) => ShareReport(),
          Constant.CONNECTDOCTOR: (BuildContext context) => ConnectDoctor(),
          Constant.NOTIFICATIONSETTINGS: (BuildContext context) => NotificationSettings(),
          Constant.ADDMEDICATION: (BuildContext context) => AddMedication(),
          Constant.TREATMENTPLAN: (BuildContext context) => TreatmentPlan(),

        },
        initialRoute: Constant.INTRO,
      )

    );
  }


}
