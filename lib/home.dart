import 'package:app_cep/row.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController ctlcep = TextEditingController();
  String logradouro = "";
  String complemento = "";
  String bairro = "";
  String localidade = "";
  String ddd = "";
  String uf = "";
  String _res = "Res";
  getCep() async {
    String cep = ctlcep.text;
    String url = "https://viacep.com.br/ws/${cep}/json/";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> dados = json.decode(response.body);
    setState(() {
      logradouro = dados['logradouro'];
      if (logradouro.isEmpty) {
        logradouro = "------";
      }
      complemento = dados['complemento'];
      if (complemento.isEmpty) {
        complemento = "------";
      }
      bairro = dados['bairro'];
      if (bairro.isEmpty) {
        bairro = "------";
      }
      localidade = dados['localidade'];
      if (localidade.isEmpty) {
        localidade = "------";
      }
      ddd = dados['ddd'];
      if (ddd.isEmpty) {
        ddd = "------";
      }
      uf = dados['uf'];
      if (logradouro.isEmpty) {
        logradouro = "------";
      }
    });
  }

  Future<void> _showInfo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // sair se clicar fora
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              'Ajuda',
              style: TextStyle(
                fontFamily: "Baloo",
                fontSize: 20,
                color: Color(0xff141736),
              ),
            ),
            content: Container(
              height: 160,
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Color(0xffA9B6CA),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Ao pesquisar certifique-se de:',
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '*Digitar um CEP válido de 8 dígitos',
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '*Utilizar apenas números entre 0 e 9',
                    style: TextStyle(
                      fontFamily: "Baloo",
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F2FD),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "CEP BRASIL",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff141736),
                            fontFamily: "Baloo",
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 160, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              UniconsLine.info_circle,
                              color: Color(0xff141736),
                            ),
                            onPressed: _showInfo,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.all(0),
                          width: 311,
                          height: 62,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextFormField(
                            controller: ctlcep,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            style: TextStyle(
                                color: Color(0xff141736),
                                fontSize: 20,
                                fontFamily: "Baloo"),
                            decoration: InputDecoration(
                              labelText: 'CEP',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA9B6CA),
                                  fontFamily: "Baloo",
                                  fontSize: 15),
                              contentPadding: EdgeInsets.all(5),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Card(
                          elevation: 3.0,
                          child: Container(
                            width: 61,
                            height: 61,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: IconButton(
                              alignment: Alignment.center,
                              icon: Icon(
                                UniconsLine.search,
                                size: 26,
                                color: Color(0xff141736),
                              ),
                              onPressed: getCep,
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Card(
                    elevation: 2,
                    child: Container(
                        padding: EdgeInsets.all(12),
                        width: 380,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'CEP',
                                      style: TextStyle(
                                        fontFamily: "Baloo",
                                        fontSize: 17,
                                        color: Color(0xff141736),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${ctlcep.text}',
                                      style: TextStyle(
                                        fontFamily: "Baloo",
                                        fontSize: 17,
                                        color: Color(0xffA9B6CA),
                                      ),
                                    ),
                                  ],
                                )),
                            Divider(
                              color: Color(0xffA9B6CA),
                            ),
                            BuildRow('Logradouro', logradouro),
                            BuildRow('Complemento', complemento),
                            BuildRow('Localidade', localidade),
                            BuildRow('Estado', uf),
                            BuildRow('DDD', ddd)
                          ],
                        )),
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
