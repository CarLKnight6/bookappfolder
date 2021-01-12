
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:bookapp/SearchBarScreen.dart';

//ignore: must_be_immutable
class SearchResultScreen extends StatefulWidget {
  String searchedterm;
 
  SearchResultScreen({ Key key, this.searchedterm}) : super(key: key);
 
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState(searchedterm);
}

class _SearchResultScreenState extends State<SearchResultScreen> {
   Map data;
   String searchedterm;
   String bookurl;
   _SearchResultScreenState(this.searchedterm);
  List userData;
  //final SearchBarScreen searchedterm = ModalRoute.of(searchedterm).settings.arguments;
  final search = '';
  //Color _iconColor = Colors.pink;
 // Color _iconColor = Colors.black;
  var _isLoading = true;
    //int diffcallback = 0;
     bool isVisible = false;
     final String apiUrl = 'https://bookphilia-4a028-default-rtdb.firebaseio.com/books';

     var testvar = 'hello';
      var testvar2 = 'world';
  



 

   Future getData() async{
    
    var response = await http.get(
      Uri.encodeFull('https://www.googleapis.com/books/v1/volumes?q=\${$searchedterm}&maxResults=6&startIndex=0'),
      headers: {"Accept": "application/json"}
    );

    

    if(response.statusCode==200){
    setState(() {
      data = json.decode(response.body);
      userData = data["items"];
   
      this.getData();
    });
   
    }
     return "Success";
  }
  @override
  void initState() {
    super.initState();
    _isLoading = false;
    getData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
            title: Text(' '),
            backgroundColor: Color.fromRGBO(8,120,93,3),
            leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pushNamed(context, '/SearchBar');
            },
            ),
            // actions: [ IconButton(icon:  Icon(Icons.home),
            // onPressed: (){
            //   Navigator.pushNamed(context, '/');
              
            //   getData();
            // },)

            // ],
        ),
      body: 
          
          Center(
          child: _isLoading ? CircularProgressIndicator() :
           ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return 

                    
                    SizedBox(
                    height:200,
                    width:220,

                    child: Card(
                    
                    child: Row(
                      children: [
                    //CircularProgressIndicator(),
                          Flexible(
                          child: Container(
                            width: 120,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: NetworkImage(userData[index]["volumeInfo"]["imageLinks"]["thumbnail"]),
                                fit: BoxFit.cover
                              )
                            )
                          )
                          ),  
                                            //'\nAuthors:${userData[index]["volumeInfo"]["authors"]}'",
                              Flexible(


                               child: Container(
                                 width: double.infinity,
                                 height: double.infinity,

                                
                                child: Wrap(
                                      direction: Axis.horizontal,
                                      runSpacing: 15.0,
                                      alignment: WrapAlignment.start,
                               children: [

                                          FittedBox(
                                            fit: BoxFit.cover,
                                         child:AutoSizeText(
                                        "${userData[index]["volumeInfo"]["title"]}" , //+ "\n\n\nby: ${userData[index]["volumeInfo"]["authors"]}",
                                           
                                         style:GoogleFonts.droidSans(fontSize: 30.0,fontWeight: FontWeight.bold),
                                          )
                                        ),
                                           FittedBox(
                                            fit: BoxFit.cover,
                                         child:AutoSizeText(
                                         "by: ${userData[index]["volumeInfo"]["authors"]}",
                                           
                                         style:GoogleFonts.droidSans(fontSize: 20.0),
                                          )
                                        ),IconButton(icon: Icon(Icons.favorite),
                                                      color: Colors.pink,
                                                      iconSize: 35.0,
                                                      
                                                      onPressed: (){
                                                          

                                                          showModalBottomSheet(

                                                        context: context,
                                                        builder: (builder){
                                                          return Container(
                                                              width: 300,
                                                              height: 300,
                                                              color: Color.fromRGBO(119,136,153,1),
                                                              child: Wrap(
                                                                    direction: Axis.horizontal,
                                                                    alignment: WrapAlignment.start,
                                                                  children: [

                                                                      
                                                                       Text(
                                                                      "Added ${userData[index]["volumeInfo"]["title"]} to the favorites" , //+ "\n\n\nby: ${userData[index]["volumeInfo"]["authors"]}",
                                                                         
                                                                       style:GoogleFonts.droidSans(fontSize: 20,fontWeight: FontWeight.bold),
                                                                        )
                                                                      


                                                                        ]

                                                                      )


                                                                );
                                                                  },
                                                                );

                                                         Map <String,dynamic> bookurl = {"imgURL": userData[index]["volumeInfo"]["imageLinks"]["thumbnail"]};
                                                         FirebaseFirestore.instance.collection("books").add(bookurl);
                                                        //    http.post(apiUrl, body: json.encode({
                                                        //   "imgURL": userData[index]["volumeInfo"]["imageLinks"]["thumbnail"],
                                                              
                                                              //if not hings happens. use navigate method to save favorites :)

                                                        // }));
                                                        //   print(apiUrl);
                                                        //   print(userData[index]["volumeInfo"]["imageLinks"]["thumbnail"]);
                                                      },
                                                      ),
                                        MaterialButton(
                                                onPressed: () {
                                                    // setState(() {
                                                    //   isVisible = !isVisible;

                                                    // });

                                                    showModalBottomSheet(

                                                        context: context,
                                                        builder: (builder){
                                                          return Container(
                                                              width: 300,
                                                              height: 300,
                                                              color: Color.fromRGBO(119,136,153,1),
                                                              child: Wrap(
                                                                    direction: Axis.horizontal,
                                                                    alignment: WrapAlignment.start,
                                                                  children: [

                                                                      
                                                                       Text(
                                                                      "${userData[index]["searchInfo"]["textSnippet"]}" , //+ "\n\n\nby: ${userData[index]["volumeInfo"]["authors"]}",
                                                                         
                                                                       style:GoogleFonts.droidSans(fontSize: 20,fontWeight: FontWeight.bold),
                                                                        )
                                                                      


                                                                  ]

                                                                )


                                                      );
                                                        },
                                                      );

                                                     


                                                     
                                                },
                                                color: Color.fromRGBO(0,0,205,1),
                                                textColor: Colors.white,
                                                child:     Text("More info >>", style:GoogleFonts.droidSans(fontSize: 
                                                20.0),
                                                )
                                        ),
                                         

                                                   Visibility(
                                                        visible:isVisible,
                                                        maintainAnimation: true,
                                                        maintainSize: true,
                                                        maintainState: true,
                                                  
                                                        child: Container(
                                                              width: 300,
                                                              height: 300,
                                                              color: Color.fromRGBO(119,136,153,1),
                                                              child: Wrap(
                                                                    direction: Axis.horizontal,
                                                                    alignment: WrapAlignment.start,
                                                                  children: [

                                                                      
                                                                       Text(
                                                                      "${userData[index]["searchInfo"]["textSnippet"]}" , //+ "\n\n\nby: ${userData[index]["volumeInfo"]["authors"]}",
                                                                         
                                                                       style:GoogleFonts.droidSans(fontSize: 20,fontWeight: FontWeight.bold),
                                                                        )
                                                                      


                                                                  ]

                                                                )


                                                      )
                                                        

                                                  ),
                                                 
                                                  
                                           
                                ] )//wrap
              
                    ),



                    
                  )
                      ]
                ),//row
              )//card
            );//sizedbox
          },//itembuilder
            ),//listviewbuilder
          
            ),
          
          
    );//scaffold


  }
}

