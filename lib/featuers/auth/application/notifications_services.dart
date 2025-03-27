// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'notifications_services.g.dart';

// @riverpod
// NotificationsServices notificationsService(Ref ref) => NotificationsServices();

// class NotificationsServices {
//   NotificationsServices();

//   /// creat instance of fbm ----------------------------------------------------
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   // ---------------------------------------------------------------------------

//   // initialize notifications for this app or device
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//   }
//   // ---------------------------------------------------------------------------

//   Future<String?> getAccessToken() async {
//     final serviceAccountJson = {
//       "type": "service_account",
//       "project_id": "midad-test1",
//       "private_key_id": "cb922c2b6fe76999c9bc13c3712da74bb258ae83",
//       "private_key":
//           "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxwkwgrP3G+xQL\n/YL8LqOz42LXz26oGipiowmS5gAUiJhSdlKyiwt0kuCTkcYeT/iwi7TViF0GElHq\nLvIzEdCjqoHBv+xGvuQtKEgPwgaJ3/jO3ThCU1P8RnW2XWNOvq+Yi/1CKN2sUyVp\nSHz46AyOhnFZM9m9g6izrP929yXmJ/ZB2VonyrV+peTY3ci4XfCqRM/VxWTge8Zf\nq/JYoJr6OTwxlYOQIchNaAXNhzeaFbw0FqusgMjOOmrf2HXtUHCeHTFduZkv1erQ\nzyy58rW/IvGHZoi6I6LmzpRcTc/ueIiEiq4T9BaFa2d3GFZl0m64Qpbp0VSQymXU\nqQ69MCHPAgMBAAECggEAR0v1GM4J47tk6QI/fUJ/qnEzfffXHFmSUomuF1tlANdg\nsQKAXNhkOdeHd+jqG9JbnwQJ/fN5zCug61r1DgLBOkPzU3DVJfL+thYIAToDQV2x\n/9a+7+tYLkFciU6fvD/DUl4jsFuPvcSDptzKM1NvZeMKp4qidN7P1XE37dFnRA5r\nWxpCHeTM7LmcWk1UpOeFyYFpH7jjIs0kH9Y29p5xwuMvT2O0t/YL4Mk2afRJoJd3\n8fYSUt4ptuQiIOqAno604GR0jI+qiRlvLiwG6+DF3iVocAE48q7skuyAExbVTGKK\ntUEHR8q5yacTZOcsffle88RA5UW8INOKvIkLvkHPUQKBgQDqKQHRQq0Ub8Y3hQOZ\nvJot++4XN5m5js7Maz0RKDHJwwwn5ycVROks7Fe+dVE/NlC+h1BRwuY0hBBGLYCZ\n+oDxxq3Be2J7k+E7F0G/x5D7B5VkPEhcD/I64Pl6PvxYaq5UlUY3R0AaicGFaxMw\neiXFvSSj6fPRs6cfiTo5BlDB+wKBgQDCVpxPQgldLoU145V5qPY9p8hPnsE7mJK2\nAX/lSnsVr/hAu+uJi/9mx8K+ju/zZRBYpJgHltE/m718H5blCM7Mvje9eYvZ/lH7\nylmpaFgDJZxoclmXvI/h0gyfy98lexqs7ywwb9nkhx43FpxSunlngQ5ITGhqPPQa\nXvO7GDprPQKBgQCZ03iTLPcg3tDbdjFIVIMAxGjDrc35/VvTJHvIgpw6jDy3Ff4x\n1cRMs7Jstws5uIfQsnnMTHoIc91xDMFX5h3BNyC8Yz7uKdajiAK0ZvjSQEgewg9T\nE1Kw5Uxex3Pk7ag6fpnTBKaTCH4uFIpVpVidD0U7vRxkXV3jtLWf8oso8wKBgF+d\n55hjgGH1gptKF4BdbpJVXAw4qxBceErOoBO7uqWoB/gpvbDWTdpPDPVfNJZHsmw6\nx4ZsYRXv1aIdlMupsr4wFRLHm9Ss+b9uBwGAElWyCqulH4m1wAE2rPlugKNbV3ug\nzdgjIEz9YhNur4lQsG0JpXJTDci/psbW0wrJ1+xtAoGAdbrThbM0M8bz+DUyIwR8\nDa6TGzloubDeMk9gMEKATZQvUhe6j6DXqHmgkuAlWUAUIxnGKx6lYQ3cK5YekzB3\nKEca3INOaZDUY3+jmjhng82OLusEMBUgR6VN1ypIyJFu0SVc8tnnCz2rswPTbgOr\nQeo6qoTs7i43dgW2qm4uzO4=\n-----END PRIVATE KEY-----\n",
//       "client_email":
//           "firebase-adminsdk-ns83z@midad-test1.iam.gserviceaccount.com",
//       "client_id": "100707589299639902242",
//       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//       "token_uri": "https://oauth2.googleapis.com/token",
//       "auth_provider_x509_cert_url":
//           "https://www.googleapis.com/oauth2/v1/certs",
//       "client_x509_cert_url":
//           "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ns83z%40midad-test1.iam.gserviceaccount.com",
//       "universe_domain": "googleapis.com"
//     };

//     List<String> scopes = [
//       "https://www.googleapis.com/auth/userinfo.email",
//       "https://www.googleapis.com/auth/firebase.database",
//       "https://www.googleapis.com/auth/firebase.messaging"
//     ];

//     try {
//       http.Client client = await auth.clientViaServiceAccount(
//           auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

//       auth.AccessCredentials credentials =
//           await auth.obtainAccessCredentialsViaServiceAccount(
//         auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//         scopes,
//         client,
//       );

//       client.close();
//       return credentials.accessToken.data;
//     } catch (e) {
//       return null;
//     }
//   }

//   Map<String, dynamic> getBody({
//     required String fcmToken,
//     required String title,
//     required String body,
//     required String userId,
//     String? type,
//   }) {
//     return {
//       "message": {
//         "token": fcmToken,
//         "notification": {"title": title, "body": body},
//         "android": {
//           "notification": {
//             "notification_priority": "PRIORITY_MAX",
//             "sound": "default",
//             "image":
//                 "https://img.freepik.com/free-vector/blue-notification-bell-with-one-notification_78370-6899.jpg",
//             "color": "#FF0000",
//           }
//         },
//         "apns": {
//           "payload": {
//             "aps": {"content_available": true}
//           }
//         },
//         "data": {
//           "type": type,
//           "id": userId,
//           "click_action": "FLUTTER_NOTIFICATION_CLICK"
//         }
//       }
//     };
//   }

//   // Send ----------------------------------------------------------------------
//   Future<void> sendNotifications({
//     required String fcmToken,
//     required String title,
//     required String body,
//     required String userId,
//     String? type,
//   }) async {
//     try {
//       var serverKeyAuthorization = await getAccessToken();

//       // change your project id
//       const String urlEndPoint =
//           "https://fcm.googleapis.com/v1/projects/midad-test1/messages:send";

//       Dio dio = Dio();
//       dio.options.headers['Content-Type'] = 'application/json';
//       dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

//       var response = await dio.post(
//         urlEndPoint,
//         data: getBody(
//           userId: userId,
//           fcmToken: fcmToken,
//           title: title,
//           body: body,
//           type: type ?? "message",
//         ),
//       );

//       // Print response status code and body for debugging
//       debugPrint('Response Status Code: ${response.statusCode}');
//       debugPrint('Response Data: ${response.data}');
//     } catch (e) {
//       debugPrint("Error sending notification: $e");
//     }
//   }
//   // ---------------------------------------------------------------------------
// }
