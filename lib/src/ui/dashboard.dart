import 'package:flutter/material.dart';
import 'package:flutter_taia_care/src/provider/dashboard_viewmodel.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/homepage.dart';
import 'package:flutter_taia_care/src/ui/knowledge.dart';
import 'package:flutter_taia_care/src/ui/library.dart';
import 'package:flutter_taia_care/src/ui/more.dart';
import 'package:flutter_taia_care/src/utils/base_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

//  static FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int noticeCount =0;

  List<Widget> bottomNav = [
    HomePage(),
    Knowledge(),
    Library(),
    More(),
  ];

  ScrollController _hideButtonController;

  var _isVisible = true;

//  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  double _width;
  double _height;
  List<int> list;
  List<String> category;
  List<String> notificationTitle;



  int currentIndex;
//  FilterParams params;
/*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project

    var initializationSettingsAndroid =
    new AndroidInitializationSettings('ic_stat_ic_notification');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    //scheduleNotification();

    _hideButtonController = ScrollController();


    Future.delayed(Duration.zero, () {
      this.firebaseCloudMessagingListeners(context);
      //scheduledNotification();
    });
*//*
    Future.delayed(Duration.zero, () {

    });*//*


  }*/

/*  void scheduledNotification(){
    print("Scheduled notification Method");
    int minutesIncrement = 5;
    category=[
      AppLocalizations.of(context).carBikesLabel,
      AppLocalizations.of(context).servicesCategoryLabel,
      AppLocalizations.of(context).realEstateLabel,
      AppLocalizations.of(context).phoneTabletsLabel,
      AppLocalizations.of(context).electronicsAppliancesLabel,
      AppLocalizations.of(context).videoGamesLabel,
      AppLocalizations.of(context).womenFashionCategoryLabel,
      AppLocalizations.of(context).babyKidsCategoryLabel,
      AppLocalizations.of(context).menFashionCategoryLabel,
      AppLocalizations.of(context).foodSupplementsCategoryLabel,
      AppLocalizations.of(context).jobCategoryLabel,
      AppLocalizations.of(context).petsCategoryLabel,
      AppLocalizations.of(context).funnyAdsCategoryLabel,
      AppLocalizations.of(context).booksSportsCategoryLabel,
    ];
    notificationTitle=[
      AppLocalizations.of(context).sellBuyTradeLabel,
      AppLocalizations.of(context).oldpazarTurkeyLabel,
      AppLocalizations.of(context).sellerOnlineLabel,
      AppLocalizations.of(context).sellerOnlineLabel,
      AppLocalizations.of(context).sellingEasilyLabel,
    ];

    list = new List.generate(5, (int index) => index); // [0, 1, 4]
    list.shuffle();
    print("Shuffled integer list: $list");

    category.shuffle();
    print("Shuffled category list: $category");

    notificationTitle.shuffle();
    print("Shuffled notification title list: $notificationTitle");

    for(int i=0;i<list.length; i++){
      print("List length: ${list.length}");


      String notificationBody(){
        switch(list[i]){
          case 0: {
            //notifications.add(Notifications(title: notificationTitle[0],body:AppLocalizations.of(context).missedYouLabel ));
            return AppLocalizations.of(context).missedYouLabel;
          } case 1: {
          //notifications.add(Notifications(title: notificationTitle[1],body:AppLocalizations.of(context).continueBrowsingLabel ));
          return AppLocalizations.of(context).continueBrowsingLabel;
        } case 2: {
          //notifications.add(Notifications(title: notificationTitle[2],body:AppLocalizations.of(context).fiveSecondsLabel ));
          return AppLocalizations.of(context).fiveSecondsLabel;
        } case 3: {
          //notifications.add(Notifications(title: notificationTitle[3],body:AppLocalizations.of(context).biggestArabLabel ));
          return AppLocalizations.of(context).biggestArabLabel;
        } case 4: {
          //notifications.add(Notifications(title: notificationTitle[4],body:"${AppLocalizations.of(context).continueBrowsingCategoryLabel} ${category[i]}. ${AppLocalizations.of(context).newThingsAddedLabel}" ));
          return "${AppLocalizations.of(context).continueBrowsingCategoryLabel} ${category[i]}. ${AppLocalizations.of(context).newThingsAddedLabel}";
        }
          default: {
            return '';
          }
        } }
      var scheduledNotificationDateTime = new DateTime.now().add(new Duration(minutes: minutesIncrement));
      flutterLocalNotificationsPlugin.schedule(
        i,
        notificationTitle[i],
        notificationBody(),
        scheduledNotificationDateTime,
        _ongoing,
        androidAllowWhileIdle: true,
      );
      Future.delayed(Duration(minutes: minutesIncrement),() {
        print("Adding notification to the notification list");
        notifications.add(Notifications(title: notificationTitle[i],body: notificationBody()));
        //Provider.of<DashboardProvider>(context).setNotifications(notifications);

      });
      minutesIncrement= minutesIncrement+5;



    }


  }*/

