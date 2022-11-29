import 'package:flutter/material.dart';
import 'package:googlemapsapp/models/auto_complete_result.dart';
import 'package:googlemapsapp/services/map_services.dart';

class BuildListItemWidget extends StatelessWidget {
  AutoCompleteResult placeItem;
  dynamic searchFlag;

  BuildListItemWidget({
  required this.placeItem,
  required this.searchFlag
     ,Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTapDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          var place = await MapServices().getPlace(placeItem.placeId);
          gotoSearchedPlace(place['geometry']['location']['lat'],
              place['geometry']['location']['lng']);
          searchFlag.toggleSearch();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.green, size: 25.0),
            const SizedBox(width: 4.0),
            SizedBox(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 75.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(placeItem.description ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }

    Future<void> gotoSearchedPlace(double lat, double lng) async {
    // final GoogleMapController controller = await _controller.future;

    // controller.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    // _setMarker(LatLng(lat, lng));
  }
}
