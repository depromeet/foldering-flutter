import 'package:meta/meta.dart';

class FolderInfo {
  final String title;
  final bool isShared;
  final bool isDetailView;
  final bool isOdd;
  final int folderIndex;

  FolderInfo({
    @required this.title,
    this.isOdd = false,
    this.folderIndex = 0,
    this.isShared = false,
    this.isDetailView = false,
  });

  FolderInfo copyWith({
    String title,
    bool isShared,
    bool isDetailView,
    bool isOdd,
    int folderIndex,
  }) {
    return FolderInfo(
      title: title ?? this.title,
      isDetailView: isDetailView ?? this.isDetailView,
      isShared: isShared ?? this.isShared,
      isOdd: isOdd ?? this.isOdd,
      folderIndex: folderIndex ?? this.folderIndex,
    );
  }
}
