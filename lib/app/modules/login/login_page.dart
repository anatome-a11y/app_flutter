import "package:flutter/material.dart";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = new GlobalKey<FormState>();

  bool logged = false;

  TextEditingController userController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void checkLogin () {
    if ( userController.text != 'anatome' || senhaController.text != 'anatome' ) {
      setState((){
        logged = true;
      });
    } else {
      setState((){
        logged = false;
      });
      // ***************************
      //     MUDAR DE ROTA AQUI
      // ***************************
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Anatome',
          style: TextStyle(
            color: Colors.grey[600]
          )
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Container (
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: logged ? 300 : 250,
            decoration: BoxDecoration (
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logged ? 
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    'Usuário ou senha errados',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
                :
                SizedBox.shrink(),

                logged ? 
                SizedBox (
                  height: 20,
                )
                :
                SizedBox.shrink(),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration (
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child:Icon (
                    Icons.lock,
                    color: Colors.white,
                  )
                ),
                TextField(
                  controller: userController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration (
                    labelText: 'Usuário'
                  ),
                ),
                TextField(
                  controller: senhaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration (
                    labelText: 'Senha'
                  ),
                ),
                SizedBox (
                  height: 15.0,
                ),
                ElevatedButton (
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Text ('Entrar')
                  ),
                  onPressed: checkLogin,
                )
              ],
            )
          )
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
            ),
            Text(
              'Versão 0.1.4',
              style: TextStyle (
                color: Colors.grey[600]
              )
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.white;
                  },
                ),
              ),
              onPressed: () {}, 
              child: Icon (
                Icons.info_outline,
                color: Colors.grey[600]
              )
            )
          ],
        ),
      ),
    );
  }
}
