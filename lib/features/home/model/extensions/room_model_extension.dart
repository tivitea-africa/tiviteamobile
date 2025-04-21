import 'package:tivi_tea/features/home/model/general/listing_response_model.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';

extension RoomExtension on Room {
  WorkspaceRoomModel toWorkspaceRoomModel() {
    return WorkspaceRoomModel(
      id: id,
      name: name,
      description: description,
      maxCapacity: maxCapacity,
      features: features,
      images: images,
      amount: amount,
    );
  }
}