
import 'package:bookapp/SearchResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController acontroller = TextEditingController();
//TextEditingController searchController TextEditingController();

String searchedterm = '';
String st = '';
//ignore: must_be_immutable
class SearchBarScreen extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
            title: Text('Bookphilia'),
             leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
            ),

            //  actions: [ IconButton(icon:  Icon(Icons.home),
            // onPressed: (){
            //   Navigator.pushNamed(context, '/');
              
              
            // },)

            // ],
            backgroundColor: Color.fromRGBO(8, 120, 93, 3)),
            
        body: Container(
            color: Color.fromRGBO(229, 229, 229, 37),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              
              children: [
                TextField(
                    
                    style: GoogleFonts.droidSans(fontSize: 20, color: Color.fromRGBO(229, 229, 229, 37)
                    ,fontWeight: FontWeight.bold),
                  controller: acontroller,
                  decoration: InputDecoration(

     
                    icon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color.fromRGBO(8, 120, 93, 3),
                    labelText: '  ',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(229, 229, 229, 37),
                    ),
                    
                    helperText: '',
                    suffixIcon: IconButton(
                    onPressed: (){
                     acontroller.clear();
                     
                    
                    
                    } 
                    
                    ,
                    
                    icon: Icon(Icons.clear),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      
                    ),
                  ),
                ),
               MaterialButton(
            onPressed: () {

                if(acontroller.text == ''){
                  Navigator.pushNamed(context, '/SearchBar');
                  
              
              }else{
                  searchedterm = acontroller.text ;
                Navigator.pushNamed(context, '/SearchScreen');
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchResultScreen(searchedterm: searchedterm),
                  ));
                print("searched book: $searchedterm");
              }
            },
            color: Color.fromRGBO(59, 239, 109, 23),
            textColor: Colors.black,
            child:     Text("SEARCH", style:GoogleFonts.droidSans(fontSize: 
            20.0,fontWeight: FontWeight.bold),
            ),
          
          
          )
              ],
                )
              )
            
            );
  }
}