/*  flutterLocalNotificationsPlugin.schedule(
  0,
  'Hello',
  'This is schedule notification',
  scheduledNotificationDateTime,
  _ongoing);*/

 /* NotificationDetails get _ongoing {
    final androidChannelSpecifics = AndroidNotificationDetails(
        'OldPazar',
        'OldPazar',
        'your channel description',
        importance: Importance.Low,
        priority: Priority.Low,
        ongoing: true,
        style: AndroidNotificationStyle.BigText,
        channelAction: AndroidNotificationChannelAction.CreateIfNotExists

    );
    final iOSChannelSpecifics = IOSNotificationDetails();
    return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
  }*/

  /*Future scheduleNotification() async{
    print("Scheduled notification Method");


      var scheduledNotificationDateTime = new DateTime.now().add(new Duration(seconds: 5));
      await flutterLocalNotificationsPlugin.schedule(
          2,
          'Hello',
          'This is schedule notification',
          scheduledNotificationDateTime,
          _ongoing);



  }*/

 /* Future showOngoingNotification(
      FlutterLocalNotificationsPlugin notifications, {
        @required String title,
        @required String body,
        int id = 0,
      }) =>
      _showNotification(notifications,
          title: title, body: body, id: id, type: _ongoing);

  Future _showNotification(
      FlutterLocalNotificationsPlugin notifications, {
        @required String title,
        @required String body,
        @required NotificationDetails type,
        int id = 0,
      }) =>
      notifications.show(id, title, body, type);*/




