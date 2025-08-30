import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ytmusiclogin extends StatefulWidget {
  const Ytmusiclogin({super.key});

  @override
  State<Ytmusiclogin> createState() => _YtmusicloginState();
}

class _YtmusicloginState extends State<Ytmusiclogin> {
  @override
  Widget build(BuildContext context) {
    InAppWebViewController? webViewController;
    CookieManager cookieManager = CookieManager.instance();
    Map<String, String> lastCapturedHeaders = {};

    String? globalVisitorId;
    String? globalAuthorization;
    String? globalCookie;

    return SafeArea(
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://music.youtube.com/"),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        shouldInterceptRequest: (controller, request) async {
          final headers = request.headers;

          if (headers != null && headers.isNotEmpty) {
            // Convert all keys to lowercase for case-insensitive lookup
            final lowerCaseHeaders = {
              for (var key in headers.keys) key.toLowerCase(): headers[key]!,
            };

            final visitorId = lowerCaseHeaders["x-goog-visitor-id"];
            final auth = lowerCaseHeaders["authorization"];
            final cookie = lowerCaseHeaders["Cookie"];

            final cookieManager = CookieManager.instance();
            final cookies = await cookieManager.getCookies(
              url: WebUri("https://music.youtube.com"),
            );

            String cookieHeader = cookies
                .map((cookie) => "${cookie.name}=${cookie.value}")
                .join("; ");
            globalCookie = cookieHeader;

            if (visitorId != null) {
              globalVisitorId = visitorId;
              print("✅ Visitor ID: $visitorId");
            }

            if (auth != null) {
              globalAuthorization = auth;
              print("✅ Authorization: $auth");
            }

            if (globalCookie != null) {
              print("✅ Cookie: $globalCookie");
            }
          }

          return null;
        },
        onLoadStop: (controller, url) async {
          Future.delayed(Duration(seconds: 3)).then((e) {
            final headers = {
              "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36",
                 // "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0",
              "Accept": "*/*",
              "Accept-Language": "en-US,en;q=0.5",
              "Content-Type": "application/json",
              "X-Goog-AuthUser": "0",
              "x-origin": "https://music.youtube.com",
              "Cookie": "YSC=ZLH7QlBLJIg; VISITOR_INFO1_LIVE=RAVkcLNJHjI; VISITOR_PRIVACY_METADATA=CgJJThIEGgAgSg%3D%3D; HSID=AIvX8QIrjzFnaGRBB; SSID=AYjaUydUTC8bjT3n0; APISID=HXE-0xUKoAA6LM1s/Akm9g-At3U_JCOTVj; SAPISID=cEkigVDciA-KxL1l/At2qhsOk_3E2712T9; __Secure-1PAPISID=cEkigVDciA-KxL1l/At2qhsOk_3E2712T9; __Secure-3PAPISID=cEkigVDciA-KxL1l/At2qhsOk_3E2712T9; SID=g.a000zAgJIujYKX95g53HBL421r6KxSDEszwN5rKG0zCSnFyFXAOE9Ph8qu_DqOT6K3sSNCglHgACgYKAdMSARcSFQHGX2Mih15J5g36ZIdDhz40o7GODhoVAUF8yKp3g4rra_IrjO9VOlAOW_Gh0076; __Secure-1PSID=g.a000zAgJIujYKX95g53HBL421r6KxSDEszwN5rKG0zCSnFyFXAOElZHbdHWEsRG-1HRFM_vtuwACgYKAQwSARcSFQHGX2MiFZ5z_M48IthOTVJDAwN8zxoVAUF8yKpe0NelL5TymzamvZ8Ha7OM0076; __Secure-3PSID=g.a000zAgJIujYKX95g53HBL421r6KxSDEszwN5rKG0zCSnFyFXAOEdydyBHVK7xIrpsLNEe7WNgACgYKATsSARcSFQHGX2Migrgg1mgSd8mn4alxB0SMjRoVAUF8yKp-dwRwZo7WWk8Qao-ZfjsD0076; LOGIN_INFO=AFmmF2swRAIgR0nRbIAhj9qFv_tVgTW4vsvjVUNoO86qEbjzhW0Y2jcCIBS0zxNIMySTeO__9W2MlQeUdyqkJ6N0tHt_T8Nl55kQ:QUQ3MjNmd0hVdzBfcEx1MWZXaEw0MThTM3ZDZXJpWXNEcUlxQUVhb0ZwSm1NYk1Zb2x0MkpCcGp0T2NMSkdNcXpzcENEemE5QW93QXNGZV92ZU9xSi0tMmJGWTFWZ2lLUXNncWM3LVBtVWxXenBfTFpLN29QdmVTTEZ5VXBWTWo0dW1IZTloa0dxbk1hVHFfT0NJTmdjMTB1ZjVkVFVBZVR3; wide=1; PREF=f4=4000000&f6=40000000&tz=Asia.Calcutta&f7=100&f5=30000; __Secure-1PSIDTS=sidts-CjIB5H03P8r6cOM3Xuw3VODTmJddyPaluX4FhLjTqrM4F-sPNyxo3hGaSpnhbYwejMvJnBAA; __Secure-3PSIDTS=sidts-CjIB5H03P8r6cOM3Xuw3VODTmJddyPaluX4FhLjTqrM4F-sPNyxo3hGaSpnhbYwejMvJnBAA; __Secure-ROLLOUT_TOKEN=CP3W9KyR2qmhxwEQ88jZhoq8jgMYtJreztDQjgM%3D; SIDCC=AKEyXzX5MWUKzVumg5Txyq5MeZm3mBjlPNBPvsOi2Q4gG2_SovffHO7reOnaCE6WzHsWhTW0DIs; __Secure-1PSIDCC=AKEyXzW93ldmWNeM7sFLb2U7XVdkDGbleIiEd8omyI2akSY65kZxtvB-RX_M9qDjWp7LW6HxGA; __Secure-3PSIDCC=AKEyXzWKppZrC7hWDFI7l0SbH2ygSv33thVTAykxf8D8G8R243sDHf0u_u5ngPO-e2r1L4mXmKQ",
              "x-goog-visitor-id": "CgtSQVZrY0xOSkhqSSj3uv7DBjIKCgJJThIEGgAgSg%3D%3D",  
              "authorization": "SAPISIDHASH 1753193850_4c0b0405b647defe315b8c4e483c716a5d75e43a_u SAPISID1PHASH 1753193850_4c0b0405b647defe315b8c4e483c716a5d75e43a_u SAPISID3PHASH 1753193850_4c0b0405b647defe315b8c4e483c716a5d75e43a_u",
              "referer": "https://music.youtube.com/",
              "origin": "https://music.youtube.com",
            };

            log("message✅ ✅ ✅ ✅ ✅ ✅ ✅ vv✅ vv $headers");

            //  log(headers.toString());
            sendHeadersToServer(headers);

            
          });

          // Get document.cookie via JS
        },
      ),
    );
  }
}

