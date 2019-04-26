import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/folder_info.dart';

enum FolderEvent { getAllFolders, deleteFolder, addFolder }

class FolderAction {
  final FolderEvent event;
  final String folderTitle;
  final int folderId;

  FolderAction({
    this.event,
    this.folderId,
    this.folderTitle,
  });
  @override
  String toString() {
    return "Event: $event, title: $folderTitle";
  }
}

List<FolderInfo> _testList;
//[
//  FolderInfo(
//    title: "UX title",
//  ),
//  FolderInfo(
//    title: "Dev title",
//  ),
//  FolderInfo(
//    title: "Depromeet title",
//  ),
//  FolderInfo(
//    title: "test title",
//  ),
//];

enum FolderServiceState {
  isIdle,
  isLoading,
  isNotConnected,
  isLoaded,
  isDeleted,
  isAdding,
}

class FolderData {
  List<FolderInfo> data;
  FolderServiceState status;

  FolderData({
    this.data,
    this.status,
  });

  FolderData copyWith({
    FolderServiceState status,
  }) {
    return FolderData(
      status: status,
      data: this.data,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Status: $status, Data: ${data.toString()}";
  }
}

class FolderBloc extends Bloc<FolderAction, FolderData> {
  @override
  FolderData get initialState =>
      FolderData(status: FolderServiceState.isLoading);
  @override
  Stream<FolderData> mapEventToState(FolderAction action) async* {
    print("Action: $action");
    switch (action.event) {
      case FolderEvent.addFolder:
        if (action.folderTitle == null) {
          yield currentState;
        }
        FolderInfo newFolder = FolderInfo(title: action.folderTitle);
        // 서버 저장 완료 전에는 인디케이터 보여주기
        FolderData current = currentState.copyWith(
          status: FolderServiceState.isAdding,
        );
        yield current;

        // 서버 저장 기다리기
        current.status = FolderServiceState.isLoaded;
        if (current.data == null) {
          current.data = [newFolder];
        } else {
          current.data.add(newFolder);
        }
        yield current;

        break;
      case FolderEvent.deleteFolder:
        break;
      case FolderEvent.getAllFolders:
        yield FolderData(status: FolderServiceState.isLoading);
        yield FolderData(
          status: FolderServiceState.isLoaded,
          data: await _fetchAllFolders(),
        );
        break;
    }
  }

  Future<List<FolderInfo>> _fetchAllFolders() async {
    return _testList;
  }
}
