import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tivi_tea/features/services/model/workspace_room_model.dart';

part 'workspace_room_notifier.g.dart';

@Riverpod(keepAlive: true)
class WorkspaceRoomNotifier extends _$WorkspaceRoomNotifier {
  @override
  List<WorkspaceRoomModel> build() => [WorkspaceRoomModel()];

  void addRoom() => state = [...state, WorkspaceRoomModel()];

  void updateRoom(int index, WorkspaceRoomModel room) {
    List<WorkspaceRoomModel> updatedRooms = [...state];
    updatedRooms[index] = room;
    state = updatedRooms;
  }

  void removeRoom(int index) {
    List<WorkspaceRoomModel> updatedRooms = [...state];
    updatedRooms.removeAt(index);
    state = updatedRooms;
  }

  void clearRooms() => state = [];
}
