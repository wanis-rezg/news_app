 import 'package:bloc/bloc.dart';
import 'package:news_app/features/onbording/controller/onbording_state.dart';
import 'package:news_app/features/onbording/models/onbording_model.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(OnbordingState(currentPage: 0));

  void nextPage() {
    emit(OnbordingState(currentPage: state.currentPage + 1));
  }

  void prevPage() {
    emit(OnbordingState(currentPage: state.currentPage - 1));
  }

  void skipPage() {
    emit(OnbordingState(currentPage: OnbordingModel.onbordingList.length - 1));
  }

  void onPageChanged(int index) {
    emit(OnbordingState(currentPage: index));
  }
}