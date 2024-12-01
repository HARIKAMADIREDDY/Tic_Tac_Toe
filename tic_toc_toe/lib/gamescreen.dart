//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:tic_toc_toe/home_screen.dart';
class Gamescreen extends StatefulWidget {
 String player1;
  String player2;
  Gamescreen({required this.player1,required this.player2});
 

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  late List<List<String>>_board;
  late String _currentPlayer;
  late String _winner;
  late bool _gameOver;
 
  @override
  void initState() {
    super.initState();
     _board=List.generate(3, (_)=>List.generate(3, (_)=>""));
    _currentPlayer="X";
    _winner="";
    _gameOver= false;
    
  }
  

 void _resetGame(){
  setState(() {
     _board=List.generate(3, (_)=>List.generate(3, (_)=>""));
    _currentPlayer="X";
    _winner="";
    _gameOver= false;
  });
 }
 void _makeMove(int row,int Column){
  if(_board[row][Column]!=""||_gameOver){
    return ;
  }
  setState(() {
    _board[row][Column]=_currentPlayer;
    if(_board[row][0]==_currentPlayer&&
      _board[row][1]==_currentPlayer&&
      _board[row][2]==_currentPlayer ){
        _winner=_currentPlayer;
        _gameOver=true;
      }else if(
         _board[0][Column]==_currentPlayer&&
        _board[1][Column]==_currentPlayer&&
       _board[2][2]==_currentPlayer){
       
        _winner=_currentPlayer;
        _gameOver=true;
       }else if(
         _board[0][0]==_currentPlayer&&
        _board[1][1]==_currentPlayer&&
       _board[2][2]==_currentPlayer){
       
        _winner=_currentPlayer;
        _gameOver=true;
      }else if(
         _board[0][2]==_currentPlayer&&
        _board[1][1]==_currentPlayer&&
       _board[2][0]==_currentPlayer){
       
        _winner=_currentPlayer;
        _gameOver=true;
      }
     
      if(!_board.any((row)=>row.any((cell)=>cell==""))){
        _gameOver=true;
        _winner="It's a Tie";
      }
       _currentPlayer=_currentPlayer=="X"?"O":"X";
      if(_winner!=""){
        AwesomeDialog(
          context:context,
          dialogType:DialogType.success,
          animType: AnimType.rightSlide,
          btnOkText:"Play Again",
          title:_winner=="X"?
          widget.player1+"won!":
          _winner=="O"?
          widget.player2+"won!":
          "It's a Tie",
          btnOkOnPress:(){
            _resetGame();

          } )..show();
      }});
 }

@override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70,),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Turn:",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                  
                      ),
                       Text(
                        _currentPlayer=="X"?
                        widget.player1+"($_currentPlayer)":
                        widget.player2+"($_currentPlayer)",
                        
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: _currentPlayer=="X"?
                          Colors.red:Colors.green
                        ),
                       ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
),
              margin: EdgeInsets.all(5),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
               itemBuilder: (context, index) {
                 int row=index~/3;
                 int Column=index%3;
                 return GestureDetector(
                  onTap: () => _makeMove(row,Column),
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                     color: Colors.grey,
                     borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          _board[row][Column],
                          style: TextStyle(
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                            color: _board[row][Column]=="X"?Colors.red:Colors.green
                          ),),  )  ),

                 );
               }, 
                ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>HomeScreen()
                     
                      )
                    );

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),


                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Reset Game",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      
                      
                      
                      ),
                    )

                  ),
                )
              ],)
          ],
        ),
        ),
    );
    
 }
}

            
              
            

         
    
 



  