Future<void> saveYtMusicHeaders({
  required String cookie,
  required String authorization,
  required String visitorId,
}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('yt_cookie', cookie);
  await prefs.setString('yt_auth', authorization);
  await prefs.setString('yt_visitor_id', visitorId);
  print("✅ Headers saved to SharedPreferences");
}

Future<void> removeYtMusicHeaders() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('yt_cookie');
  await prefs.remove('yt_auth');
  await prefs.remove('yt_visitor_id');
  print("🗑️ Headers removed from SharedPreferences");
}

Future<Map<String, String>> getYtMusicHeaders() async {
  final prefs = await SharedPreferences.getInstance();
  String? cookie = prefs.getString('yt_cookie') ?? 'null';
  String? auth = prefs.getString('yt_auth') ?? 'null';
  String? visitorId = prefs.getString('yt_visitor_id') ?? 'null';

  return {
    'cookie': cookie,
    'authorization': auth,
    'x-goog-visitor-id': visitorId,
  };
}

Future<void> sendHeadersToServer(Map<String, String?> headers) async {
  final url = Uri.parse("http://192.168.18.253:8000/gather");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(headers),
  );

  log(headers.toString());

  if (response.statusCode == 200) {
    print("✅ Headers sent successfully");
    saveYtMusicHeaders(
              cookie: headers['Cookie'].toString(),
              authorization: headers['authorization'].toString(),
              visitorId: headers['x-goog-visitor-id'].toString(),
            );
    saveYtMusicHeaders(
      cookie: headers['Cookie'].toString(),
      authorization: headers['authorization'].toString(),
      visitorId: headers['x-goog-visitor-id'].toString(),
    );
    log(response.body);
  } else {
    print("❌ Failed to send headers: ${response.statusCode}");
  }
}
