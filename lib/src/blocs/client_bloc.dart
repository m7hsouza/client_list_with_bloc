import 'dart:async';

import 'package:client_list_with_bloc/src/blocs/events/client_events.dart';
import 'package:client_list_with_bloc/src/blocs/states/client_states.dart';
import 'package:client_list_with_bloc/src/repositories/client_repository.dart';

import '../models/client.dart';

class ClientBloc {
  ClientBloc() {
    _inputClientController.stream.listen(_mapEventToState);
  }

  final _clientRepository = ClientRepository();

  final StreamController<ClientEvent> _inputClientController = StreamController<ClientEvent>();
  final StreamController<ClientState> _outputClientController = StreamController<ClientState>();

  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outputClientController.stream;

  void _mapEventToState(ClientEvent event) {
    var clients = <Client>[];

    if (event is LoadClientEvent) {
      clients = _clientRepository.loadClients();
    } else if (event is AddClientEvent) {
      clients = _clientRepository.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepository.removeClient(event.client);
    }

    _outputClientController.add(SuccesClientState(clients: clients));
  }
}
