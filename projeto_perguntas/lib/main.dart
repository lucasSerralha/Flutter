// 1° importando os arquivos necessários para o funcionamento do app
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

// função main, necessária para executar o aplicativo
// nesse caso o aplicativo é uma classe chamada PerguntaApp
main() => runApp(new PerguntaApp());

// classe principal, onde escreveremos nossas funções e componentes
class _PerguntaAppState extends State<PerguntaApp> {

// variável responsável pela seleção das perguntas que irão aparecer na tela
  var _perguntaSelecionada = 0;

/* função void que será responsável por alterar o número da pergunta
quando um usuário apertar um botão */
  void _responder() {
    var max = 2;
    if( _perguntaSelecionada < max) {  // utilizei-me do if para evitar que o número extrapole o número de perguntas e o app apresente erros.
      setState((){
        _perguntaSelecionada++;
      });
    }
  }

// @override deixa claro que o método escrito é herdeiro do método principal
  @override

// Árvore de componentes do flutter criadas dentro de um widget
  Widget build(BuildContext context){

    //variável final do tipo map que recebe as perguntas e respostas
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['preto', 'vermelho', 'verde', 'branco'],
      },
      {
        'texto:': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual a sua estação favorita?',
        'respostas': ['Verão', 'Outono', 'Inverno', 'Primavera'],
      },
    ];
    // cria-se uma lista transformando o map em String e lista
    List<String> respostas = perguntas [_perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();
  
  // return do widget com a interface gráfica
  return MaterialApp(
    /* permite montar a estrutura básica de uma tela,
    adicionando itens como AppBar, FloatingActionButton, BottomNavigationBar,
    Drawer, além do próprio conteúdo da tela. */
    home: Scaffold(
      appBar: AppBar( // o widget appBar só pode utilizar o comando AppBar
        title: Icon(Icons.home), 
        backgroundColor: Colors.orange,
      ),
      // body é aquilo que fica no corpo da tela, fora do título
      body: Column(
        children: <Widget>[  // aqui será feita a implementação da pergunta e dos botões
           Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
          ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ),
        // floatingActionButton cria um botão flutuante no
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo_rounded),
          onPressed: () {
            print("O botão foi pressionado");
          }
        ),
        // drawer é um widget que chama o widget Drawer. Criando uma interface lateral
        drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Home"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text("Privacy Policy"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
      )
    );
  }
}

/* aqui é onde fica a classe que é executada no main -> runApp */
class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}