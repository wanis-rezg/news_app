class OnbordingState {
  final int currentPage;

  OnbordingState({required this.currentPage});
}

class OnbordingInitial extends OnbordingState {
  OnbordingInitial() : super(currentPage: 0);
}