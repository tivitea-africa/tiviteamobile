import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';
import 'package:tivi_tea/features/services/view_model/amenities_notifier.dart';

part 'workspace_room_notifier.g.dart';

@Riverpod(keepAlive: true)
class WorkspaceRoomNotifier extends _$WorkspaceRoomNotifier {
  @override
  Set<WorkspaceRoomModel> build() => {WorkspaceRoomModel()};

  void addRoom() => state = {...state, WorkspaceRoomModel()};

  void addRoomFromList(List<WorkspaceRoomModel> rooms) {
    for (var room in rooms) {
      final notifier = ref.read(amenitiesNotifierProvider.notifier);
      notifier.addNewAmenityFromList(room.features ?? []);
    }
    state = {...rooms, ...state};
  }

  void updateRoom(int index, WorkspaceRoomModel room) {
    final updatedRooms = state.toList();
    updatedRooms[index] = room;
    state = updatedRooms.toSet();
  }

  void removeRoom(int index) {
    final updatedRooms = state.toList();
    updatedRooms.removeAt(index);
    state = updatedRooms.toSet();
  }

  void clearRooms() => state = {};
}
