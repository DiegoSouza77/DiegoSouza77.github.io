import 'package:app_planetas/modelos/planeta.dart';
import 'package:flutter/material.dart';


class TelaPlanetas extends StatefulWidget {
  const TelaPlanetas({super.key});

  @override
  State<TelaPlanetas> createState() => _TelaPlanetasState();
}

class _TelaPlanetasState extends State<TelaPlanetas> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tamanhoController = TextEditingController();
  final TextEditingController _distanciaController = TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();

  final Planeta _planeta = Planeta.vazio();

  @override
  void initState() {
    //_nameController.text = 'Terra nova';
    //_tamanhoController.text = '100';
    //_distanciaController.text = '1000';
    //_apelidoController.text = 'Nova Terra';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tamanhoController.dispose();
    _distanciaController.dispose();
    _apelidoController.dispose();
    super.dispose();
  }

  void _submitForm () {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dados do planeta salvos com sucesso!\n'
            '${_planeta.nome}\n'
            '${_planeta.tamanho}\n'
            '${_planeta.distancia}\n'
            '${_planeta.apelido}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastrar Planeta'),
        elevation: 7,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.purpleAccent,
                        width: 10.0,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty || valor.length < 2) {
                      return 'Por favor, insira o nome do planeta (2 ou mais caracteres)';
                    }
                    return null;
                  },
                  onSaved: (valor) {
                    _planeta.nome = valor!;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _tamanhoController,
                  decoration: InputDecoration(
                    labelText: 'Tamanho (em KM)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.purpleAccent,
                        width: 10.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor, insira o tamanho do planeta';
                    }
                    if (double.tryParse(valor) == null) {
                      return 'Insira um valor numérico válido';
                    }
                    return null;
                  },
                  onSaved: (valor) {
                    _planeta.tamanho = double.parse(valor!);
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _distanciaController,
                  decoration: InputDecoration(
                    labelText: 'Distância (em KM)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.purpleAccent,
                        width: 10.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor, insira a distância do planeta';
                    }
                    if (double.tryParse(valor) == null) {
                      return 'Insira um valor numérico válido';
                    }
                    return null;
                  },
                  onSaved: (valor) {
                    _planeta.distancia = double.parse(valor!);
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _apelidoController,
                  decoration: InputDecoration(
                    labelText: 'Apelido',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.purpleAccent,
                        width: 10.0,
                      ),
                    ),
                  ),
                  onSaved: (valor) {
                    _planeta.apelido = valor;
                  },
                ),
                SizedBox(height: 25.0),
                ElevatedButton(
                  onPressed: _submitForm, //_submitForm,
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



