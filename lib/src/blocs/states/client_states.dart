import 'package:client_list_with_bloc/src/models/client.dart';

abstract class ClientState {
  ClientState({required this.clients});

  final List<Client> clients;
}

class IdleClientState extends ClientState {
  IdleClientState() : super(clients: []);
}

class SuccesClientState extends ClientState {
  SuccesClientState({required List<Client> clients}) : super(clients: clients);
}
