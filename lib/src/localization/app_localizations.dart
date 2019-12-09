import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    "ar": {
      "app_name": "OldPazar - سوق العتيق",
      "all_cities": "كل المدن",
      "ads": "الإعلانات",
      "categories": "الأقسام",
      "viewed": "شوهِد",
      "shops": "متاجر",
      "main": "الرئيسية",
      "my_chats": "دردشاتي",
      "add_post": "أضف إعلانك",
      "notices": "إشعاراتي",
      "profile": "حسابي",
      "my_profile": "حسابي",
      "search": "ابحث",
      "arabic": "العربية",
      "choose_country": "يرجى اختيار المحافظة",
      "current_location": "استخدام الموقع الحالي",
      "fashion_cat": "موضه",
      "home_cat": "الصفحة الرئيسية",
      "fur_cat": "أثاث المنزل",
      "electronics_cat": "إلكترونيات",
      "mobile_cat": "موبايل",
      "car_cat": "سيارة",
      "cars_and_bikes": "سيارات ومركبات",
      "phone_and_tablets": "موبايل - تابلت",
      "electronics_appliances": "الأجهزة الإلكترونية",
      "fur_decor": "الأثاث والديكور",
      "real_estate": "العقارات",
      "view_more": "شاهد المزيد",
      "post_free_add": "أضف إعلان مجاناً",
      "mobile_tablets": "موبايل - تابلت",
      "video_games": "ألعاب الفيديو وملحقاتها",
      "real_estate_sale": "عقارات للبيع",
      "real_estate_rent": "عقارات للإيجار",
      "women_fashion": "ازياء - موضة نيسائي",
      "baby_kids": "لوازم الأطفال",
      "men_fashion": "ازياء - موضة رجالي",
      "food_supplements": "المكملات الغذائية",
      "services": "خدمات",
      "job": "وظائف شاغرة",
      "job_seekers": "الباحثين عن عمل",
      "pets": "الحيوانات الأليفة",
      "books_sports": "كتب-الرياضة-أخرى",
      "funny_ads": "إعلانات مضحكة",
      "business": "تجارة و صناعة",
      "all_categories": "جميع الأقسام",
      "ad_title_swift": "ماروتي سويفت",
      "ad_title_iphone": "اي فون 8",
      "ad_desc_swift": "سيارات للبيع | سريع",
      "ad_desc_iphone": "هواتف للبيع",
      "ad_desc_jaguar": "سيارات للبيع | نمر",
      "ad_desc_accord": "سيارات للبيع | اتفاق",
      "ad_desc_audi": "سيارات للبيع | أودي",
      "ad_location": "جدة",
      "ad_date": "02 أبريل 2019",
      "ad_price_swift": "2400",
      "ad_price_iphone": "900",
      "ad_price_accord": "4000",
      "ad_price_jaguar": "6000",
      "ad_call": "اتصل",
      "ad_comment": "تعليق",
      "the_comments": "التعليقات",
      "ad_chat": "دردش",
      "ad_image_count": "10",
      "ad_comment_count": "4",
      "ad_title_accord": "اتفاق",
      "ad_title_jaguar": "نمر",
      "ad_title_audi": "أودي A3",
      "ad_price_audi": "400",
      "ad_title_S10": "S10",
      "ad_title_oneplus": "ون بلس 7",
      "ad_title_pixel": "بكسل 3A",
      "ad_price_S10": "1000",
      "ad_price_oneplus": "800",
      "ad_price_pixel": "2400",
      "cal_for_pricee": "اتصل للتفاصيل",
      "filter": "فرز النتائج",
      "all_categories": "جميع الفئات",
      "open_shop": "افتح متجرك الآن",
      "shops_title_visa": "مكاتب التأشيرات بجدة",
      "shops_title_school": "المدارس الدولية بجدة",
      "shops_location": "جدة",
      "shops_post_count": "25 مشاركة",
      "search_cars": "البحث في سيارات للبيع",
      "category": "القسم",
      "search_results": "نتائج البحث:",
      "search_results_count": "مائة",
      "seller_username": "الرؤية للسيارات",
      "online": "متصل",
      "detail_price": "30 دينار",
      "ad_detail_city": "المدينة",
      "ad_detail_amman": "مدينة عمان",
      "ad_detail_make": "صنع السيارة",
      "ad_detail_toyota": "تويوتا",
      "ad_detail_model": "نموذج",
      "ad_detail_model_innova": "إنوفا",
      "ad_detail_year": "سنة",
      "ad_detail_year_2016": "ألفين و ستة عشر",
      "ad_detail_condition": "الحالة",
      "ad_detail_condition_used": "مستعمل",
      "ad_detail_kilometers": "كم",
      "ad_detail_kilometers_65436": "65436",
      "ad_detail_transmission": "انتقال",
      "ad_detail_transmission_automatic": "تلقائي",
      "ad_detail_fuel": "وقود",
      "ad_detail_fuel_gasoline": "بنزين",
      "ad_detail_color": "اللون",
      "ad_detail_color_black": "أسود",
      "ad_detail_payment": "طريقة الدفع",
      "ad_detail_payment_cash": "نقد فقط",
      "ad_detail_postid": "إعلان رقم",
      "ad_detail_postid_1234": "1234",
      "ad_detail_price": "السعر",
      "ad_detail_desc": "الشرح",
      "ad_detail_desc_body":
          "المغادرة يكون لذلك هو موهبة كافية. مؤنس سابقا ستة لكن وسيم. حتى لا وقت العرض أطلقوا النار. واختتم التصرف في البند حسب الأسئلة. تقدير لها هي المشاعر اليوم بلا حراك. استدعاء تخيل في نهى. في الاسم لا ما يشبه بقعة. ضغطت من قبل هل الملصقة درس.",
      "ad_detail_verified": "تم توثيق",
      "ad_detail_adcount": "0 إعلانات",
      "ad_detail_memberssince": "عضو مسجل",
      "ad_detail_number": "2832983829",
      "ad_detail_similarads": "إعلانات مشابهة",
      "ad_detail_photos_count": "4",
      "username": "مصطفى ر.",
      "membership_link": "tr.oldpazar.com",
      "sell_chat_buy": "بيع . اشتري . تاجر . دردش",
      "facebook": "التسجيل بواسطة فيسبوك",
      "google": "التسجيل بواسطة جوجل",
      "sign_up_button": "إنشاء حساب / تسجيل دخول",
      "terms_condition_1": "بإستخدامك لتطبيق سوق العتيق انت توافق على",
      "terms_condition_2": "اتفاقية الإستخدام وسياسة المحتوى",
      "or": "أو",
      "sign_up": "إنشاء حساب",
      "login": "تسجيل الدخول",
      "name": "الأسم",
      "email": "عنوان بريدك الإلكتروني",
      "mobile_number": "رقم الموبايل",
      "password": "كلمه المرور",
      "phone_code": "+90",
      "create_account": "إنشاء حساب جديد",
      "send_message": "إرسال رسالة جديدة",
      "hint_1": "كيفك",
      "hint_2": "ماهو سبب البيع",
      "comapny_name": "مجموعة ليث العبيدي لتجارة السيارات",
      "comapny_number": "0000000000",
      "comapny_info_tab": "معلومات",
      "comapny_location": "المنطقة الحرة الزرقاء - رقم 4 شارع جرينو",
      "saturday": "السبت",
      "sunday": "الأحد",
      "monday": "الإثنين",
      "tuesday": "الثلاثاء",
      "wednesday": "الأربعاء",
      "thursday": "الخميس",
      "friday": "الجمعة",
      "company_time": "09:00 AM-04:00 PM",
      "company_desc":
          "هو في محفظة حاول النكات الصين جاهزة للتسوس. صغيرة طريقها خجولة وكان السلطة هبوطا الخشبية. للدلالة على أنه اعترف بالتعلم وهو يتعلم تمريناتي. إلى أو ثلاثة منزل العرض تبدأ تؤخذ في الساعة. كما تثبيط تغلبت البهجة حتى ودية منغمس تفكيك. اتصال تغيير لذلك جمع لي. من الصعب تسليمها على نطاق واسع في بدل الاتجاه. تغيير وضع الاستخدام يمكن أن ينظر التخفيف المشاعر المهتمة تقدير. رؤية الدرج برفق صباحا فرع الدخل لي غير قادر.",
      "shop_category": "قسم المتجر",
      "shop_city": "مدينة المتجر",
      "all_ads": "جميع الإعلانات",
      "no_ads": "ليس لديك أي إعلانات حتى الآن",
      "unread": "الغير مقروءة فقط",
      "chat_username_1": "شاكر",
      "chat_username_2": "شاكيل",
      "chat_message_1": "اريد ان اشتري",
      "chat_message_2": "يرجى مشاركة معلومات الاتصال الخاصة بك.",
      "chat_time": "11-05-2019",
      "chat_ad_title_1": "حصان Elitebook 840core i5",
      "chat_ad_title_2": "نموذج فيراري الأحمر",
      "chat_search": "ابحث في دردشاتي",
      "my_ads": "إعلاناتي",
      "edit_profile": "تعديل حسابي ",
      "build_trust": "توثيق",
      "wallet": "محفظتي",
      "account_member": "عضو مجاني",
      "account_profile": "الحساب",
      "settings": "الإعدادات",
      "favourite_ads": "الإعلانات المفضلة",
      "share_profile": "شارك صفحتي",
      "share_app": "شارك التطبيق",
      "contact_us": "اتصل بنا",
      "help": "المساعدة",
      "about_app": "حول التطبيق",
      "country": "البلد",
      "general": "عام",
      "account": "حسابي",
      "city": "المدينة",
      "neighbourhood": "المنطقة",
      "jordan": "الأردن",
      "turkey": "تركيا",
      "english": "الإنجليزية",
      "language": "اللغة",
      "notification": "الإشعارات",
      "terms_of_use": "اتفاقية الإستخدام",
      "logout": "تسجيل خروج",
      "my_notifications": "إشعاراتي",
      "mark_read": "تحديد الكل كـمقروء",
      "continue_mobile": "مواصلة البحث على المحمول - الكمبيوتر اللوحي",
      "yesterday": "البارحة",
      "notices_time": "15-06-2019",
      "insert_ad": "أضف إعلان جديد",
      "edit_ad": "تعديل إعلان",
      "add_photo": "أضف صورة",
      "type": "النوع",
      "cuurency_type": "SAR",
      "add_warning":
          "يمكنك إضافة 10 صور لإعلانك, الصور تزيد من فرص البيع اكثر من 5 اضعاف",
      "listing": "عن ماذا تعلن؟",
      "add_title": "عنوان الإعلان مثلاً: موبايل سامسونج اس 8 للبيع بحالة جيدة",
      "add_desc": "شرح الإعلان: اي تفاصيل اكثر عن اعلانك",
      "save_insert_button": "حفظ ونشر الإعلان",
      "edit_picture": "تعديل الصورة",
      "album_picture": "اختيار صورة من الألبوم",
      "camera_picture": "التقاط صورة من الكاميرا",
      "retake_picture": "التقط صورة جديدة من الكاميرة",
      "repick_picture": "إختر صورة اخرى من الاستديو",
      "delete": "حذف الصورة",
      "make_main_image": "اجعلها الصورة الرئيسية",
      "consoles": "لوحات المفاتيح",
      "video_games": "العاب الكترونية",
      "accessories": "الصوتيات - استبدال قطع الغيار",
      "gaming_cards": "بطاقات اللعب",
      "accounts": "الحسابات والشخصيات",
      "action": "شخصيات العمل",
      "other": "أخرى - ألعاب",
      "playstation_4": "بلاي ستيشن 4",
      "playstation_3": "بلاي ستيشن 3",
      "playstation_2": "بلاي ستيشن 2",
      "playstation_1": "بلاي ستيشن 1",
      "playstation_4_pro": "بلاي ستيشن 4 برو",
      "psp": "شرطة الأمن العام - فيتا",
      "xbox_one": "أجهزة إكس بوكس ​​واحد",
      "xbox_360": "أجهزة إكس بوكس ​​360",
      "xbox_one_S": "Xbox One S",
      "xbox_one_X": "اكس بوكس ​​وان",
      "nintendo_w": "نينتندو وي",
      "nintendo_w_u": "نينتندو وي يو",
      "nintendo_3d": "نينتندو 3 دي إس",
      "nintendo_switch": "نينتندو سويتش",
      "gaming": "ألعاب الكمبيوتر",
      "used": "مستعمل",
      "old": "قديم",
      "subcategory": "القسم الفرعي",
      "requested_price": "السعر المطلوب",
      "active": "فعال",
      "inactive": "غير فعال",
      "upgrade": "ترقية حسابي",
      "ads_left": "الحد المتبقي لك 7 إعلانات فعّالة",
      "increase_limit": "رقيّ حسابك واحصل على إعلانات أكثر!",
      "search_my_ads": "ابحث في إعلاناتي",
      "drop_down_live": "فعال",
      "drop_down_featured": "مميز",
      "search_my_ads": "البحث في إعلاناتي",
      "now": "الآن",
      "online_for": "فعال منذ",
      "expired": "ينتهي بتاريخ",
      "verify": "توثيق",
      "edit": "تعديل",
      "delete": "حذف",
      "chat": "دردشة",
      "share": "شارك",
      "stats": "احصائيات",
      "people_saw": "شخص شاهد إعلانك",
      "boost": "تعزيز",
      "pending": "مييز إعلانك",
      "pending_body":
          "إعلانك معلق لأن رقم هاتفك غير موثق. يرجى توثيق رقمك الآن!",
      "share_ad": "مشاركة الإعلان",
      "views": "المشاهدات",
      "calls": "المكالمات",
      "show_stats": "عرض المزيد من الإحصائيات",
      "get": "احصل على",
      "more_views": "المزيد من وجهات النظر",
      "by": "بواسطة:",
      "featured_by": "إعلان مميز",
      "buy": "اشتري",
      "turbo": "مستعجل",
      "view_times": "15 ضعف",
      "seven_day": "7 أيام",
      "zero_six": "0.62",
      "zero_nine": "0.92",
      "per_day": "دينار / في اليوم",
      "four_three": "4.31 المجموع - 431 رصيد",
      "six_four": "6.47 المجموع - 647 رصيد",
      "show_details": "اظهر التفاصيل",
      "view_subtitle": "عدد مرات مشاهدة الناس لإعلانك",
      "call_subtitle": "عدد نقرات الناس على رقم هاتفك للإتصال بك",
      "not_enough_data": "لا توجد بيانات كافية",
      "twitter": "تغريد",
      "google_build": "جوجل",
      "get_faster":
          "اكسب ثقتك الناس واحصل على نتائج اسرع عند توثيق حسابك من خلال:",
      "credits": "رصيد",
      "transactions": "حركات حسابي",
      "current_balance": "الرصيد الحالي",
      "buy_credits": "اشتري رصيد",
      "redeem": "استخدم كوبون",
      "last_top_up": "اخر تعبئة للرصيد",
      "bundles": "حزم رصيد",
      "want_discount": "تبحث عن خصم؟ اشتري حزمة الآن",
      "save": "حفظ",
      "choose_photo": "اختيار صورة",
      "first_name": "مصطفى",
      "last_name": "R.",
      "prefix_link": "tr.oldpazar.com",
      "suffix_link": "member-1184715485",
      "email_id": "mostapha922@gmail.com",
      "hide_number": "اخفاء رقم الموبايل من صفحتي الشخصية",
      "change_password": "تغيير كلمة المرور",
      "facebook_build": "فيس بوك",
      "cities": "اي بي سي",
      "jeddah": "جدة",
      "mecca": "مكة المكرمة",
      "al_madhina": "المدينة",
      "dammam": "عمان",
      "tabuk": "تبوك",
      "buraidah": "بريدة",
      "hail": "وابل",
      "sakakah": "سكاكا",
      "jazan": "جازان",
      "al_bahah": "الباحة",
      "najran": "نجران",
      "arar": "عرار",
      "abha": "أبها",
      "rafha": "رفحاء",
      "turai": "طريف",
      "taif": "الطائف",
      "duba": "ضباء",
      "all_neighbourhood": "كل الحي",
      "first_circle": "الدوار الاول",
      "second_circle": "الدوار الثاني",
      "third_circle": "الدوار الثالث",
      "fourth_circle": "الدوار الرابع",
      "fifth_circle": "الدوار الخامس",
      "sixth_circle": "الدوار السادس",
      "seventh_circle": "الدوار السابع",
      "eigth_circle": "الدوار الثامن",
      "abdali": "العبدلي",
      "abdoun": "عبدون",
      "any": "أي",
      "car_for_sale": "سيارة للبيع",
      "cars_rental": "تاجير سيارة",
      "motorcycle": "دراجة نارية",
      "car_plate_number": "رقم لوحة سيارة",
      "car_accessories": "اكسسوارات السيارات",
      "wheels_rims": "عجلات وحافات",
      "truck_machinery": "شاحنة - الآلات الثقيلة",
      "boats_yatch": "قارب ، يخت ، وجيت سكي",
      "others_cars": "السيارات والدراجات الأخرى",
      "choose_category": "اختر القسم",
      "following_ads": "الإعلانات التالية",
      "from": "من",
      "to": "إلى",
      "donations": "تبرعات - مجانا",
      "ads_with": "إعلانات مع صور فقط",
      "show_search": "عرض نتائج البحث باللغة الإنجليزية فقط",
      "show_premium": "إعلانات مميزة فقط",
      "premium": "مميز",
      "sort_by_label": "ترتيب حسب",
      "relevant": "ذو صلة",
      "latest": "الأحدث",
      "reset_field": "تفريغ الحقول",
      "filter_results": "فرز النتائج",
      "region": "المحافظة",
      "akshay": "أكشاي",
      "comment_content": "اريد هذه السيارة",
      "select_language": "اختيار اللغة",
      "load_more": "مشاهدة المزيد",
      "certified_seller": "بائع معتمد",
      "next": "التالى",
      "email_required": "البريد الالكتروني مطلوب",
      "prev_ad_label": "الإعلان السابق",
      "next_ad_label": "الإعلان التالي",
      "add_comment_label": "اضف تعليق",
      "comment_here_label": "اكتب تعليقك هنا",
      "limit_live_ads": "الحد من الإعلانات الحية",
      "live_ads": "الإعلانات الحية   ",
      "remaining": "متبقي",
      "upgrade_account": "ترقية الحساب",
      "paid_ads": "الإعلانات المدفوعة",
      "account_type": "نوع الحساب",
      "account_overview": "نظرة على الحساب",
      "repost": "اعادة نشر",
      "urgent": "مستعجل‎",

      //Newely Added
      "upgrade_your_account": "رقي حسابك",
      "more": "المزيد",
      "ads_for_category": "إعلان لكل فئة",
      "upgrade_info": "رقي حسابك وبيع اسرع",
      "silver_premium_account": "حساب فضي",
      "gold_premium_account": "حساب ذهبي",
      "shop_account": "حساب متجر",
      "month": "شهر",
      "offline": "غير متصل",
      "need_help": "هل تحتاج اي مساعدة؟",
      "terms_&_condition": "الشروط واتفاقية المستخدم",

      "already_registered": "البريد الإلكتروني مسجل لدينا",
      "already_registered_with_facebook":
          "هذا البريد مسجل لدينا بواسطة فيس بو ",
      "already_registered_with_google":
          "هذا البريد مسجل لدينا بواسطة حساب جوجل",

      "login_successful": "تم تسجيل الدخول بنجاح",
      "invalid_email": "بريد إلكتروني خاطئ",
      "status": "الحالة",
      "ok": "موافق",
      "no_messages": "لم يتم العثور على رسائل",
      "send": "إرسال",

      "category_listing": "عن ماذا تعلن؟",
      "category_listing_1": "عن ماذا تعلن",
      "confirm_logout": "تسجيل الخروج؟",
      "logout_msg": "هل حقاً تريد تسجيل الخروج؟",
      "cancel": "إلغاء",
      "please_wait_loading_data": "يرجى الإنتظار جاري تحميل البيانات",
      "enter_neighbourhood": "ادخل اسم الحي",
      "price_lowest": "السعر الأقل أولاً",
      "price_highest": "السعر الأغلى أولاًً",
      "email_required": "البريد الإلكتروني حقل مطلوب",
      "invalid_email": "بريد إلكتروني خاطئ",
      "no_ads_found": "لم يتم العثور على إعلانات",
      "loading": "جاري التحميل...",
      "please_wait": "يرجى الإنتظار",
      "please_wait_submit": "اختر صورة من الاستديو",

      "enter_price": "حدد السعر",
      "price_zero": "لايمكن ان يكون السعر صفر, يرجى وضع سعر حقيقي",
      "free": "مجاناً - تبرعات",
      "check_with_seller": "السعر عند الإتصال",
      "currency": "العملة",
      "transaction": "نوع الإعلان",
      "choose_transaction": "معروض او مطلوب؟",
      "any_condition": "مستعمل ام جديد؟",
      "choose_condition": "مستعمل ام جديد؟",
      "new": "جديد",
      "used": "مستعمل",
      "no_condition": "لا حاجة لحالة",
      "sell": "معروض - للبيع",
      "buy": "مطلوب - للشراء",
      "rent": "للإيجار",
      "exchange": "تبادل - مقايضة",
      "enter_title": "ادخل عنوان عن ماذا تعلن باللغة العربية حصراً",
      "enter_desc": "ادخل شرح كافي عن الإعلان باللغة العربية حصراً",
      "choose_region": "اختر المدينة",
      "choose_city": "اختر المحافظة",
      "choose_currency": "اختر العملة",
      "choose_cat_subcat": "اختر القسم والقسم الفرعي",
      "ad_posted_successfully": "تم إضافة إعلانك بنجاح",
      "success": "تم بنجاح",
      "submit_failed": "فشلت عملية اضافة الإعلان",
      "ad_update_successful": "تم تعديل الإعلان بنجاح",
      "ad_update_failed": "حدث فشل اثناء تعديل الإعلان",
      "update_ad": "تعديل الإعلان",
      "failed": "حدث فشل",
      "select_value": "اختار القيمة",
      "condition": "حالة",
      "any_transaction": "معروض او مطلوب؟",

      "hide_mobile_no": "اخفي رقم الموبايل عن الناس",
      "please_enter_local_no": "يرجى ادخال رقم موبايل يبتدأ بـ: 05XXXXXXXXX",
      "sign_in_successful": "تم تسجيل الدخول بنجاح",
      "weeks_ago": "منذ X اسبوع",
      "years_ago": "منذ X سنة",
      "months_ago": "منذ X اشهر",
      "min_ago": "منذ X دقائق",
      "days_ago": "منذ X ايام",
      "hour_ago": "منذ X ساعات",
      "just_now": "الآن",
      "sec_ago": "منذ X ثواني",
      "verified_with": "تم توثيق",


      "years": "سنة",
      "months": "اشهر",
      "weeks": "اسبوع",
      "days": "ايام",
      "hour": "ساعات",
      "min": "دقائق",
      "sec": "ثواني",
      "ago": "منذ",

      "get_all_ads_by": "جميع الإعلانات في",
      "name_is_required": "الأسم حقل مطلوب",
      "invalid_name": "أدخل اسمًا صالحًا",
      "name_must_be": "الأسم يجب ان يكون احرف حصراً ولايحتوي ارقام او رموز",
      "mobile_required": "رقم الموبايل حقل مطلوب",
      "mobile_must_11": "يجب ان يكون رقم الموبايل 11 رقم حصراً",
      "mobile_must_digits": "يجب ان يكون رقم الموبايل ارقام فقط",
      "password_must_8": "يجب ان تكون كلمة المرور 8 ارقام او احرف على الاقل",
      "comment_must_5": "يجب ان يكون التعليق اكثر من كلمة على  الاقل",
      "last_week": "الأسبوع الماضي",
      "last_month": "الشهر الماضي",
      "last_year": "السنة الماضية",
      "today": "اليوم",

      "show_more": "إظهار التفاصيل",
      "show_less": "إخفاء التفاصيل",
      "no_categories": "لم يتم العثور على قسم",
      "comment_empty": "التعليق لايمكن ان يكون فارغ",
      "no_cities": "لم يتم العثور على مدن",
      "no_regions": "لم يتم العثور على محافظات",

      "first_name":"الأسم",
      "last_name":"أسم العائلة",
      "current_password":"ادخل كلمة المرور الحالية",
      "new_password":"كلمة المرور الجديدة",
      "update_password":"تغيير كلمة المرور",
      "wrong_password":"كلمة مرور خاطئة",
      "password_successfully":"تم تغيير كلمة المرور بنجاح",
      "incorrect_password":"كلمة المرور الحالية غير صحيحة",
      "all_turkey":"كافة تركيا",

      "item_deleted":"تم حذف الإعلان بنجاح",
      "confirm_delete":"تأكيد الحذف",
      "sure_delete":"هل تريد حقاً حذف هذا الإعلان!",

      "hello":"مرحبا",
      "how_are_you":"كيف حالكم",
      "whats_price":"ما هو سعر",

      "funny_listing": "إعلانات مضحكة",
      "please_wait":"يرجى الإنتظار",
      "login_failed":"حدث فشل اثناء تسجيل الدخول",
      "sign_up_failed":"حدث فشل اثناء إنشاء حساب جديد",
      "enter_valid_name":"يرجى ادخال اسم صحيح",
      "please_select_option":"يرجى تحديد احد الخيارات",
      "profile_updated_successfully":"تم تحديث حسابكم بنجاح",
      "capture_image":"إلتقاط صورة من الكاميرا",
      "picture_album":"تحديد صورة من الإستديو",
      "copied_clipboard":"تم نسخ الرابط ",

      "select_option":"يرجى تحديد احد الخيارات",
      "choose_option":"يرجى تحديد أحد الخيارات",
      "enter_value":"يرجى ادخال قيمة",

      "no_notifications":"لا يوجد إشعارات",

      "listing_published": "تم نشر إعلانك بنجاح",
      "listing_updated": "تم تحديث إعلانك بنجاح",

      "notifications_settings": "ضبط الإشعارات",
      "notifications_about": "إشعارات حول حسابي",
      "general_informations_hints": "معلومات ونصائح لتحسين حسابي",
      "other_notifications": "إشعارات أخرى",
      "general_informations_products": "معلومات عامة حول خدمات يمكنني تفعيلها على سوق العتيق",
      "informations_ads": "معلومات حول الإعلانات التي تهمني",
      "promotions_ads": "عروض وإعلانات من سوق العتيق ",
      "actions_from": "تفاعلات المستخدمين الآخرين حول حسابي",

      "no_internet":"لايوجد انترنت",
      "no_internet_message":"سوق العتيق يعمل من خلال الإنترنت, ويبدو انك غير متصل بالإنترنت",

      "new_message":"لديك رسالة جديدة من احد المهتمين بإعلاناتك",
      "check_inbox":"اضغط لمشاهدة الدردشات على سوق العتيق",
      "missed_you":"اشتقنالك اضغط لمشاهدة احدث الإعلانات 😉",
      "continue_browsing":"تابع تصفح سوق العتيق وشاهد الإعلانات الجديد 😉",
      "5_seconds":"بس بـ 5 ثواني ممكن تبيع او تشتري اي شي على سوق العتيق 😊",
      "biggest_arab":"بيع . اشتري . دردش في اكبر سوق الكتروني عربي مجاني في تركيا سوق العتيق 😃",
      "continue_browsing_category":"استمر في التصفح",
      "new_things_added":"أشياء جديدة المضافة 😃",
      "sign_up_successful":"تم التسجيل بنجاح",
      "sell_buy_trade":"بيع.  اشتري . تاجر 👍",
      "oldpazar_turkey":"سوق العتيق سوق تركيا المفتوح",
      "sellers_online":"العديد من البائعين اونلاين ✅",
      "selling_easily":"التقط صورة 📸 وأبدأ البيع بسهولة 💪",

      "the_converstation":"المحادثة",
      "really_delete":"هل تريد حقاً حذف هذه المحادثة؟",
      "delete_converstation":"حذف المحادثة",
      "reported_successfully":"تم الإبلاغ عن الإعلان",
      "report":"الإبلاغ عن هذا الإعلان",
      "spam":"عشوائي - سبام",
      "offensive":"إعلان غير اخلاقي",
      "expired_ad":"إعلان منتهي - مباع",
      "expiring_soon":"تنتهي قريبا",
      "rejected_ad":"مرفوض",
      "duplicate_ad":"إعلان مكرر",
      "wrong_category":"قسم خاطئ",
      "block_user":"حظر المرسل",
      "error":"خطأ",
      "select_reasons":"الرجاء تحديد أحد الأسباب التالية:",
      "reported":"تم التبليغ",
      "really_block":"هل تريد حقاً حظر هذا المستخدم",
      "message_required":"الرسالة مطلوبة",
      "recent_ads":"أحدث الإعلانات",

      "unblock_user":"فك حظر المستخدم",
      "really_unblock":"هل حقاً تريد فك حظر المستخدم",
      "user_blocked":"هذا المستخدم محظور",
      "convo_deleted":"تم حذف المحادثة",
      "user_unblocked":"تم فك حظر المستخدم بنجاح",
      "item_sold":"تم البيع",
      "view_similar":"عرض إعلانات مشابهة",



    },
    "en": {
      "app_name": "OldPazar - سوق العتيق",
      "all_cities": "All cities",
      "ads": "Ads",
      "categories": "Categories",
      "viewed": "Viewed",
      "shops": "Shops",
      "main": "Main",
      "my_chats": "My Chats",
      "add_post": "Add Post",
      "notices": "Notices",
      "profile": "Profile",
      "my_profile": "My Profile",
      "search": "Search",
      "arabic": "العربية",
      "choose_country": "Please Choose Region",
      "current_location": "Use Current Location",
      "fashion_cat": "Fashion",
      "home_cat": "Home",
      "fur_cat": "Furniture",
      "electronics_cat": "Electronics",
      "mobile_cat": "Mobile",
      "car_cat": "Car",
      "cars_and_bikes": "Cars and Bikes",
      "phone_and_tablets": "Phone and Tablets",
      "electronics_appliances": "Electronics Appliances",
      "fur_decor": "Furniture and Decor",
      "real_estate": "Real Estate",
      "view_more": "View more",
      "post_free_add": "Post Free AD",
      "mobile_tablets": "Mobile-Tablets",
      "video_games": "Video Games & Consoles",
      "real_estate_sale": "Real Estate For Sale",
      "real_estate_rent": "Real Estate For Rent",
      "women_fashion": "Women's Fashion",
      "baby_kids": "Baby-Kids",
      "men_fashion": "Men's Fashion",
      "food_supplements": "Food Supplements",
      "services": "Services",
      "job": "Job",
      "job_seekers": "Job Seekers",
      "pets": "Pets",
      "books_sports": "Books-Sports-Others",
      "funny_ads": "Funny Ads",
      "business": "Business-Industrial",
      "all_categories": "All Categories",
      "ad_title_swift": "Maruti Swift",
      "ad_title_iphone": "iPhone 8",
      "ad_desc_swift": "Cars for Sale | Swift",
      "ad_desc_iphone": "Phones for sale",
      "ad_desc_jaguar": "Cars for Sale | Jaguar",
      "ad_desc_accord": "Cars for Sale | Accord",
      "ad_desc_audi": "Cars for Sale | Audi",
      "ad_location": "abc",
      "ad_date": "02 Apr 2019",
      "ad_price_swift": "2400",
      "ad_price_iphone": "900",
      "ad_price_accord": "4000",
      "ad_price_jaguar": "6000",
      "ad_call": "Call",
      "ad_comment": "Comments",
      "the_comments": "The Comments",
      "ad_chat": "Chat",
      "ad_image_count": "10",
      "ad_comment_count": "4",
      "ad_title_accord": "Accord",
      "ad_title_jaguar": "Jaguar",
      "ad_title_audi": "Audi A3",
      "ad_price_audi": "400",
      "ad_title_S10": "S10",
      "ad_title_oneplus": "OnePlus 7",
      "ad_title_pixel": "Pixel 3A",
      "ad_price_S10": "1000",
      "ad_price_oneplus": "800",
      "ad_price_pixel": "2400",
      "cal_for_pricee": "Call for price",
      "filter": "Filter",
      "all_categories": "All Categories",
      "open_shop": "Open your Shop Now",
      "shops_title_visa": "Visa Offices in Jeddah",
      "shops_title_school": "International Schools in Jeddah",
      "shops_location": "Jeddah",
      "shops_post_count": "25 Post",
      "search_cars": "Search in Cars For Sale",
      "category": "Category",
      "search_results": "Search Results:",
      "search_results_count": "100",
      "seller_username": "Vision For Car",
      "online": "Online",
      "detail_price": "30 JOD",
      "ad_detail_city": "The City",
      "ad_detail_amman": "Ammam",
      "ad_detail_make": "Car Make",
      "ad_detail_toyota": "Toyota",
      "ad_detail_model": "Model",
      "ad_detail_model_innova": "Innova",
      "ad_detail_year": "Year",
      "ad_detail_year_2016": "2016",
      "ad_detail_condition": "Condition",
      "ad_detail_condition_used": "Used",
      "ad_detail_kilometers": "Kilometers",
      "ad_detail_kilometers_65436": "65436",
      "ad_detail_transmission": "Transmission",
      "ad_detail_transmission_automatic": "Automatic",
      "ad_detail_fuel": "Fuel",
      "ad_detail_fuel_gasoline": "Gasoline",
      "ad_detail_color": "Color",
      "ad_detail_color_black": "Black",
      "ad_detail_payment": "Payment Mode",
      "ad_detail_payment_cash": "Cash Only",
      "ad_detail_postid": "Post Id",
      "ad_detail_postid_1234": "1234",
      "ad_detail_price": "Price",
      "ad_detail_desc": "Description",
      "ad_detail_desc_body":
          "Depart do be so he enough talent. Sociable formerly six but handsome. Up do view time they shot. He concluded disposing provision by questions as situation. Its estimating are motionless day sentiments end. Calling an imagine at forbade. At name no an what like spot. Pressed my by do affixed he studied. ",
      "ad_detail_verified": "Verified",
      "ad_detail_adcount": "0 Ads",
      "ad_detail_memberssince": "Members since",
      "ad_detail_number": "2832983829",
      "ad_detail_similarads": "Similar Ads",
      "ad_detail_photos_count": "4",
      "username": "Mostapha R.",
      "membership_link": "https://tr.oldpazar.com",
      "sell_chat_buy": "Sell. Chat. Buy",
      "facebook": "Continue with Facebook",
      "google": "Continue with Google",
      "sign_up_button": "Sign up / Login",
      "login": "Login",
      "terms_condition_1": "By using this app you agree to our",
      "terms_condition_2": "Terms & Conditions and Privacy Policy",
      "or": "or",
      "sign_up": "Sign Up",
      "name": "Name",
      "email": "Email Address",
      "mobile_number": "Mobile Number",
      "password": "Password",
      "phone_code": "+90",
      "create_account": "Create New Account",
      "send_message": "Send a new message",
      "hint_1": "How are you",
      "hint_2": "What is the purpose",
      "comapny_name": "Laith Al Obeidi Car trading group",
      "comapny_number": "0000000000",
      "comapny_info_tab": "Info",
      "comapny_location": "Zarqa-Free Zone-No. 4 Greno Street",
      "saturday": "Saturday",
      "sunday": "Sunday",
      "monday": "Monday",
      "tuesday": "Tuesday",
      "wednesday": "Wednesday",
      "thursday": "Thursday",
      "friday": "Friday",
      "company_time": "09:00 AM-04:00 PM",
      "company_desc":
          "Is at purse tried jokes china ready decay an. Small its shy way had woody downs power. To denoting admitted speaking learning my exercise so in. Procured shutters mr it feelings. To or three offer house begin taken am at. As dissuade cheerful overcame so of friendly he indulged unpacked. Alteration connection to so as collecting me. Difficult in delivered extensive at direction allowance. Alteration put use diminution can considered sentiments interested discretion. An seeing feebly stairs am branch income me unable.",
      "shop_category": "Shop Category",
      "shop_city": "Shop City",
      "all_ads": "All Ads",
      "no_ads": "You do not have any ads yet",
      "unread": "Unread Only",
      "chat_username_1": "Mohamed",
      "chat_username_2": "Shakeel",
      "chat_message_1": "I would like to buy it.",
      "chat_message_2": "Please share your contact info.",
      "chat_time": "11-05-2019",
      "chat_ad_title_1": "Hp Elitebook 840core i5",
      "chat_ad_title_2": "Ferrari Red Model",
      "chat_search": "Search in your chats...",
      "my_ads": "My Ads",
      "edit_profile": "Edit Profile",
      "build_trust": "Build Trust",
      "wallet": "My Wallet",
      "account_member": "Free Member",
      "account_profile": "Account",
      "settings": "Settings",
      "favourite_ads": "Favourite Ads",
      "share_profile": "Share my profile",
      "share_app": "Share App",
      "contact_us": "Contact Us",
      "help": "Help",
      "about_app": "About the App",
      "country": "Country",
      "general": "General",
      "account": "Account",
      "city": "City",
      "neighbourhood": "Neighbourhood",
      "jordan": "Jordan",
      "turkey": "Turkey",
      "english": "English",
      "language": "Language",
      "notification": "Notifications",
      "terms_of_use": "Terms of use",
      "logout": "Logout",
      "my_notifications": "My Notifications",
      "mark_read": "Mark all as read",
      "continue_mobile": "Continue your search on mobile - tablet",
      "yesterday": "Yesterday",
      "notices_time": "15-06-2019",
      "insert_ad": "Insert an Ad",
      "edit_ad": "Edit an Ad",
      "add_photo": "Add Photo",
      "type": "Type",
      "cuurency_type": "SAR",
      "add_warning":
          "Add upto 10 pictures, pictures increases the chance to make deal by 5 times.",
      "listing": "What are you listing?",
      "add_title":
          "Ad title(eg: Toyota Camary 2008 in Good Condition for sale)",
      "add_desc": "Ad description (Add more details)",
      "save_insert_button": "Save and Insert Ad",
      "edit_picture": "Edit the picture",
      "camera_picture": "Take picture from camera",
      "album_picture": "Pick picture from Album",
      "retake_picture": "Retake picture from camera",
      "repick_picture": "Repick the picture from album",
      "delete": "Delete",
      "make_main_image": "Make it main image",
      "consoles": "Consoles",
      "video_games": "Video Games",
      "accessories": "Acessories - Replacement Parts",
      "gaming_cards": "Gaming Cards",
      "accounts": "Accounts and Characters",
      "action": "Action Figures",
      "other": "Other - Gaming",
      "playstation_4": "Playstation 4",
      "playstation_3": "Playstation 3",
      "playstation_2": "Playstation 2",
      "playstation_1": "Playstation 1",
      "playstation_4_pro": "Playstation 4 Pro",
      "psp": "PSP - Vita",
      "xbox_one": "Xbox One",
      "xbox_360": "Xbox 360",
      "xbox_one_S": "Xbox One S",
      "xbox_one_X": "Xbox One X",
      "nintendo_w": "Nintendo Wii",
      "nintendo_w_u": "Nintendo Wii U",
      "nintendo_3d": "Nintendo 3Ds",
      "nintendo_switch": "Nintendo Switch",
      "gaming": "Gaming PC'",
      "used": "Used",
      "old": "Old",
      "subcategory": "Sub Category",
      "requested_price": "Requested Price",
      "active": "Active",
      "inactive": "Inactive",
      "upgrade": "Upgrade",
      "ads_left": "You have 7 Active Ads left.",
      "increase_limit": "Increase the limit of Active Ads now!",
      "search_my_ads": "Search my ads",
      "drop_down_live": "Live",
      "drop_down_featured": "Featured",
      "search_my_ads": "Search my ads",
      "now": "Now",
      "online_for": "Online For:0 Days",
      "expired": "Expired in:0 Days",
      "verify": "Verify",
      "edit": "Edit",
      "delete": "Delete",
      "chat": "Chat",
      "share": "Share",
      "stats": "Stats",
      "people_saw": "people saw your Ad",
      "boost": "Boost",
      "pending": "Pending",
      "pending_body":
          "Your ad is pending due to ur phone number being unverified. Please verify your number now!",
      "share_ad": "Share Ad",
      "views": "Views",
      "calls": "Calls",
      "show_stats": "Show more stats",
      "get": "Get",
      "more_views": "MORE VIEWS",
      "by": "by:",
      "featured_by": "Feature Ad",
      "buy": "Buy",
      "turbo": "Turbo",
      "view_times": "15 times more now",
      "seven_day": "7 day",
      "zero_six": "0.62",
      "zero_nine": "0.92",
      "per_day": "JOD / per day",
      "four_three": "4.31 Total - 431 Credits",
      "six_four": "6.47 Total - 647 Credits",
      "show_details": "Show details",
      "view_subtitle": "The number of times Your Ad was viewed by a Buyer",
      "call_subtitle":
          "The number of times, Buyers clicked on the phone number of Your Ad",
      "not_enough_data": "Not Enough Data!",
      "twitter": "Twitter",
      "google_build": "Google",
      "get_faster": "Get faster responses by verifying your account with:",
      "credits": "Credits",
      "transactions": "My Transactions",
      "current_balance": "Current Balance",
      "buy_credits": "Buy Credits",
      "redeem": "Redeem",
      "last_top_up": "Last Top-up",
      "bundles": "Bundles",
      "want_discount": "Want a discount? Buy Bundles Now",
      "save": "Save",
      "choose_photo": "Choose photo",
    /*  "first_name": "Mostapha",
      "last_name": "R.",*/
      "prefix_link": "https://tr.oldpazar.com",
      "suffix_link": "member-1184715485",
      "email_id": "mostapha922@gmail.com",
      "hide_number": "Hide phone on my profile",
      "change_password": "Change Password",
      "facebook_build": "Facebook",
      "cities": "abc",
      "jeddah": "Jeddah",
      "mecca": "Mecca",
      "al_madhina": "Al Madhina",
      "dammam": "Dammam",
      "tabuk": "Tabuk",
      "buraidah": "Buraidah",
      "hail": "Hail",
      "sakakah": "Sakakah",
      "jazan": "Jazan",
      "al_bahah": "Al Bahah",
      "najran": "Najran",
      "arar": "Arar",
      "abha": "Abha",
      "rafha": "Rafha",
      "turai": "Turaif",
      "taif": "Taif",
      "duba": "Duba",
      "all_neighbourhood": "All Neighbourhood",
      "first_circle": "1st Circle",
      "second_circle": "2nd Circle",
      "third_circle": "3rd Circle",
      "fourth_circle": "4th Circle",
      "fifth_circle": "5th Circle",
      "sixth_circle": "6th Circle",
      "seventh_circle": "7th Circle",
      "eigth_circle": "8th Circle",
      "abdali": "Abdali",
      "abdoun": "Abdoun",
      "any": "Any",
      "car_for_sale": "Car for sale",
      "cars_rental": "Car rental",
      "motorcycle": "Motorcycle",
      "car_plate_number": "Car Plate Number",
      "car_accessories": "Car Accessories",
      "wheels_rims": "Wheels and rims",
      "truck_machinery": "Truck - Heavy Machinery",
      "boats_yatch": "Boat,Yatch, and Jet Ski",
      "others_cars": "Other Cars and Bike",
      "choose_category": "Choose Category",
      "following_ads": "Followings Ads",
      "from": "From",
      "to": "To",
      "donations": "Donations - For Free",
      "premium": "Premium",
      "ads_with": "Ads with photos only",
      "show_search": "Show search results in english only",
      "show_premium": "Show premium posts only",
      "sort_by_label": "Sort By",
      "relevant": "Relevant",
      "latest": "Latest",
      "reset_field": "Reset Fields",
      "filter_results": "Filter results",
      "region": "Region",
      "akshay": "Akshay",
      "comment_content": "I want this car",
      "select_language": "Select Language",
      "load_more": "Load more",
      "certified_seller": "Certified Seller",
      "next": "Next",
      "email_required": "Email is required",
      "prev_ad_label": "Previous Ad",
      "next_ad_label": "Next Ad",
      "add_comment_label": "Add a comment",
      "comment_here_label": "  Comment here",
      "limit_live_ads": "Limit of live Ads",
      "live_ads": "Live Ads   ",
      "remaining": "Remaining   ",
      "upgrade_account": "Upgrade Account",
      "paid_ads": "Paid Ads",
      "account_type": "Account Type",
      "account_overview": "Account Overview",
      "repost": "Repost",
      "urgent": "URGENT",

      //Newely Added
      "upgrade_your_account": "Upgrade your Account",
      "more": "More",
      "ads_for_category": "Ads for each category",
      "upgrade_info": "by Upgrade your account and sell faster",
      "silver_premium_account": "SILVER PREMIUM\nACCOUNT",
      "gold_premium_account": "GOLD PREMIUM\nACCOUNT",
      "shop_account": "SHOP ACCOUNT",
      "month": "Month",
      "offline": "Offline",
      "need_help": "Do you need any help?",
      "terms_&_condition": "Terms & Conditions",

      "already_registered": "Email ID Already Registered",
      "already_registered_with_facebook":
          "This email is already registered with Facebbok",
      "already_registered_with_google":
          "This email is already registered with Google",

      //newly added
      "login_successful": "Login Successful",
      "invalid_email": "Invalid Email",
      "status": "Status",
      "ok": "OK",
      "no_messages": "No Messages Found",
      "send": "Send",

      "category_listing": "What are you listing?",
      "category_listing_1": "What are you listing",
      "confirm_logout": "Confirm logout?",
      "logout_msg": "Are you sure you want to logout",
      "cancel": "Cancel",
      "please_wait_loading_data": "Please wait while loading data",
      "enter_neighbourhood": "Enter the Neighbourhood",
      "price_lowest": "Price: Lowest First",
      "price_highest": "Price: Highest First",
      "email_required": "Email is required",
      "no_ads_found": "No Ads Found",
      "loading": "Loading...",
      "please_wait": "Please wait",
      "please_wait_submit": "Please wait while submitting post",

      "enter_price": "Enter price",
      "price_zero": "Price cant be zero. Please enter a valid price",
      "free": "Free",
      "check_with_seller": "Check with seller",
      "currency": "Currency",
      "transaction": "Transaction",
      "choose_transaction": "Choose Transaction",
      "any_condition": "Any Condition",
      "choose_condition": "Choose Condition",
      "new": "New",
      "used": "Used",
      "no_condition": "No Condition",
      "sell": "Sell",
      "buy": "Buy",
      "rent": "Rent",
      "exchange": "Exchange",
      "enter_title": "Enter Title",
      "enter_desc": "Enter Description",
      "choose_region": "Choose Region",
      "choose_city": "Choose city",
      "choose_currency": "Choose Currency",
      "choose_cat_subcat": "Choose Category and sub category",
      "ad_posted_successfully": "Ad posted successfully",
      "success": "Success",
      "submit_failed": "Failed to Submit",
      "ad_update_successful": "Ad updated successfully",
      "ad_update_failed": "Failed to update AD",
      "update_ad": "Save and Update AD",
      "failed": "Failed",
      "select_value": "Select Value",
      "condition": "Condition",
      "any_transaction": "Any Transaction",

      "hide_mobile_no": "Hide mobile no.",
      "please_enter_local_no": "Please enter a local no: 05XXXXXXXXX",
      "sign_in_successful": "Sign in successful",
      "weeks_ago": "weeks ago",
      "years_ago": "years ago",
      "months_ago": "months ago",
      "min_ago": "min ago",
      "days_ago": "days ago",
      "hour_ago": "hour ago",
      "just_now": "just now",
      "sec_ago": "sec ago",
      "verified_with": "Verified with",

      "years": "years",
      "months": "months",
      "weeks": "weeks",
      "days": "days",
      "hour": "hour",
      "min": "min",
      "sec": "sec",
      "ago": "ago",

      "get_all_ads_by": "Get all ads by",
      "name_is_required": "Name is Required",
      "invalid_name": "Enter valid name",
      "name_must_be": "Name must be a-z and A-Z",
      "mobile_required": "Mobile number is Required",
      "mobile_must_11": "Mobile number must be 11 digitsً",
      "mobile_must_digits": "Mobile number must be digits",
      "password_must_8": "Password must contain atleast 8 letters",
      "comment_must_5": "Comment must have atleast 5 letters",
      "last_week": "Last week",
      "last_month": "Last month",
      "last_year": "Last year",
      "today": "Today",

      "show_more": "Show more",
      "show_less": "Show less",
      "no_categories": "No Categories found",
      "comment_empty": "Comment cannot be empty",
      "no_cities": "No Cities found",
      "no_regions": "No Regions found",

      "first_name":"First Name",
      "last_name":"Last Name",
      "current_password":"Enter current password",
      "new_password":"Enter new password",
      "update_password":"Update password",
      "wrong_password":"Wrong password",
      "password_successfully":"Password updated successfully",
      "incorrect_password":"Incorrect current password",
      "all_turkey":"All Turkey",

      "item_deleted":"Item deleted successfully",
      "confirm_delete":"Confirm Delete?",
      "sure_delete":"Are you sure you want to delete this Ad!",

      "hello":"Hello",
      "how_are_you":"How are you?",
      "whats_price":"What's the price?",

      "funny_listing": "Funny Listing",
      "please_wait":"Please Wait",
      "login_failed":"Login Failed",
      "sign_up_failed":"Sign Up Failed",
      "enter_valid_name":"Enter valid name",
      "please_select_option":"Please select an option",
      "profile_updated_successfully":"Profile Updated Successfully",
      "capture_image":"Capture an image",
      "picture_album":"Pick image from album",
      "copied_clipboard":"Copied to clipboard",

      "select_option":"Please select an option",
      "choose_option":"Please choose an option",
      "enter_value":"Please enter value",

      "no_notifications":"No Notifications",
      "listing_published": "Your listing is published",
      "listing_updated": "Your listing is updated successfully",

      "notifications_settings": "Notifications Settings",
      "notifications_about": "Notifications about my account",
      "general_informations_hints": "General informations and hints about my account",
      "other_notifications": "Other Notifications",
      "general_informations_products": "General informations about products and services I can buy on OldPazar",
      "informations_ads": "Informations about Ads I'm interested in",
      "promotions_ads": "Promotions and Ads from OldPazar﻿",
      "actions_from": "Actions from other users on my account",

      "no_internet":"No Internet Connection",
      "no_internet_message":"OldPazar requires a working internet connection, which you don't have at the moment.",

      "new_message":"New message has been sent from Oldpazar",
      "check_inbox":"Check your OldPazar inbox",
      "missed_you":"We missed you. Click to check recent ads 😃",
      "continue_browsing":"Continue browsing OldPazar's new ads listing 😉",
      "5_seconds":"Only in 5 seconds you can sell whatever you want on OldPazar 😊",
      "biggest_arab":"Buy. Sell. Chat. In the biggest Arap online market in Turkey OldPazar 😃",
      "continue_browsing_category":"Continue browsing",
      "new_things_added":"New things added 😃",
      "sign_up_successful":"Signup Successful",
      "sell_buy_trade":"Sell . Buy . Trade 👍👍👍👍",
      "oldpazar_turkey":"OldPazar Turkey",
      "sellers_online":"Many sellers online ✅",
      "selling_easily":"Take a picture 📸 and start selling easily 💪",

      "the_converstation":"The Converstation",
      "really_delete":"Do you really want to delete the converstation?",
      "delete_converstation":"Delete converstation",
      "reported_successfully":"Ad reported successfully",
      "report":"Report",
      "spam":"Spam",
      "offensive":"Offensive",
      "expired_ad":"Expired",
      "expiring_soon":"Expiring Soon",
      "rejected_ad":"Rejected",
      "duplicate_ad":"Duplicate Ad",
      "wrong_category":"Wrong Category Ad",
      "block_user":"Block User",
      "error":"Error",
      "select_reasons":"Please select one of the following reasons:",
      "reported":"Reported",
      "recent_ads":"Recent Ads",
      "really_block":"Do you really want to Block",
      "message_required":"Message is required",

      "unblock_user":"Unblock User",
      "really_unblock":"Do you really want to Unblock",
      "user_blocked":"User is Blocked",
      "convo_deleted":"Conversation Deleted",
      "user_unblocked":"User unblocked",

      "item_sold":"Sold",
      "view_similar":"View Similar Ads",



    }
  };

  String get appName => _localizedValues[locale.languageCode]['app_name'];



  String get repostLabel => _localizedValues[locale.languageCode]['repost'];

  String get allCitiesLabel =>
      _localizedValues[locale.languageCode]['all_cities'];

  String get adsLabel => _localizedValues[locale.languageCode]['ads'];

  String get categoriesLabel =>
      _localizedValues[locale.languageCode]['categories'];

  String get viewedLabel => _localizedValues[locale.languageCode]['viewed'];

  String get searchLabel => _localizedValues[locale.languageCode]['search'];

  String get arabicLabel => _localizedValues[locale.languageCode]['arabic'];

  String get chooseCountryLabel =>
      _localizedValues[locale.languageCode]['choose_country'];

  String get currentLocationLabel =>
      _localizedValues[locale.languageCode]['current_location'];

  String get shopsLabel => _localizedValues[locale.languageCode]['shops'];

  String get mainLabel => _localizedValues[locale.languageCode]['main'];

  String get myChatsLabel => _localizedValues[locale.languageCode]['my_chats'];

  String get addPostLabel => _localizedValues[locale.languageCode]['add_post'];

  String get noticesLabel => _localizedValues[locale.languageCode]['notices'];

  String get profileLabel => _localizedValues[locale.languageCode]['profile'];

  String get nextLabel => _localizedValues[locale.languageCode]['next'];

  String get emailRequiredLabel =>
      _localizedValues[locale.languageCode]['email_required'];

  String get myProfileLabel =>
      _localizedValues[locale.languageCode]['my_profile'];

  //ads tab texts
  String get fashionLabel =>
      _localizedValues[locale.languageCode]['fashion_cat'];

  String get homeCategoryLabel =>
      _localizedValues[locale.languageCode]['home_cat'];

  String get furnitureCategoryLabel =>
      _localizedValues[locale.languageCode]['fur_cat'];

  String get electronicsCategoryLabel =>
      _localizedValues[locale.languageCode]['electronics_cat'];

  String get mobileCategoryLabel =>
      _localizedValues[locale.languageCode]['mobile_cat'];

  String get carCategoryLabel =>
      _localizedValues[locale.languageCode]['car_cat'];

  String get carBikesLabel =>
      _localizedValues[locale.languageCode]['cars_and_bikes'];

  String get phoneTabletsLabel =>
      _localizedValues[locale.languageCode]['phone_and_tablets'];

  String get electronicsAppliancesLabel =>
      _localizedValues[locale.languageCode]['electronics_appliances'];

  String get furnitureDecorLabel =>
      _localizedValues[locale.languageCode]['fur_decor'];

  String get realEstateLabel =>
      _localizedValues[locale.languageCode]['real_estate'];

  String get viewMoreLabel =>
      _localizedValues[locale.languageCode]['view_more'];

  String get postFreeAdButtonLabel =>
      _localizedValues[locale.languageCode]['post_free_add'];

  //categories tab texts
  String get mobileTabletsCategoryLabel =>
      _localizedValues[locale.languageCode]['mobile_tablets'];

  String get videoGamesCategoryLabel =>
      _localizedValues[locale.languageCode]['video_games'];

  String get realEstateSaleCategoryLabel =>
      _localizedValues[locale.languageCode]['real_estate_sale'];

  String get realEstateRentCategoryLabel =>
      _localizedValues[locale.languageCode]['real_estate_rent'];

  String get womenFashionCategoryLabel =>
      _localizedValues[locale.languageCode]['women_fashion'];

  String get babyKidsCategoryLabel =>
      _localizedValues[locale.languageCode]['baby_kids'];

  String get menFashionCategoryLabel =>
      _localizedValues[locale.languageCode]['men_fashion'];

  String get foodSupplementsCategoryLabel =>
      _localizedValues[locale.languageCode]['food_supplements'];

  String get servicesCategoryLabel =>
      _localizedValues[locale.languageCode]['services'];

  String get jobCategoryLabel => _localizedValues[locale.languageCode]['job'];

  String get jobSeekersCategoryLabel =>
      _localizedValues[locale.languageCode]['job_seekers'];

  String get petsCategoryLabel => _localizedValues[locale.languageCode]['pets'];

  String get booksSportsCategoryLabel =>
      _localizedValues[locale.languageCode]['books_sports'];

  String get funnyAdsCategoryLabel =>
      _localizedValues[locale.languageCode]['funny_ads'];

  String get businessCategoryLabel =>
      _localizedValues[locale.languageCode]['business'];

  String get allCategoryLabel =>
      _localizedValues[locale.languageCode]['all_categories'];

  //listViewBigCard texts
  String get adTitleSwiftLabel =>
      _localizedValues[locale.languageCode]['ad_title_swift'];

  String get adTitleIphoneLabel =>
      _localizedValues[locale.languageCode]['ad_title_iphone'];

  String get adDescSwiftLabel =>
      _localizedValues[locale.languageCode]['ad_desc_swift'];

  String get adDescIphoneLabel =>
      _localizedValues[locale.languageCode]['ad_desc_iphone'];

  String get adDescJaguarLabel =>
      _localizedValues[locale.languageCode]['ad_desc_jaguar'];

  String get adDescAccordLabel =>
      _localizedValues[locale.languageCode]['ad_desc_accord'];

  String get adDescAudiLabel =>
      _localizedValues[locale.languageCode]['ad_desc_audi'];

  String get adLocationLabel =>
      _localizedValues[locale.languageCode]['ad_location'];

  String get adDateLabel => _localizedValues[locale.languageCode]['ad_date'];

  String get adPriceSwiftLabel =>
      _localizedValues[locale.languageCode]['ad_price_swift'];

  String get adPriceIphoneLabel =>
      _localizedValues[locale.languageCode]['ad_price_iphone'];

  String get adPriceAccordLabel =>
      _localizedValues[locale.languageCode]['ad_price_accord'];

  String get adPriceJaguarLabel =>
      _localizedValues[locale.languageCode]['ad_price_jaguar'];

  String get adCallLabel => _localizedValues[locale.languageCode]['ad_call'];

  String get adCommentLabel => _localizedValues[locale.languageCode]['ad_comment'];
  String get theCommentLabel => _localizedValues[locale.languageCode]['the_comments'];

  String get adChatLabel => _localizedValues[locale.languageCode]['ad_chat'];

  String get adImageCountLabel =>
      _localizedValues[locale.languageCode]['ad_image_count'];

  String get adCommentCountLabel =>
      _localizedValues[locale.languageCode]['ad_comment_count'];

  //listViewSmallCard texts
  String get adTitleAccordLabel =>
      _localizedValues[locale.languageCode]['ad_title_accord'];

  String get adTitleJaguarLabel =>
      _localizedValues[locale.languageCode]['ad_title_jaguar'];

  String get adTitleAudiLabel =>
      _localizedValues[locale.languageCode]['ad_title_audi'];

  String get adPriceAudiLabel =>
      _localizedValues[locale.languageCode]['ad_price_audi'];

  String get adTitleS10Label =>
      _localizedValues[locale.languageCode]['ad_title_S10'];

  String get adTitleOnePlusLabel =>
      _localizedValues[locale.languageCode]['ad_title_oneplus'];

  String get adTitlePixelLabel =>
      _localizedValues[locale.languageCode]['ad_title_pixel'];

  String get adPriceS10Label =>
      _localizedValues[locale.languageCode]['ad_price_S10'];

  String get adPriceOnePlusLabel =>
      _localizedValues[locale.languageCode]['ad_price_oneplus'];

  String get adPricePixelLabel =>
      _localizedValues[locale.languageCode]['ad_price_pixel'];

  String get adCallPriceLabel =>
      _localizedValues[locale.languageCode]['cal_for_pricee'];

  //shopsTabs texts
  String get filterLabel => _localizedValues[locale.languageCode]['filter'];

  String get allCategoriesLabel =>
      _localizedValues[locale.languageCode]['all_categories'];

  String get openShopLabel =>
      _localizedValues[locale.languageCode]['open_shop'];

  String get shopsTitleVisaLabel =>
      _localizedValues[locale.languageCode]['shops_title_visa'];

  String get shopsTitleSchoolLabel =>
      _localizedValues[locale.languageCode]['shops_title_school'];

  String get shopsLocationLabel =>
      _localizedValues[locale.languageCode]['shops_location'];

  String get shopsPostCountLabel =>
      _localizedValues[locale.languageCode]['shops_post_count'];

  //category_detail_view texts
  String get searchCarsLabel =>
      _localizedValues[locale.languageCode]['search_cars'];

  String get categoryLabel => _localizedValues[locale.languageCode]['category'];

  String get searchResultLabel =>
      _localizedValues[locale.languageCode]['search_results'];

  String get searchResultCountLabel =>
      _localizedValues[locale.languageCode]['search_results_count'];

  //ad_detail_view texts
  String get sellerUsernameLabel =>
      _localizedValues[locale.languageCode]['seller_username'];

  String get onlineLabel => _localizedValues[locale.languageCode]['online'];

  String get offlineLabel => _localizedValues[locale.languageCode]['offline'];

  String get detailPriceLabel =>
      _localizedValues[locale.languageCode]['detail_price'];

  String get adDetailCityLabel =>
      _localizedValues[locale.languageCode]['ad_detail_city'];

  String get adDetailCityAmmanLabel =>
      _localizedValues[locale.languageCode]['ad_detail_amman'];

  String get adDetailMakeLabel =>
      _localizedValues[locale.languageCode]['ad_detail_make'];

  String get adDetailMakeToyotaLabel =>
      _localizedValues[locale.languageCode]['ad_detail_toyota'];

  String get adDetailModelLabel =>
      _localizedValues[locale.languageCode]['ad_detail_model'];

  String get adDetailModelInnovaLabel =>
      _localizedValues[locale.languageCode]['ad_detail_model_innova'];

  String get adDetailYearLabel =>
      _localizedValues[locale.languageCode]['ad_detail_year'];

  String get adDetailYear2016Label =>
      _localizedValues[locale.languageCode]['ad_detail_year_2016'];

  String get adDetailConditionLabel =>
      _localizedValues[locale.languageCode]['ad_detail_condition'];

  String get adDetailConditionUsedLabel =>
      _localizedValues[locale.languageCode]['ad_detail_condition_used'];

  String get adDetailKilometersLabel =>
      _localizedValues[locale.languageCode]['ad_detail_kilometers'];

  String get adDetailKilometers65436Label =>
      _localizedValues[locale.languageCode]['ad_detail_kilometers_65436'];

  String get adDetailTransmissionLabel =>
      _localizedValues[locale.languageCode]['ad_detail_transmission'];

  String get adDetailTransmissionAutomaticLabel =>
      _localizedValues[locale.languageCode]['ad_detail_transmission_automatic'];

  String get adDetailFuelLabel =>
      _localizedValues[locale.languageCode]['ad_detail_fuel'];

  String get adDetailFuelGasolineLabel =>
      _localizedValues[locale.languageCode]['ad_detail_fuel_gasoline'];

  String get adDetailColorLabel =>
      _localizedValues[locale.languageCode]['ad_detail_color'];

  String get adDetailColorBlackLabel =>
      _localizedValues[locale.languageCode]['ad_detail_color_black'];

  String get adDetailPaymentLabel =>
      _localizedValues[locale.languageCode]['ad_detail_payment'];

  String get adDetailPaymentCashLabel =>
      _localizedValues[locale.languageCode]['ad_detail_payment_cash'];

  String get adDetailPostIdLabel =>
      _localizedValues[locale.languageCode]['ad_detail_postid'];

  String get adDetailPostId1234Label =>
      _localizedValues[locale.languageCode]['ad_detail_postid_1234'];

  String get adDetailPriceLabel =>
      _localizedValues[locale.languageCode]['ad_detail_price'];

  String get adDetailDescLabel =>
      _localizedValues[locale.languageCode]['ad_detail_desc'];

  String get adDetailDescBodyLabel =>
      _localizedValues[locale.languageCode]['ad_detail_desc_body'];

  String get adDetailVerifiedLabel =>
      _localizedValues[locale.languageCode]['ad_detail_verified'];

  String get adDetailAdCountLabel =>
      _localizedValues[locale.languageCode]['ad_detail_adcount'];

  String get adDetailMembersSinceLabel =>
      _localizedValues[locale.languageCode]['ad_detail_memberssince'];

  String get adDetailNumberLabel =>
      _localizedValues[locale.languageCode]['ad_detail_number'];

  String get adDetailSimilarAdsLabel =>
      _localizedValues[locale.languageCode]['ad_detail_similarads'];

  String get adDetailPhotosCountLabel =>
      _localizedValues[locale.languageCode]['ad_detail_photos_count'];

  //userProfile texts
  String get usernameLabel => _localizedValues[locale.languageCode]['username'];

  String get membershipLinkLabel =>
      _localizedValues[locale.languageCode]['membership_link'];

  //login_view texts
  String get sellChatBuyLabel =>
      _localizedValues[locale.languageCode]['sell_chat_buy'];

  String get facebookLabel => _localizedValues[locale.languageCode]['facebook'];

  String get googleLabel => _localizedValues[locale.languageCode]['google'];

  String get signUpButtonLabel =>
      _localizedValues[locale.languageCode]['sign_up_button'];

  String get termsCondition1Label =>
      _localizedValues[locale.languageCode]['terms_condition_1'];

  String get termsCondition2Label =>
      _localizedValues[locale.languageCode]['terms_condition_2'];

  String get orLabel => _localizedValues[locale.languageCode]['or'];

  //sign_up_view texts
  String get signUpLabel => _localizedValues[locale.languageCode]['sign_up'];

  String get loginLabel => _localizedValues[locale.languageCode]['login'];

  String get nameLabel => _localizedValues[locale.languageCode]['name'];

  String get emailLabel => _localizedValues[locale.languageCode]['email'];

  String get phoneCodeLabel =>
      _localizedValues[locale.languageCode]['phone_code'];

  String get mobileNumberLabel =>
      _localizedValues[locale.languageCode]['mobile_number'];

  String get passwordLabel => _localizedValues[locale.languageCode]['password'];

  String get createAccountButtonLabel =>
      _localizedValues[locale.languageCode]['create_account'];

  //chat_view texts
  String get sendMessageLabel =>
      _localizedValues[locale.languageCode]['send_message'];

  String get hint1Label => _localizedValues[locale.languageCode]['hint_1'];

  String get sendLabel => _localizedValues[locale.languageCode]['send'];

  String get hint2Label => _localizedValues[locale.languageCode]['hint_2'];

  //company_profile_view texts
  String get companyNameLabel =>
      _localizedValues[locale.languageCode]['comapny_name'];

  String get companyNumberLabel =>
      _localizedValues[locale.languageCode]['comapny_number'];

  String get companyInfoTabLabel =>
      _localizedValues[locale.languageCode]['comapny_info_tab'];

  String get companyLocationLabel =>
      _localizedValues[locale.languageCode]['comapny_location'];

  String get saturdayLabel => _localizedValues[locale.languageCode]['saturday'];

  String get sundayLabel => _localizedValues[locale.languageCode]['sunday'];

  String get mondayLabel => _localizedValues[locale.languageCode]['monday'];

  String get tuesdayLabel => _localizedValues[locale.languageCode]['tuesday'];

  String get wednesdayLabel =>
      _localizedValues[locale.languageCode]['wednesday'];

  String get thursdayLabel => _localizedValues[locale.languageCode]['thursday'];

  String get fridayLabel => _localizedValues[locale.languageCode]['friday'];

  String get companyTimeLabel =>
      _localizedValues[locale.languageCode]['company_time'];

  String get companyDescLabel =>
      _localizedValues[locale.languageCode]['company_desc'];

  String get shopCategoryLabel =>
      _localizedValues[locale.languageCode]['shop_category'];

  String get shopCityLabel =>
      _localizedValues[locale.languageCode]['shop_city'];

  //my_chats_view texts
  String get noAdsLabel => _localizedValues[locale.languageCode]['no_ads'];

  String get allAdsLabel => _localizedValues[locale.languageCode]['all_ads'];

  String get unreadLabel => _localizedValues[locale.languageCode]['unread'];

  String get chatUsername1Label =>
      _localizedValues[locale.languageCode]['chat_username_1'];

  String get chatUsername2Label =>
      _localizedValues[locale.languageCode]['chat_username_2'];

  String get chatLastMessage1Label =>
      _localizedValues[locale.languageCode]['chat_message_1'];

  String get chatLastMessage2Label =>
      _localizedValues[locale.languageCode]['chat_message_2'];

  String get chatTimeLabel =>
      _localizedValues[locale.languageCode]['chat_time'];

  String get chatAdTitle1Label =>
      _localizedValues[locale.languageCode]['chat_ad_title_1'];

  String get chatAdTitle2Label =>
      _localizedValues[locale.languageCode]['chat_ad_title_2'];

  String get chatSearchLabel =>
      _localizedValues[locale.languageCode]['chat_search'];

  //profile_view texts
  String get myAdsLabel => _localizedValues[locale.languageCode]['my_ads'];

  String get editProfileLabel =>
      _localizedValues[locale.languageCode]['edit_profile'];

  String get buildTrustLabel =>
      _localizedValues[locale.languageCode]['build_trust'];

  String get walletLabel => _localizedValues[locale.languageCode]['wallet'];

  String get accountMemberLabel =>
      _localizedValues[locale.languageCode]['account_member'];

  String get accountProfileLabel =>
      _localizedValues[locale.languageCode]['account_profile'];

  String get settingsLabel => _localizedValues[locale.languageCode]['settings'];

  String get favAdsLabel =>
      _localizedValues[locale.languageCode]['favourite_ads'];

  String get shareProfileLabel =>
      _localizedValues[locale.languageCode]['share_profile'];

  String get shareAppLabel =>
      _localizedValues[locale.languageCode]['share_app'];

  String get contactUsLabel =>
      _localizedValues[locale.languageCode]['contact_us'];

  String get helpLabel => _localizedValues[locale.languageCode]['help'];

  String get aboutAppLabel =>
      _localizedValues[locale.languageCode]['about_app'];

  //settings_view texts
  String get countryLabel => _localizedValues[locale.languageCode]['country'];

  String get generalLabel => _localizedValues[locale.languageCode]['general'];

  String get accountLabel => _localizedValues[locale.languageCode]['account'];

  String get cityLabel => _localizedValues[locale.languageCode]['city'];

  String get neigbourhoodLabel =>
      _localizedValues[locale.languageCode]['neighbourhood'];

  String get jordanLabel => _localizedValues[locale.languageCode]['jordan'];

  String get turkeyLabel => _localizedValues[locale.languageCode]['turkey'];

  String get englishLabel => _localizedValues[locale.languageCode]['english'];

  String get languageLabel => _localizedValues[locale.languageCode]['language'];

  String get notificationLabel =>
      _localizedValues[locale.languageCode]['notification'];

  String get termsOfUseLabel =>
      _localizedValues[locale.languageCode]['terms_of_use'];

  String get logoutLabel => _localizedValues[locale.languageCode]['logout'];

  //notices_view texts
  String get myNotificationsLabel =>
      _localizedValues[locale.languageCode]['my_notifications'];

  String get markReadLabel =>
      _localizedValues[locale.languageCode]['mark_read'];

  String get continueMobileLabel =>
      _localizedValues[locale.languageCode]['continue_mobile'];

  String get yesterdayLabel =>
      _localizedValues[locale.languageCode]['yesterday'];

  String get noticesTimeLabel =>
      _localizedValues[locale.languageCode]['notices_time'];

  //add_post_view texts
  String get insertAdLabel =>
      _localizedValues[locale.languageCode]['insert_ad'];

  String get editAdLabel =>
      _localizedValues[locale.languageCode]['edit_ad'];

  String get addPhotoLabel =>
      _localizedValues[locale.languageCode]['add_photo'];

  String get addWarningLabel =>
      _localizedValues[locale.languageCode]['add_warning'];

  String get typeLabel => _localizedValues[locale.languageCode]['type'];

  String get currencyTypeLabel =>
      _localizedValues[locale.languageCode]['cuurency_type'];

  String get listingLabel => _localizedValues[locale.languageCode]['listing'];

  String get addTitleLabel =>
      _localizedValues[locale.languageCode]['add_title'];

  String get addDescLabel => _localizedValues[locale.languageCode]['add_desc'];

  String get saveInsertAddButtonLabel =>
      _localizedValues[locale.languageCode]['save_insert_button'];

  String get editPictureLabel =>
      _localizedValues[locale.languageCode]['edit_picture'];

  String get cameraPictureLabel =>
      _localizedValues[locale.languageCode]['camera_picture'];

  String get albumPictureLabel =>
      _localizedValues[locale.languageCode]['album_picture'];

  String get retakePictureLabel =>
      _localizedValues[locale.languageCode]['retake_picture'];

  String get repickPictureLabel =>
      _localizedValues[locale.languageCode]['repick_picture'];

  String get deleteLabel => _localizedValues[locale.languageCode]['delete'];

  String get makeMainImageLabel =>
      _localizedValues[locale.languageCode]['make_main_image'];

  //category_list_view texts
  String get consolesLabel => _localizedValues[locale.languageCode]['consoles'];

  String get videoGamesLabel =>
      _localizedValues[locale.languageCode]['video_games'];

  String get accessoriesLabel =>
      _localizedValues[locale.languageCode]['accessories'];

  String get gamingCardsLabel =>
      _localizedValues[locale.languageCode]['gaming_cards'];

  String get accountsLabel => _localizedValues[locale.languageCode]['accounts'];

  String get actionLabel => _localizedValues[locale.languageCode]['action'];

  String get otherLabel => _localizedValues[locale.languageCode]['other'];

  String get playStation4Label =>
      _localizedValues[locale.languageCode]['playstation_4'];

  String get playStation3Label =>
      _localizedValues[locale.languageCode]['playstation_3'];

  String get playStation2Label =>
      _localizedValues[locale.languageCode]['playstation_2'];

  String get playStation1Label =>
      _localizedValues[locale.languageCode]['playstation_1'];

  String get playStation4ProLabel =>
      _localizedValues[locale.languageCode]['playstation_4_pro'];

  String get pspLabel => _localizedValues[locale.languageCode]['psp'];

  String get xboxOneLabel => _localizedValues[locale.languageCode]['xbox_one'];

  String get xbox360Label => _localizedValues[locale.languageCode]['xbox_360'];

  String get xboxOneSLabel =>
      _localizedValues[locale.languageCode]['xbox_one_S'];

  String get xboxOneXLabel =>
      _localizedValues[locale.languageCode]['xbox_one_X'];

  String get nintendoWLabel =>
      _localizedValues[locale.languageCode]['nintendo_w'];

  String get nintendoWULabel =>
      _localizedValues[locale.languageCode]['nintendo_w_u'];

  String get nintendo3DLabel =>
      _localizedValues[locale.languageCode]['nintendo_3d'];

  String get nintendoSwitchLabel =>
      _localizedValues[locale.languageCode]['nintendo_switch'];

  String get gamingLabel => _localizedValues[locale.languageCode]['gaming'];

  String get usedLabel => _localizedValues[locale.languageCode]['used'];

  String get oldLabel => _localizedValues[locale.languageCode]['old'];

  String get subCategoryLabel =>
      _localizedValues[locale.languageCode]['subcategory'];

  String get requestedPriceLabel =>
      _localizedValues[locale.languageCode]['requested_price'];

  //my_ads_view texts
  String get activeLabel => _localizedValues[locale.languageCode]['active'];

  String get inActiveLabel => _localizedValues[locale.languageCode]['inactive'];

  String get upgradeLabel => _localizedValues[locale.languageCode]['upgrade'];

  String get adsLeftLabel => _localizedValues[locale.languageCode]['ads_left'];

  String get increaseLimitLabel =>
      _localizedValues[locale.languageCode]['increase_limit'];

  String get searchMyAdsLabel =>
      _localizedValues[locale.languageCode]['search_my_ads'];

  String get dropLiveMyAdsLabel =>
      _localizedValues[locale.languageCode]['drop_down_live'];

  String get dropFeaturedMyAdsLabel =>
      _localizedValues[locale.languageCode]['drop_down_featured'];

  String get nowLabel => _localizedValues[locale.languageCode]['now'];

  String get onlineForLabel =>
      _localizedValues[locale.languageCode]['online_for'];

  String get expiredLabel => _localizedValues[locale.languageCode]['expired'];

  String get verifyLabel => _localizedValues[locale.languageCode]['verify'];

  String get editLabel => _localizedValues[locale.languageCode]['edit'];

  String get chatLabel => _localizedValues[locale.languageCode]['chat'];

  String get shareLabel => _localizedValues[locale.languageCode]['share'];

  String get statsLabel => _localizedValues[locale.languageCode]['stats'];

  String get peopleSawLabel =>
      _localizedValues[locale.languageCode]['people_saw'];

  String get boostLabel => _localizedValues[locale.languageCode]['boost'];

  //my_ads_detail_view texts
  String get pendingLabel => _localizedValues[locale.languageCode]['pending'];

  String get pendingBodyLabel =>
      _localizedValues[locale.languageCode]['pending_body'];

  String get shareAdLabel => _localizedValues[locale.languageCode]['share_ad'];

  String get viewsLabel => _localizedValues[locale.languageCode]['views'];

  String get callsLabel => _localizedValues[locale.languageCode]['calls'];

  String get showStatsLabel =>
      _localizedValues[locale.languageCode]['show_stats'];

  String get getLabel => _localizedValues[locale.languageCode]['get'];

  String get moreViewsLabel =>
      _localizedValues[locale.languageCode]['more_views'];

  String get byLabel => _localizedValues[locale.languageCode]['by'];

  String get featuredByLabel =>
      _localizedValues[locale.languageCode]['featured_by'];

  String get buyLabel => _localizedValues[locale.languageCode]['buy'];

  String get viewTimesLabel =>
      _localizedValues[locale.languageCode]['view_times'];

  String get sevenDayLabel =>
      _localizedValues[locale.languageCode]['seven_day'];

  String get zeroSixTwoLabel =>
      _localizedValues[locale.languageCode]['zero_six'];

  String get zeroNineTwoLabel =>
      _localizedValues[locale.languageCode]['zero_nine'];

  String get perDayLabel => _localizedValues[locale.languageCode]['per_day'];

  String get fourThreeOneLabel =>
      _localizedValues[locale.languageCode]['four_three'];

  String get sixFourSevenLabel =>
      _localizedValues[locale.languageCode]['six_four'];

  String get showDetailsLabel =>
      _localizedValues[locale.languageCode]['show_details'];

  String get turboLabel => _localizedValues[locale.languageCode]['turbo'];

  //stats_view texts
  String get viewSubtitleLabel =>
      _localizedValues[locale.languageCode]['view_subtitle'];

  String get callSubtitleLabel =>
      _localizedValues[locale.languageCode]['call_subtitle'];

  String get notEnoughDataLabel =>
      _localizedValues[locale.languageCode]['not_enough_data'];

  //dialogBox
  String get twitterLabel => _localizedValues[locale.languageCode]['twitter'];

  String get googleBuildLabel =>
      _localizedValues[locale.languageCode]['google_build'];

  String get getFasterLabel =>
      _localizedValues[locale.languageCode]['get_faster'];

  //my_wallet_view texts
  String get creditsLabel => _localizedValues[locale.languageCode]['credits'];

  String get transactionsLabel =>
      _localizedValues[locale.languageCode]['transactions'];
  String get chooseTransactionsLabel =>
      _localizedValues[locale.languageCode]['choose_transaction'];

  String get currentBalanceLabel =>
      _localizedValues[locale.languageCode]['current_balance'];

  String get buyCreditsLabel =>
      _localizedValues[locale.languageCode]['buy_credits'];

  String get redeemLabel => _localizedValues[locale.languageCode]['redeem'];

  String get lastTopUpLabel =>
      _localizedValues[locale.languageCode]['last_top_up'];

  String get bundlesLabel => _localizedValues[locale.languageCode]['bundles'];

  String get wantDiscountLabel =>
      _localizedValues[locale.languageCode]['want_discount'];

  //edit_profile_view texts
  String get saveLabel => _localizedValues[locale.languageCode]['save'];

  String get choosePhotoLabel =>
      _localizedValues[locale.languageCode]['choose_photo'];

