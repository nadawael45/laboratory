
abstract class ResultStates {}

class ResultInitial extends ResultStates {}
class ResultSuccess extends ResultStates {
  List images=[];

  ResultSuccess(this.images);
}
class ResultFailed extends ResultStates {}


