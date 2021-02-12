import 'package:geolocator/geolocator.dart';

String locationLatitudeLongitude = '';
String locationName;

void _getCurrentLocation() async {
 
  try {
    final position =
        await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    // setState(() {
    //   _locationMessage = "${position.latitude}, ${position.longitude}";
    // });
    List<Placemark> placeName = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeName[0];
    var currentAddress = '${place.name}, ${place.locality}, ${place.country}, ${place.postalCode}';

  } catch (e) {
    print(e);
  }
}
