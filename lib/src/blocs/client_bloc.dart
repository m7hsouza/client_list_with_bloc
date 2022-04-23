import 'package:client_list_with_bloc/src/blocs/events/client_events.dart';
import 'package:client_list_with_bloc/src/blocs/states/client_states.dart';
import 'package:client_list_with_bloc/src/repositories/client_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(IdleClientState()) {
    on<LoadClientEvent>(
      (event, emit) => emit(
        SuccesClientState(clients: _repository.loadClients()),
      ),
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(
        SuccesClientState(clients: _repository.removeClient(event.client)),
      ),
    );

    on<AddClientEvent>(
      (event, emit) => emit(
        SuccesClientState(clients: _repository.addClient(event.client)),
      ),
    );
  }

  final _repository = ClientRepository();
}
