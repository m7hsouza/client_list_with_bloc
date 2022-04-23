import 'package:client_list_with_bloc/src/blocs/client_bloc.dart';
import 'package:client_list_with_bloc/src/blocs/events/client_events.dart';
import 'package:client_list_with_bloc/src/blocs/states/client_states.dart';
import 'package:client_list_with_bloc/src/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameEditingController = TextEditingController();

  late ClientBloc _bloc;

  @override
  void initState() {
    _bloc = ClientBloc();

    _bloc.add(LoadClientEvent());

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _showAddClientModal() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Adicionar cliente'),
            alignment: Alignment.center,
            elevation: 7,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _nameEditingController,
                    textCapitalization: TextCapitalization.words,
                    autofocus: true,
                    decoration: const InputDecoration(hintText: 'Nome'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              TextButton(
                  onPressed: () {
                    if (_nameEditingController.text.isEmpty) return;

                    var client = Client(name: _nameEditingController.text);

                    _bloc.add(AddClientEvent(client));

                    Navigator.pop(context);
                    _nameEditingController.clear();
                  },
                  child: const Text('Adicionar')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _showAddClientModal,
            icon: const Icon(Icons.person_add_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<ClientBloc, ClientState>(
          bloc: _bloc,
          builder: (_, state) {
            if (state is IdleClientState) {
              return Center(child: CircularProgressIndicator(color: Colors.amber.shade700));
            }

            if (state is SuccesClientState) {
              List<Client> clients = state.clients;

              return ListView.separated(
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber.shade700,
                    child: Text(
                      clients[i].name.substring(0, 1),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                  ),
                  title: Text(clients[i].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.person_off_rounded),
                    onPressed: () => _bloc.add(RemoveClientEvent(clients[i])),
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: clients.length,
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
