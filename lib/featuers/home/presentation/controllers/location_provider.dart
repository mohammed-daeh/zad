// ignore_for_file: deprecated_member_use

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationState {
  final String location;
  final bool isLocationFetched;
  final String message;

  LocationState({
    required this.location,
    required this.isLocationFetched,
    required this.message,
  });
}

class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier()
      : super(LocationState(
            location: 'Fetching location...',
            isLocationFetched: false,
            message: ''));

  // لجلب الموقع عند أول مرة أو استرجاعه من SharedPreferences
  Future<void> fetchLocation() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedLocation = prefs.getString('location');
    bool? isLocationFetched = prefs.getBool('isLocationFetched');

    // إذا كانت البيانات موجودة في SharedPreferences
    if (savedLocation != null && isLocationFetched == true) {
      state = LocationState(
        location: savedLocation,
        isLocationFetched: true,
        message: 'Location fetched from cache.',
      );
      return;
    }

    bool serviceEnabled;
    LocationPermission permission;

    // تحقق من تفعيل خدمة الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = LocationState(
        location: 'Location services are disabled.',
        isLocationFetched: false,
        message: 'Please enable location services to get the location.',
      );
      return;
    }

    // تحقق من إذن الوصول إلى الموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // إذا كان الإذن مرفوضًا، نطلب الإذن من المستخدم
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        state = LocationState(
          location: 'Location permission denied.',
          isLocationFetched: false,
          message:
              'Please allow location permission to get the current location.',
        );
        return;
      }
    }

    // جلب الموقع الحالي
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // تحقق من وجود Geocoding
    try {
      List<Placemark> placemarks = await GeocodingPlatform.instance
              ?.placemarkFromCoordinates(
                  position.latitude, position.longitude) ??
          [];

      // إذا تم العثور على مكان، اعرض اسم المدينة
      String locationName = placemarks.isNotEmpty
          ? placemarks.first.locality ??
              placemarks.first.name ??
              'Unknown location'
          : 'Unknown location';

      // تحديث الحالة
      state = LocationState(
        location: locationName,
        isLocationFetched: true,
        message: 'Location fetched successfully.',
      );

      // حفظ الموقع في SharedPreferences
      await prefs.setString('location', locationName);
      await prefs.setBool('isLocationFetched', true);
      await prefs.setDouble('latitude', position.latitude);
      await prefs.setDouble('longitude', position.longitude);
    } catch (e) {
      state = LocationState(
        location: 'Error fetching location name.',
        isLocationFetched: false,
        message: 'Failed to fetch location name.',
      );
    }
  }

  // لتحديث الموقع عندما يضغط المستخدم على زر التحديث
  Future<void> updateLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // تحقق من تفعيل خدمة الموقع
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = LocationState(
        location: 'Location services are disabled.',
        isLocationFetched: false,
        message: 'Please enable location services to get the location.',
      );
      return;
    }

    // تحقق من إذن الوصول إلى الموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        state = LocationState(
          location: 'Location permission denied.',
          isLocationFetched: false,
          message:
              'Please allow location permission to get the current location.',
        );
        return;
      }
    }

    // جلب الموقع الحالي
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // تحقق من وجود Geocoding
    try {
      List<Placemark> placemarks = await GeocodingPlatform.instance
              ?.placemarkFromCoordinates(
                  position.latitude, position.longitude) ??
          [];

      // إذا تم العثور على مكان، اعرض اسم المدينة
      String locationName = placemarks.isNotEmpty
          ? placemarks.first.locality ??
              placemarks.first.name ??
              'Unknown location'
          : 'Unknown location';

      // تحديث الحالة
      state = LocationState(
        location: locationName,
        isLocationFetched: true,
        message: 'Location updated successfully.',
      );

      // حفظ الموقع في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('location', locationName);
      await prefs.setDouble('latitude', position.latitude);
      await prefs.setDouble('longitude', position.longitude);
    } catch (e) {
      state = LocationState(
        location: 'Error fetching location name.',
        isLocationFetched: false,
        message: 'Failed to fetch location name.',
      );
    }
  }
}

// Provider للإدارة
final locationProvider =
    StateNotifierProvider<LocationNotifier, LocationState>((ref) {
  return LocationNotifier();
});