/*  String get firstNameLabel =>
      _localizedValues[locale.languageCode]['first_name'];

  String get lastNameLabel =>
      _localizedValues[locale.languageCode]['last_name'];*/

  String get prefixLinkLabel =>
      _localizedValues[locale.languageCode]['prefix_link'];

  String get suffixLinkLabel =>
      _localizedValues[locale.languageCode]['suffix_link'];

  String get emailIdLabel => _localizedValues[locale.languageCode]['email_id'];

  String get hideNumberLabel =>
      _localizedValues[locale.languageCode]['hide_number'];

  String get changePasswordLabel =>
      _localizedValues[locale.languageCode]['change_password'];

  String get facebookBuildLabel =>
      _localizedValues[locale.languageCode]['facebook_build'];

  //location_view texts
  String get citiesLabel => _localizedValues[locale.languageCode]['cities'];

  String get jeddahLabel => _localizedValues[locale.languageCode]['jeddah'];

  String get meccaLabel => _localizedValues[locale.languageCode]['mecca'];

  String get alMadhinaLabel =>
      _localizedValues[locale.languageCode]['al_madhina'];

  String get dammamLabel => _localizedValues[locale.languageCode]['dammam'];

  String get tabukLabel => _localizedValues[locale.languageCode]['tabuk'];

  String get buraidahLabel => _localizedValues[locale.languageCode]['buraidah'];

  String get hailLabel => _localizedValues[locale.languageCode]['hail'];

  String get sakakahLabel => _localizedValues[locale.languageCode]['sakakah'];

  String get jazanLabel => _localizedValues[locale.languageCode]['jazan'];

  String get alBahahLabel => _localizedValues[locale.languageCode]['al_bahah'];

  String get najranLabel => _localizedValues[locale.languageCode]['najran'];

  String get ararLabel => _localizedValues[locale.languageCode]['arar'];

  String get abhaLabel => _localizedValues[locale.languageCode]['abha'];

  String get rafhaLabel => _localizedValues[locale.languageCode]['rafha'];

  String get turaifLabel => _localizedValues[locale.languageCode]['turai'];

  String get taifLabel => _localizedValues[locale.languageCode]['taif'];

  String get dubaLabel => _localizedValues[locale.languageCode]['duba'];

