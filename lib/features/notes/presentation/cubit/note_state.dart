part of 'note_cubit.dart';

class NoteState extends Equatable {
  final String title;
  final String content;
  final bool needExit;
  final int? id;
  final bool? isLoading;

  NoteState({
     this.id,
     this.isLoading,
    required this.title,
    required this.content,
    required this.needExit,
  });

  NoteState copyWith({String? title, String? content, bool? needExit, int? id, bool? isLoading}) {
    return NoteState(
      id: id ?? this.id,
      isLoading: isLoading ?? this.isLoading,
      title: title ?? this.title,
      content: content ?? this.content,
      needExit: needExit ?? this.needExit,
    );
  }

  @override
  List<Object?> get props => [
        title,
        content,
        needExit,
      ];
}
