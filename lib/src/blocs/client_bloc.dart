import 'package:client_list_with_bloc/src/blocs/events/client_events.dart';
import 'package:client_list_with_bloc/src/blocs/states/client_states.dart';
import 'package:client_list_with_bloc/src/repositories/client_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(const ClientIdleState()) {
    on<ClientEvent>(
      (event, emit) async {
        emit(const ClientLoadState());

        if (event is ClientLoadEvent) {
          await Future.delayed(const Duration(seconds: 2));

          emit(ClientSuccessState(clients: _repository.loadClients()));
        } else if (event is ClientDeleteEvent) {
          emit(ClientSuccessState(clients: _repository.removeClient(event.client)));
        } else if (event is ClientAddEvent) {
          emit(ClientSuccessState(clients: _repository.addClient(event.client)));
        }
      },
    );
  }

  final _repository = ClientRepository();
}
