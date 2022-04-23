import 'package:client_list_with_bloc/src/models/client.dart';

abstract class ClientEvent {}

class LoadClientEvent extends ClientEvent {}

class AddClientEvent extends ClientEvent {
  AddClientEvent(this.client);

  final Client client;
}

class RemoveClientEvent extends ClientEvent {
  RemoveClientEvent(this.client);

  final Client client;
}
