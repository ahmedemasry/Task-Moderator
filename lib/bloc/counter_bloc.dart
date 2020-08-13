import 'package:bloc/bloc.dart';
import 'package:task_master/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch(event){
      case(CounterEvent.increment):
        yield state+1;
        break;
      case(CounterEvent.decrement):
        yield state-1;
        break;
    }
  }

  
}