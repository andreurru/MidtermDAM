import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:midterm/models/pic.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_macos_webview/flutter_macos_webview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override 
  _MyAppState createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp>{
  int _paginaActual=0;

  List<Widget> _paginas = [
    PaginaNosotros(),
    PaginaContacto(),
    PaginaWeb(),
    PaginaMenu(),
  ];

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('EXAMEN MIDTERM DAM', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Hind'),
        ),),
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _paginaActual,
          onTap: (index){
            setState(() {
              _paginaActual = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Nosotros",backgroundColor: Colors.deepOrange),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: "Contacto",backgroundColor: Colors.deepOrange),
            BottomNavigationBarItem(icon: Icon(Icons.desktop_mac),label: 'Web',backgroundColor: Colors.deepOrange),
            BottomNavigationBarItem(icon: Icon(Icons.filter_sharp),label: 'Menu', backgroundColor: Colors.deepOrange)
          ],
          selectedItemColor: Colors.white,
          ),
    ),
    );
  }
} 

class PaginaNosotros extends StatelessWidget{
  const PaginaNosotros ({key}) : super (key:key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://pbs.twimg.com/media/FBdVBYkXoAELJYS?format=jpg&name=medium'),
            //image: NetworkImage('https://pbs.twimg.com/media/CkJvS4UWEAAzSlX?format=jpg&name=900x900'),
            fit: BoxFit.fill,
          ),
        ),
    ),);
  }
}


class PaginaContacto extends StatelessWidget{
  const PaginaContacto ({key}) : super (key:key);

  enviarsms(String msj, List<String> d) async{
    String r = await sendSMS(message: msj, recipients: d).catchError(
      (onError){
        print(onError);
      });
    print(r);
  }

  hacerllamada() async{
    const url = 'tel +525628465208';
    if(await canLaunch(url)){
      await launch(url);
      }else{
        throw 'error al llamar la $url ';
    }
  }

  @override 
  Widget build(BuildContext context){
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://pbs.twimg.com/media/CkJvS4UWEAAzSlX?format=jpg&name=900x900'),
            fit: BoxFit.cover,
            ),
            ),
          child: Column(

            children:
              <Widget>[
                Container(
                  child:TextButton(
                    child: Text('                                     📞  Llamar  📞                                          ',style:TextStyle(fontSize: 20.0)
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white
                    ),
                    onPressed: hacerllamada,
                    ),
                ),
                Container(
                  child: TextButton(
                    child: Text(
                      '                             ✉️  Mandar Mensaje  ✉️                                      ',
                      style:TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, onPrimary: Colors.white),
                    onPressed: (){
                      String msj = "demo";
                      List<String> d = ["2121212","+98989"];
                      enviarsms(msj,d);
                    })),
              ],
            ))
      );
  }
}



class PaginaWeb extends StatelessWidget{
  const PaginaWeb ({key}) : super (key:key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://pbs.twimg.com/media/CkJvS4UWEAAzSlX?format=jpg&name=900x900'),
            fit: BoxFit.fill,
          ),
        ),
        child: WebView(
          initialUrl: 'https://mexico.littlecaesars.com/es-mx/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
    ),
    );
  }
}



class PaginaMenu extends StatelessWidget{
  /*Future<List<Pic>>_listadoPic;

  Future>List<Gif>>_getPic(){
    Final response  = await http.get("https://foodish-api.herokuapp.com/");
    
    if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? FruitList(items: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },

  }*/

  const PaginaMenu ({key}) : super (key:key);
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://pbs.twimg.com/media/CkJvS4UWEAAzSlX?format=jpg&name=900x900'),
            fit: BoxFit.fill,
          ),
        ),
    ),);
  }
}
