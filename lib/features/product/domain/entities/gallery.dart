import 'package:equatable/equatable.dart';

class Gallery extends Equatable {
  final String id;
  final String url;

  const Gallery({required this.id, required this.url});

  @override
  List<Object> get props => [id, url];
}
