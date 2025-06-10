part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState extends Equatable {
  const DashboardState(this.visibleCount);
  final int visibleCount;
  DashboardState copyWith({int? visibleCount});
  @override
  List<Object?> get props => [visibleCount];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial(super.visibleCount);

  @override
  DashboardState copyWith({int? visibleCount}) {
    return DashboardInitial(visibleCount ?? this.visibleCount);
  }
}

final class DashboardLoading extends DashboardState {
  const DashboardLoading(super.visibleCount);
  @override
  DashboardState copyWith({int? visibleCount}) {
    return DashboardLoading(visibleCount ?? this.visibleCount);
  }
}

final class DashboardSuccess extends DashboardState {
  final DashboardModel dashboardModel;

  const DashboardSuccess(super.visibleCount, {required this.dashboardModel});
  @override
  DashboardState copyWith({int? visibleCount, DashboardModel? dashboardModel}) {
    return DashboardSuccess(visibleCount ?? this.visibleCount,
        dashboardModel: dashboardModel ?? this.dashboardModel);
  }
}

final class DashboardFailure extends DashboardState {
  final Failure failure;

  const DashboardFailure(super.visibleCount, this.failure);
  @override
  DashboardState copyWith({int? visibleCount, Failure? failure}) {
    return DashboardFailure(
        visibleCount ?? this.visibleCount, failure ?? this.failure);
  }
}
