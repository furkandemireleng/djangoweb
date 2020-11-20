# eduasistogrenci

Bu uygulama şuanda şafak okullarının temasına sahiptir.

## CLONE APP YAPMA
1. AndroidManifest.xml com.asistek.appname
2. app/build.grandle com.asistek.appname
3. contans.dart images folder
4. pubspec.yaml icon name - images folder
5. MainActivity.kt - Application.kt update package name
6. update app/src/main/kotlin/com/asistek/'packagename'
7. debug: update app/src/debug/AndroidManifest.xml com.asistek.appname
8. google-services.json add package name


## BİLGİ
GOOGLE PLAY STORE 
asistekyazilim@gmail.com
asistekyazilim2020

## SEND NOTIFICATION
https://fcm.googleapis.com/fcm/send
Header:
  Content-Type application/json
  Authorization key=AAAA3Ormh0c:APA91bGdgfgzhamfvj4FSRdL5wLHvNdkCJ0380YNCVbS-lxceGe5bC5G6w6i8nuq_b1oHl0rVnrHHrS2rT6h_ElFTMp-BDDRAhPXtIrf62dHcKbD9vBFJBl0qYbBCMwl5prpUO0aSr8D
Data:
  {
    "to": "cuouQYuWmNY:APA91bGUa_NFN-upiYE1jxGTWDCARg6jH9GOAXaaVVO-Wwi41vAZmYovh2JrrzywoY1S6evmQhI4f-rNmK35lWPqsxgPuKFPP8KTom2r5Gi7Y6KGj5-OHDF75tUpRXyrZoRZpL4GWXxz",
    "notification": {
      "sound": "default",
      "content_available": true,
      "title": "YENİ RAPORLAR Gör",
      "body": "hhgsun raporları"
    },
    "data": {
      "sound": "default",
      "content_available": true,
      "title": "Yeni Sezon Gelir Raporlar S",
      "endpoint": "Raporisletme/GorusmeSayisi",
      "body": "text içerik endpoint null olduğunda burası görüntülenir",
      "click_action" : "FLUTTER_NOTIFICATION_CLICK"
    }
  }