import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

 var _imagemApp = AssetImage("images/padrao.png");
 var _mensagem = "Escolha uma opcao abaixo";

 void _opcaoSelecionada(String escolhaUsuario){

   var opcoes =  ["pedra", "papel", "tesoura"];
   var numero =  Random().nextInt(3);
   var escolhaApp =  opcoes[numero];

   print("Escolha do App: " + escolhaApp);
   print("Escolha do Usuário: " + escolhaUsuario);


   switch(escolhaApp){
     case "pedra":
       setState(() {
         this._imagemApp = AssetImage("images/pedra.png");
       });
       break;
     case "papel":
       setState(() {
         this._imagemApp = AssetImage("images/papel.png");
       });
       break;
     case "tesoura":
       setState(() {
         this._imagemApp = AssetImage("images/tesoura.png");
       });
       break;
   }

   if((escolhaUsuario == "pedra" && escolhaApp == "tesoura")|| (escolhaUsuario == "tesoura" && escolhaApp == "papel")|| (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabens vc venceu!";
      });
   }else if((escolhaApp == "pedra" && escolhaUsuario == "tesoura")|| (escolhaApp == "tesoura" && escolhaUsuario == "papel")|| (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
     setState(() {
       this._mensagem = "Infelizmente vc perdeu!";
     });
   }else {
     setState(() {
       this._mensagem = "Empatamos!";
     });
   }

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Padding(
             padding: EdgeInsets.all(10),
           child: Text(
             "Escolha do App: ",
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
               color: Colors.pink,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
         Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  _opcaoSelecionada("pedra");
                },
                child: Image.asset("images/pedra.png", height: 100),
              ),

              GestureDetector(
                onTap: (){
                  _opcaoSelecionada("papel");
                },
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: (){
                  _opcaoSelecionada("tesoura");
                },
                child: Image.asset("images/tesoura.png", height: 100,),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
