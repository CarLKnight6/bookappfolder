

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatelessWidget {
  
  // final _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
	          title: Text('Bookphilia'),
	          backgroundColor: Color.fromRGBO(8,120,93,3),
            automaticallyImplyLeading: false,
        ),
      body: 

      Stack( //stack for fitting the favorite caption and icon and also search button at the bottom while showing a streambuilder
        fit: StackFit.expand,
        children: [
       

      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('books').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData) return const  Text('Loading');
          return 
              Container(
               height: 200,
              child: ListView.builder(
             scrollDirection: Axis.horizontal,
             shrinkWrap: true,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
                DocumentSnapshot book = snapshot.data.documents[index];
                return  

                //     ListTile(
                //     leading: Image.network(book['imgURL'],
                // );

                Card(
                
                   child: InkWell(
                    onTap: () {
                      
                       FirebaseFirestore.instance.collection('books').document('0gqkE1UDdnpuciuhPCFy').delete();
                           // final collRef = FirebaseFirestore.instance.collection('books');
                           //        DocumentReferance docReference = collRef.document();

                           //        docReferance.setData(map).then((doc) {
                           //          print('hop ${docReferance.documentID}');
                           //        }).catchError((error) {
                           //          print(error);
                           //        });
                              
                        print("deleted");
                        },

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,

                        children: [

                             Flexible(
                          child: Container(
                            width: 120,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: NetworkImage(book['imgURL']),
                                fit: BoxFit.cover
                              )
                            )
                          )
                          ),

                        ]
                      )
                    )
                  );

            },


           ),
          );
        }

      ),//streambuilder

      Positioned(
          bottom:1,
          right:-354,
          child:Container (
            
            width: 692,
            height: 88,
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(229, 229, 229, 37),
            ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[  
            Text("Click search to find more", style:GoogleFonts.droidSans(fontSize: 
            20.0,fontWeight: FontWeight.bold),
            ),
                  MaterialButton(
            onPressed: () {

              Navigator.pushNamed(context, '/SearchBar');
            },
            color: Color.fromRGBO(8,120,93,3),
            textColor: Colors.white,
            child: Icon(
            Icons.search,
            size: 60.0,//searchsize
            ),
          padding: EdgeInsets.all(8),
          shape: CircleBorder(),
          
          )
          ],
          )
        ),
        ),
       Positioned(//position widget use to adjust children widgets in a stack
          top:100,
          right:40,
          child:Container (
            width: 88,
            height: 88,
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:Colors.pink,
            ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[  
                MaterialButton(
            onPressed: () {

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
                                "Created by: JESUS CARL SANCHEJA follow me @CarlKnightCOPH" , //+ "\n\n\nby: ${userData[index]["volumeInfo"]["authors"]}",
                                   
                                 style:GoogleFonts.droidSans(fontSize: 20,fontWeight: FontWeight.bold),
                                  )
                                


                            ]

                          )


                );
                  },
                );


              },
            color: Colors.white,
            textColor: Colors.pink,
            child: Icon(
            Icons.favorite,
            size: 60.0,//heartsize
            ),
          padding: EdgeInsets.all(8),
          shape: CircleBorder(),
          
          )
          ],
          )
        ),
        ),
        Positioned(
          top:100,
          right:-334,
          child:Container (
            
            width: 692,
            height: 88,
            
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[  
           
            Text("Favorites", style:GoogleFonts.droidSans(fontSize: 50.0,fontWeight: FontWeight.bold),
            
             ), 

          ],
            )
          ),
        ),


      ]
      ),//stack


    );
  }
}