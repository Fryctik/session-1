part of 'onboard_cubit.dart';

class OnboardState {}

class OnboardInitial extends OnboardState {}

class TapNext extends OnboardState {}

class LoadOnboardList extends OnboardState {
  final OnboardList onboardList;

  LoadOnboardList({required this.onboardList});
}