/*  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locator<DashboardProvider>().getDashboardAds(
        Prefs.getUserID()!=null? Prefs.getUserID():'',
        '',
        params != null ? params.regionID : Prefs.getRegionId(),
        '',
        Prefs.getLanguageCode(Constant.LANG_ARABIC),
        Prefs.getToken());
  }*/

  @override
  Widget build(BuildContext context) {
    currentIndex = ModalRoute.of(context).settings.arguments;

    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;





    return BaseView<DashboardProvider>(
        onModelReady: (model) => null,/*locator<DashboardProvider>().getDashboardAds(
            Prefs.getUserID()!=null? Prefs.getUserID():'',
            '',
            params != null ? params.regionID : Prefs.getRegionId(),
            '',
            Prefs.getLanguageCode(Constant.LANG_ARABIC),
            Prefs.getToken()),*/
        builder: (context, model, child) {
          print('Current index: $currentIndex');

        /*  if (currentIndex != null) {
            model.currentTab = currentIndex;
            model.bottomBarStateManagement.clear();
            currentIndex = null;
          }*/

          return WillPopScope(
            onWillPop: () async {
              if (model.bottomBarStateManagement == null ||
                  model.bottomBarStateManagement.length == 0)
                return true;
              else if (model.bottomBarStateManagement.length == 1) {
                model.currentTab = 0;
                model.bottomBarStateManagement.removeLast();
                return false;
              } else {
                model.bottomBarStateManagement.removeLast();
                model.currentTab = model.bottomBarStateManagement[
                model.bottomBarStateManagement.length - 1];
                print("BottomBar State Mangement:${model.bottomBarStateManagement}");
                return false;
              }
            },
            child: Scaffold(
              key: _scaffoldKey,
              body: bottomNav[model.currentTab],
              backgroundColor: Colors.white,
              bottomNavigationBar: SizedBox(
                height: _height/10,
                child: !_isVisible
                    ? SizedBox()
                    : BottomNavigationBar(
                    selectedItemColor: Styles.taiaGreen,
                    onTap: (index) {
                   if (index == 0) {
                        model.currentTab = 0;
                        model.bottomBarStateManagement.clear();
                      }
                   else {
                          if (model.currentTab != index) {
                            model.currentTab = index;
                            model.bottomBarStateManagement.add(index);
                          }

                      }
                      print(model.bottomBarStateManagement);
                    },
                    showUnselectedLabels: true,
                    currentIndex: model.currentTab,
                    //fixedColor: Colors.blue,
                    type: BottomNavigationBarType.fixed,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: model.currentTab == 0?Styles.taiaGreen:Colors.grey
                          ),
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          "Taia",
                          style: TextStyle(
                            fontSize: _width / 32,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.chartBar,
                        ),
                        title: Text(
                         "Erkenntnisse",
                          style: TextStyle(
                            fontSize: _width / 32,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.book
                        ),
                        title: Text(
                         "Bibliothek",
                          style: TextStyle(
                            fontSize: _width / 32,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.ellipsisH
                        ),
                        title: Text(
                          "Mehr",
                          style: TextStyle(
                            fontSize: _width / 32,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }

/*  void firebaseCloudMessagingListeners(BuildContext cntxt) {

    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device token: $deviceToken");
      Prefs.setDeviceToken(deviceToken);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        print('on message ${message['data']['title']}');
        print('on message ${message['data']['body']}');
        print('on message ${message['data']['type']}');
        message['data']['image']!=null?print('on message ${message['data']['image']}'):null;

        *//*if(message['data']['params']!=null){

          print('on message ${message['data']['params']}');
          print('Test 1');
          //print('on resume params:  ${message['data']['params']['ad_id']}');

          var paramsData=message['data']['params'];
          print('PARAMS: $paramsData');

          Params notificationParams=Params.fromJson(json.decode(paramsData));

          print('Test 2');
          print('PARAMS: ${notificationParams.toJson()}');


          var adId=notificationParams.adId;
          var recipientId=notificationParams.recipientId;


          print('AD ID: $adId');
          print('User ID: $recipientId');
        } else{
          print('on message ${message['data']['type']}');
        }*//*




        *//* if(message['data']['type']=="chat_user"){
          print("Comment");
          //Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
          Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments: MessageParams(Prefs.getUserID(),recipientId, adId));
        }*//*
        switch(message['data']['type']){
          case 'chat_user':{
            print("Chat User");
            locator<DashboardProvider>().getDashboardAds(
                Prefs.getUserID()!=null? Prefs.getUserID():'',
                '',
                params != null ? params.regionID : Prefs.getRegionId(),
                '',
                Prefs.getLanguageCode(Constant.LANG_ARABIC),
                Prefs.getToken());

            showOngoingNotification(flutterLocalNotificationsPlugin, title: message['notification']['title'], body: message['notification']['title']);
            //Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments: MessageParams(Prefs.getUserID(),recipientId, adId));
            break;
          }
          case 'chat_support': {
            //Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments:  MessageParams(Prefs.getUserID(), recipientId, adId));
            break;
          }
          case "promotion": {
            // Navigator.of(cntxt).pushNamedAndRemoveUntil(Constant.DASHBOARD, (Route<dynamic> route) => false,arguments: 3);
            break;
          }
          case "ad_rejected":{

            showOngoingNotification(flutterLocalNotificationsPlugin, title:message['notification']['title'], body: message['notification']['title']);
            //Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_edited":{
            print('Ad Edited');
            showOngoingNotification(flutterLocalNotificationsPlugin, title: message['notification']['title'], body: message['notification']['body']);
            print("Adding notification to the notification list");
            notifications.add(Notifications(title:  message['notification']['title'],body: message['notification']['body']));
            //Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_inactive":{

            showOngoingNotification(flutterLocalNotificationsPlugin, title: message['notification']['title'], body: message['notification']['title']);
            // Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_expiration":{

            showOngoingNotification(flutterLocalNotificationsPlugin, title: message['notification']['title'], body:message['notification']['title']);
            //Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_expired":{

            showOngoingNotification(flutterLocalNotificationsPlugin, title: message['notification']['title'], body: message['notification']['title']);
            // Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "comment":{
            print("comment");

            showOngoingNotification(flutterLocalNotificationsPlugin, title: message['notification']['title'], body: message['notification']['title']);
            // Navigator.of(cntxt).pushNamed(Constant.SHOW_AD_SCREEN, arguments: adId);
            break;
          }
          case "custom":{
            showOngoingNotification(flutterLocalNotificationsPlugin, title: message['notification']['title'], body: message['notification']['title']);
            print("Adding notification to the notification list");
            // DashboardProvider().setNotifications(["custom"]);
            setState(() {
              noticeCount++;
            });
            message['data']['title']!=null?notifications.insert(0,Notifications(title:  message['notification']['title'],body: message['notification']['body'],image: message['data']['image'])):null;
            // Prefs.setNotificationsTitle(notifications);
            break;
          }
          default: {

          }
        }


      },

      onResume: (Map<String, dynamic> message) async {
        print('on resume mesage $message');
        //print('on resume ${message['data']}');
        print('on resume params ${message['data']['params']}');
        print('on resume title ${message['data']['title']}');
        print('on resume body ${message['data']['body']}');
        print('on resume Image ${message['data']['image']}');
        print('on resume type ${message['data']['type']}');

        print('Test 1');
        var adId;
        var recipientId;
        //print('on resume params:  ${message['data']['params']['ad_id']}');

        if(message['data']['params']!=null){
          var paramsData=message['data']['params'];

          print('PARAMS: $paramsData');

          Params params=Params.fromJson(json.decode(paramsData));

          print('Test 2');
          print('PARAMS: ${params.toJson()}');


          adId=params.adId;
          recipientId=params.recipientId;


          print('AD ID: $adId');
          print('User ID: $recipientId');
        }


        *//* if(message['data']['type']=="chat_user"){
          print("Comment");
          //Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
          Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments: MessageParams(Prefs.getUserID(),recipientId, adId));
        }*//*
        switch(message['data']['type']){
          case 'chat_user':{
            print("Chat User");
            Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments: MessageParams(Prefs.getUserID(),recipientId, adId));
            break;
          }
          case 'chat_support': {
            Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments:  MessageParams(Prefs.getUserID(), recipientId, adId));
            break;
          }
          case "promotion": {
            Navigator.of(cntxt).pushNamedAndRemoveUntil(
                Constant.DASHBOARD, (Route<dynamic> route) => false,arguments: 3);
            break;
          }
          case "ad_rejected":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_edited":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_inactive":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_expiration":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_expired":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "comment":{
            print("comment");
            Navigator.of(cntxt).pushNamed(
                Constant.SHOW_AD_SCREEN, arguments: FilterParams(adID: adId));
            break;
          }
          case "custom":{
            print("Adding notification to the notification list");
            //DashboardProvider().setNotifications(["custom"]);
            setState(() {
              noticeCount++;
            });
            message['data']['title']!=null?notifications.insert(0,Notifications(title:  message['data']['title'],body: message['data']['body'], image: message['data']['image'] )):null;
            *//*  Navigator.of(cntxt).pushNamedAndRemoveUntil(
                Constant.DASHBOARD, (Route<dynamic> route) => false,arguments: 3);*//*
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Notices(notifications)),
            );
            break;
          }
          default: {

          }
        }

      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
        print('on resume ${message['data']['params']}');
        print('on launch ${message['data']['title']}');
        print('on launch ${message['data']['body']}');
        print('on launch ${message['data']['image']}');

        print('Test 1');
        var adId;
        var recipientId;
        //print('on resume params:  ${message['data']['params']['ad_id']}');

        if(message['data']['params']!=null){
          var paramsData=message['data']['params'];

          print('PARAMS: $paramsData');

          Params params=Params.fromJson(json.decode(paramsData));

          print('Test 2');
          print('PARAMS: ${params.toJson()}');



          adId=params.adId;
          recipientId=params.recipientId;


          print('AD ID: $adId');
          print('RecipientId: $recipientId');
        }


        *//* if(message['data']['type']=="chat_user"){
          print("Comment");
          //Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
          Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments: MessageParams(Prefs.getUserID(),recipientId, adId));
        }*//*
        switch(message['data']['type']){
          case 'chat_user':{
            print("Chat user");
            Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments: MessageParams(Prefs.getUserID(), recipientId, adId));
            break;
          }
          case 'chat_support': {
            Navigator.of(cntxt).pushNamed(Constant.CHAT_SCREEN, arguments:  MessageParams(Prefs.getUserID(), recipientId, adId));
            break;
          }
          case "promotion": {
            Navigator.of(cntxt).pushNamedAndRemoveUntil(
                Constant.DASHBOARD, (Route<dynamic> route) => false,arguments: 3);
            break;
          }
          case "ad_rejected":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_edited":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_inactive":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_expiration":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "ad_expired":{
            Navigator.of(cntxt).pushNamed(Constant.MY_ADS);
            break;
          }
          case "comment":{
            print("comment");
            Navigator.of(cntxt).pushNamed(
                Constant.SHOW_AD_SCREEN, arguments: FilterParams(adID:adId ));
            break;
          }
          case "custom":{
            print("Adding notification to the notification list");
            setState(() {
              noticeCount++;
            });
            message['data']['title']!=null?notifications.insert(0,Notifications(title:  message['data']['title'],body: message['data']['body'], image: message['data']['image'] )):null;
            *//*  Navigator.of(cntxt).pushNamedAndRemoveUntil(
                Constant.DASHBOARD, (Route<dynamic> route) => false,arguments: 3);*//*
            *//*   Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Notices(notifications)),
            );*//*
            break;
          }
          default: {
            print("Default");
          }
        }
      },

    );

    *//*  int randomNumber(){


      Random rnd;
      int min = list.first;
      int max = list.last;
      rnd = new Random();
      var r = min + rnd.nextInt(max - min);
      print("Random number: $r");
      return r;
    }*//*










  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }*/




}