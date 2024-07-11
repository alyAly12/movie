import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable{
  final int movieID;
  final String posterUrl;
  final String title;

  const SearchEntity({required this.movieID, required this.posterUrl, required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [movieID,posterUrl,title];
}