//location_view_neighbourhood texts
  String get allNeighbourhoodLabel =>
      _localizedValues[locale.languageCode]['all_neighbourhood'];

  String get firstCircleLabel =>
      _localizedValues[locale.languageCode]['first_circle'];

  String get secondCircleLabel =>
      _localizedValues[locale.languageCode]['second_circle'];

  String get thirdCircleLabel =>
      _localizedValues[locale.languageCode]['third_circle'];

  String get fourthCircleLabel =>
      _localizedValues[locale.languageCode]['fourth_circle'];

  String get fifthCircleLabel =>
      _localizedValues[locale.languageCode]['fifth_circle'];

  String get sixthCircleLabel =>
      _localizedValues[locale.languageCode]['sixth_circle'];

  String get seventhCircleLabel =>
      _localizedValues[locale.languageCode]['seventh_circle'];

  String get eigthCircleLabel =>
      _localizedValues[locale.languageCode]['eigth_circle'];

  String get abdaliLabel => _localizedValues[locale.languageCode]['abdali'];

  String get abdounLabel => _localizedValues[locale.languageCode]['abdoun'];

  //choose_category_view texts
  String get anyLabel => _localizedValues[locale.languageCode]['any'];

  String get carForSaleLabel =>
      _localizedValues[locale.languageCode]['car_for_sale'];

  String get carsRentalLabel =>
      _localizedValues[locale.languageCode]['cars_rental'];

  String get motorcycleLabel =>
      _localizedValues[locale.languageCode]['motorcycle'];

  String get carPlateNumberLabel =>
      _localizedValues[locale.languageCode]['car_plate_number'];

  String get carAccessoriesLabel =>
      _localizedValues[locale.languageCode]['car_accessories'];

  String get wheelsRimsLabel =>
      _localizedValues[locale.languageCode]['wheels_rims'];

  String get truckMachineryLabel =>
      _localizedValues[locale.languageCode]['truck_machinery'];

  String get boatsYatchLabel =>
      _localizedValues[locale.languageCode]['boats_yatch'];

  String get othersCarsLabel =>
      _localizedValues[locale.languageCode]['others_cars'];

  String get chooseCategoryLabel =>
      _localizedValues[locale.languageCode]['choose_category'];

  //filter_view texts
  String get followingAdsLabel =>
      _localizedValues[locale.languageCode]['following_ads'];

  String get fromLabel => _localizedValues[locale.languageCode]['from'];

  String get toLabel => _localizedValues[locale.languageCode]['to'];

  String get donationsLabel =>
      _localizedValues[locale.languageCode]['donations'];

  String get adsWithLabel => _localizedValues[locale.languageCode]['ads_with'];

  String get showSearchLabel =>
      _localizedValues[locale.languageCode]['show_search'];

  String get showPremiumLabel =>
      _localizedValues[locale.languageCode]['show_premium'];

  String get premiumLabel => _localizedValues[locale.languageCode]['premium'];

  String get sortByLabel =>
      _localizedValues[locale.languageCode]['sort_by_label'];

  String get relevantLabel => _localizedValues[locale.languageCode]['relevant'];

  String get latestLabel => _localizedValues[locale.languageCode]['latest'];

  String get akshayLabel => _localizedValues[locale.languageCode]['akshay'];

  String get commentContentLabel =>
      _localizedValues[locale.languageCode]['comment_content'];

  String get loadMoreLabel =>
      _localizedValues[locale.languageCode]['load_more'];

  String get certifiedSellerLabel =>
      _localizedValues[locale.languageCode]['certified_seller'];

  String get resetFieldLabel =>
      _localizedValues[locale.languageCode]['reset_field'];

  String get filterResultsLabel =>
      _localizedValues[locale.languageCode]['filter_results'];

  String get selectLanguageLabel =>
      _localizedValues[locale.languageCode]['select_language'];

  String get selectRegionLabel =>
      _localizedValues[locale.languageCode]['region'];

  String get prevAdLabel =>
      _localizedValues[locale.languageCode]['prev_ad_label'];

  String get nextAdLabel =>
      _localizedValues[locale.languageCode]['next_ad_label'];

  String get addCommentAdLabel =>
      _localizedValues[locale.languageCode]['add_comment_label'];

  String get commentHereAdLabel =>
      _localizedValues[locale.languageCode]['comment_here_label'];

  String get limitLiveAdsLabel =>
      _localizedValues[locale.languageCode]['limit_live_ads'];

  String get liveAdsLabel => _localizedValues[locale.languageCode]['live_ads'];

  String get remainingAdsLabel =>
      _localizedValues[locale.languageCode]['remaining'];

  String get upgradeAccountLabel =>
      _localizedValues[locale.languageCode]['upgrade_account'];

  String get paidAdsLabel => _localizedValues[locale.languageCode]['paid_ads'];

  String get accountTypeLabel =>
      _localizedValues[locale.languageCode]['account_type'];

  String get accountOverviewLabel =>
      _localizedValues[locale.languageCode]['account_overview'];

  String get urgentLabel => _localizedValues[locale.languageCode]['urgent'];

  String get upgradeYourAccountLabel =>
      _localizedValues[locale.languageCode]['upgrade_your_account'];

  String get moreLabel => _localizedValues[locale.languageCode]['more'];

  String get adsForCategoryLabel =>
      _localizedValues[locale.languageCode]['ads_for_category'];

  String get upgradeInfoLabel =>
      _localizedValues[locale.languageCode]['upgrade_info'];

  String get silverPremiumAccountLabel =>
      _localizedValues[locale.languageCode]['silver_premium_account'];

  String get goldPremiumAccountLabel =>
      _localizedValues[locale.languageCode]['gold_premium_account'];

  String get shopAccountLabel =>
      _localizedValues[locale.languageCode]['shop_account'];

  String get monthLabel => _localizedValues[locale.languageCode]['month'];

  String get needHelpLabel =>
      _localizedValues[locale.languageCode]['need_help'];

  String get termsConditionsLabel =>
      _localizedValues[locale.languageCode]['terms_&_condition'];

  String get alreadyRegisteredLabel =>
      _localizedValues[locale.languageCode]['already_registered'];

  String get alreadyRegisteredWithFacebookLabel =>
      _localizedValues[locale.languageCode]['already_registered_with_facebook'];

  String get alreadyRegisteredWithGoogleLabel =>
      _localizedValues[locale.languageCode]['already_registered_with_google'];

  String get loginSuccessfulLabel =>
      _localizedValues[locale.languageCode]['login_successful'];

  String get invalidEmailLabel =>
      _localizedValues[locale.languageCode]['invalid_email'];

  String get statusLabel => _localizedValues[locale.languageCode]['status'];

  String get okLabel => _localizedValues[locale.languageCode]['ok'];

  String get noMessagesLabel =>
      _localizedValues[locale.languageCode]['no_messages'];



  // Newely Added

  String get pleaseWaitSubmit =>
      _localizedValues[locale.languageCode]['please_wait_submit'];

  String get pleaseWait => _localizedValues[locale.languageCode]['please_wait'];

  String get loading => _localizedValues[locale.languageCode]['loading'];

  String get noAdsFound =>
      _localizedValues[locale.languageCode]['no_ads_found'];

  String get emailRequired =>
      _localizedValues[locale.languageCode]['email_required'];

  String get priceHighest =>
      _localizedValues[locale.languageCode]['price_highest'];

  String get priceLowest =>
      _localizedValues[locale.languageCode]['price_lowest'];

  String get enterNeighbourhood =>
      _localizedValues[locale.languageCode]['enter_neighbourhood'];

  String get pleaseWaitLoadingData =>
      _localizedValues[locale.languageCode]['please_wait_loading_data'];

  String get cancel => _localizedValues[locale.languageCode]['cancel'];

  String get logoutMsg => _localizedValues[locale.languageCode]['logout_msg'];

  String get confirmLogout =>
      _localizedValues[locale.languageCode]['confirm_logout'];

  String get categoryListing => _localizedValues[locale.languageCode]['category_listing'];
  String get categoryListing1 => _localizedValues[locale.languageCode]['category_listing_1'];


  String get enterPrice => _localizedValues[locale.languageCode]['enter_price'];
  String get validPrice => _localizedValues[locale.languageCode]['price_zero'];

  String get free => _localizedValues[locale.languageCode]['free'];

  String get failed =>_localizedValues[locale.languageCode]['failed'];

  String get submitFailed => _localizedValues[locale.languageCode]['submit_failed'];

  String get adUpdatedSuccessfully => _localizedValues[locale.languageCode]['ad_update_successful'];
  String get adUpdateFailed => _localizedValues[locale.languageCode]['ad_update_failed'];

  String get updateAd => _localizedValues[locale.languageCode]['update_ad'];

  String get success => _localizedValues[locale.languageCode]['success'];

  String get adPostedSuccessfully => _localizedValues[locale.languageCode]['ad_posted_successfully'];

  String get chooseCatSubcat => _localizedValues[locale.languageCode]['choose_cat_subcat'];

  String get chooseCurrency => _localizedValues[locale.languageCode]['choose_currency'];

  String get chooseRegion => _localizedValues[locale.languageCode]['choose_region'];

  String get chooseCity => _localizedValues[locale.languageCode]['choose_city'];

  String get enterDesc => _localizedValues[locale.languageCode]['enter_desc'];

  String get enterTitle => _localizedValues[locale.languageCode]['enter_title'];

  String get exchange => _localizedValues[locale.languageCode]['exchange'];

  String get rent => _localizedValues[locale.languageCode]['rent'];

  String get buy => _localizedValues[locale.languageCode]['buy'];

  String get sell => _localizedValues[locale.languageCode]['sell'];

  String get noCondition => _localizedValues[locale.languageCode]['no_condition'];

  String get used => _localizedValues[locale.languageCode]['used'];
  String get newLabel => _localizedValues[locale.languageCode]['new'];

  String get anyCondition =>_localizedValues[locale.languageCode]['any_condition'];
  String get chooseCondition =>_localizedValues[locale.languageCode]['choose_condition'];

  String get transaction => _localizedValues[locale.languageCode]['transaction'];

  String get currency => _localizedValues[locale.languageCode]['currency'];

  String get checkWithSeller => _localizedValues[locale.languageCode]['check_with_seller'];
  String get selectValue => _localizedValues[locale.languageCode]['select_value'];
  String get condition => _localizedValues[locale.languageCode]['condition'];
  String get anyTransaction => _localizedValues[locale.languageCode]['any_transaction'];

  String get hideMobileNo => _localizedValues[locale.languageCode]['hide_mobile_no'];
  String get enterLocalNo => _localizedValues[locale.languageCode]['please_enter_local_no'];
  String get signInSuccessful => _localizedValues[locale.languageCode]['sign_in_successful'];
  String get weeksAgo => _localizedValues[locale.languageCode]['weeks_ago'];
  String get yearsAgo => _localizedValues[locale.languageCode]['years_ago'];
  String get monthsAgo => _localizedValues[locale.languageCode]['months_ago'];
  String get minAgo => _localizedValues[locale.languageCode]['min_ago'];
  String get daysAgo => _localizedValues[locale.languageCode]['days_ago'];
  String get hourAgo => _localizedValues[locale.languageCode]['hour_ago'];
  String get justNow => _localizedValues[locale.languageCode]['just_now'];
  String get secAgo => _localizedValues[locale.languageCode]['sec_ago'];
  String get verifiedWith => _localizedValues[locale.languageCode]['verified_with'];

  String get yearsLabel => _localizedValues[locale.languageCode]['years'];
  String get monthsLabel => _localizedValues[locale.languageCode]['months'];
  String get weeksLabel => _localizedValues[locale.languageCode]['weeks'];
  String get daysLabel => _localizedValues[locale.languageCode]['days'];
  String get hourLabel => _localizedValues[locale.languageCode]['hour'];
  String get minLabel => _localizedValues[locale.languageCode]['min'];
  String get secLabel => _localizedValues[locale.languageCode]['sec'];
  String get agoLabel => _localizedValues[locale.languageCode]['ago'];

  String get getAllAdsByLabel => _localizedValues[locale.languageCode]['get_all_ads_by'];
  String get nameRequiredLabel => _localizedValues[locale.languageCode]['name_is_required'];
  String get invalidNameLabel => _localizedValues[locale.languageCode]['invalid_name'];
  String get nameMustLabel => _localizedValues[locale.languageCode]['name_must_be'];
  String get mobileRequiredLabel => _localizedValues[locale.languageCode]['mobile_required'];
  String get mobile11Label => _localizedValues[locale.languageCode]['mobile_must_11'];
  String get mobileDigitsLabel => _localizedValues[locale.languageCode]['mobile_must_digits'];
  String get password8Label => _localizedValues[locale.languageCode]['password_must_8'];
  String get comment5Label => _localizedValues[locale.languageCode]['comment_must_5'];
  String get lastWeekLabel => _localizedValues[locale.languageCode]['last_week'];
  String get lastMonthLabel => _localizedValues[locale.languageCode]['last_month'];
  String get lastYearLabel => _localizedValues[locale.languageCode]['last_year'];
  String get todayLabel => _localizedValues[locale.languageCode]['today'];

  String get showMoreLabel => _localizedValues[locale.languageCode]['show_more'];
  String get showLessLabel => _localizedValues[locale.languageCode]['show_less'];
  String get noCategoriesLabel => _localizedValues[locale.languageCode]['no_categories'];
  String get commentEmptyLabel => _localizedValues[locale.languageCode]['comment_empty'];
  String get noCitiesLabel => _localizedValues[locale.languageCode]['no_cities'];
  String get noRegionsLabel => _localizedValues[locale.languageCode]['no_regions'];

  String get firstNameLabel => _localizedValues[locale.languageCode]['first_name'];
  String get lastNameLabel => _localizedValues[locale.languageCode]['last_name'];
  String get currentPasswordLabel => _localizedValues[locale.languageCode]['current_password'];
  String get newPasswordLabel => _localizedValues[locale.languageCode]['new_password'];
  String get updatePasswordLabel => _localizedValues[locale.languageCode]['update_password'];
  String get wrongPasswordLabel => _localizedValues[locale.languageCode]['wrong_password'];
  String get passwordSuccessfullyLabel => _localizedValues[locale.languageCode]['password_successfully'];
  String get incorrectPasswordLabel => _localizedValues[locale.languageCode]['incorrect_password'];
  String get allTurkeyLabel => _localizedValues[locale.languageCode]['all_turkey'];

  String get itemDeletedLabel => _localizedValues[locale.languageCode]['item_deleted'];
  String get confirmDeleteLabel => _localizedValues[locale.languageCode]['confirm_delete'];
  String get sureDeleteLabel => _localizedValues[locale.languageCode]['sure_delete'];

  String get helloLabel => _localizedValues[locale.languageCode]['hello'];
  String get howAreYouLabel => _localizedValues[locale.languageCode]['how_are_you'];
  String get whatsPriceLabel => _localizedValues[locale.languageCode]['whats_price'];

  String get funnyListingLabel => _localizedValues[locale.languageCode]['funny_listing'];
  //String get pleaseWaitLabel => _localizedValues[locale.languageCode]['please_wait'];
  String get loginFailedLabel => _localizedValues[locale.languageCode]['login_failed'];
  String get signUpFailedLabel => _localizedValues[locale.languageCode]['sign_up_failed'];
  String get enterValidNameLabel => _localizedValues[locale.languageCode]['enter_valid_name'];
  String get pleaseSelectOptionLabel => _localizedValues[locale.languageCode]['please_select_option'];
  String get profileUpdatedSuccessfullyLabel => _localizedValues[locale.languageCode]['profile_updated_successfully'];
  String get captureImageLabel => _localizedValues[locale.languageCode]['capture_image'];
  String get pictureAlbumLabel => _localizedValues[locale.languageCode]['picture_album'];
  String get copiedClipboardLabel => _localizedValues[locale.languageCode]['copied_clipboard'];

  String get selectOptionLabel => _localizedValues[locale.languageCode]['select_option'];
  String get chooseOptionLabel => _localizedValues[locale.languageCode]['choose_option'];
  String get enterValueLabel => _localizedValues[locale.languageCode]['enter_value'];

  String get notNotificationsLabel => _localizedValues[locale.languageCode]['no_notifications'];

  String get listingPublishedLabel => _localizedValues[locale.languageCode]['listing_published'];
  String get listingUpdatedLabel => _localizedValues[locale.languageCode]['listing_updated'];

  String get notificationsSettingsLabel => _localizedValues[locale.languageCode]['notifications_settings'];
  String get notificationsAboutLabel => _localizedValues[locale.languageCode]['notifications_about'];
  String get generalInformationsHintsLabel => _localizedValues[locale.languageCode]['general_informations_hints'];
  String get otherNotificationsLabel => _localizedValues[locale.languageCode]['other_notifications'];
  String get generalInformationsProductLabel => _localizedValues[locale.languageCode]['general_informations_products'];
  String get informationsAdsLabel => _localizedValues[locale.languageCode]['informations_ads'];
  String get promotionsAdsLabel => _localizedValues[locale.languageCode]['promotions_ads'];
  String get actionsFromLabel => _localizedValues[locale.languageCode]['actions_from'];

  String get noInternetLabel => _localizedValues[locale.languageCode]['no_internet'];
  String get noInternetMessageLabel => _localizedValues[locale.languageCode]['no_internet_message'];

  String get newMessageLabel => _localizedValues[locale.languageCode]['new_message'];
  String get checkInboxLabel => _localizedValues[locale.languageCode]['check_inbox'];
  String get missedYouLabel => _localizedValues[locale.languageCode]['missed_you'];
  String get continueBrowsingLabel => _localizedValues[locale.languageCode]['continue_browsing'];
  String get fiveSecondsLabel => _localizedValues[locale.languageCode]['5_seconds'];
  String get biggestArabLabel => _localizedValues[locale.languageCode]['biggest_arab'];
  String get continueBrowsingCategoryLabel => _localizedValues[locale.languageCode]['continue_browsing_category'];
  String get newThingsAddedLabel => _localizedValues[locale.languageCode]['new_things_added'];
  String get signUpSuccessfulLabel => _localizedValues[locale.languageCode]['sign_up_successful'];
  String get sellBuyTradeLabel => _localizedValues[locale.languageCode]['sell_buy_trade'];
  String get oldpazarTurkeyLabel => _localizedValues[locale.languageCode]['oldpazar_turkey'];
  String get sellerOnlineLabel => _localizedValues[locale.languageCode]['sellers_online'];
  String get sellingEasilyLabel => _localizedValues[locale.languageCode]['selling_easily'];

  String get theConversationLabel => _localizedValues[locale.languageCode]['the_converstation'];
  String get reallyDeleteLabel => _localizedValues[locale.languageCode]['really_delete'];
  String get deleteConversationLabel => _localizedValues[locale.languageCode]['delete_converstation'];
  String get reportedSuccessfullyLabel => _localizedValues[locale.languageCode]['reported_successfully'];
  String get reportLabel => _localizedValues[locale.languageCode]['report'];
  String get spamLabel => _localizedValues[locale.languageCode]['spam'];
  String get offensiveLabel => _localizedValues[locale.languageCode]['offensive'];
  String get expiredAdLabel => _localizedValues[locale.languageCode]['expired_ad'];
  String get expiringSoonLabel => _localizedValues[locale.languageCode]['expiring_soon'];
  String get rejectedAdLabel => _localizedValues[locale.languageCode]['rejected_ad'];
  String get duplicateAdLabel => _localizedValues[locale.languageCode]['duplicate_ad'];
  String get wrongCategoryLabel => _localizedValues[locale.languageCode]['wrong_category'];
  String get blockUserLabel => _localizedValues[locale.languageCode]['block_user'];
  String get errorLabel => _localizedValues[locale.languageCode]['error'];
  String get messageRequiredLabel => _localizedValues[locale.languageCode]['message_required'];
  String get selectReasonsLabel => _localizedValues[locale.languageCode]['select_reasons'];
  String get reportedLabel => _localizedValues[locale.languageCode]['reported'];
  String get reallyBlockLabel => _localizedValues[locale.languageCode]['really_block'];
  String get recentAdsLabel => _localizedValues[locale.languageCode]['recent_ads'];

  String get unblockUserLabel => _localizedValues[locale.languageCode]['unblock_user'];
  String get reallyUnblockLabel => _localizedValues[locale.languageCode]['really_unblock'];
  String get userBlockedLabel => _localizedValues[locale.languageCode]['user_blocked'];
  String get convoDeletedLabel => _localizedValues[locale.languageCode]['convo_deleted'];
  String get userUnblockedLabel => _localizedValues[locale.languageCode]['user_unblocked'];

  String get itemSoldLabel => _localizedValues[locale.languageCode]['item_sold'];
  String get viewSimilarAdsLabel => _localizedValues[locale.languageCode]['view_similar'];


/*    "user_blocked":"User is Blocked",
      "convo_deleted":"Conversation Deleted",
      "user_unblocked":"User unblocked",*/







}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
