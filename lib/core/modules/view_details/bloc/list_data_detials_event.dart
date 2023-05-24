part of 'list_data_details_bloc.dart';

abstract class ListDataDetailsEvent extends Equatable {
  const ListDataDetailsEvent();

  @override
  List<Object> get props => [];
}

class ListDataStarted extends ListDataDetailsEvent {
  const ListDataStarted();
}

class DeleteSubmited extends ListDataDetailsEvent{
  const DeleteSubmited();
}

class SubmitDrafted extends ListDataDetailsEvent{
  const SubmitDrafted();
}

class ProvincialHeadDepartmentApprove extends ListDataDetailsEvent{
  const ProvincialHeadDepartmentApprove();
}