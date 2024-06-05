part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.categories = const [],
    this.status = StatusPage.loading,
  });

  final List<CategoryEntityModel> categories;
  final StatusPage status;

  @override
  List<Object> get props => [
        categories,
        status,
      ];

  HomeState copyWith({
    List<CategoryEntityModel>? categories,
    StatusPage? status,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }
}
