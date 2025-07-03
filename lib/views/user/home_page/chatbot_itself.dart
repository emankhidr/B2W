import 'package:b2w/core/extentions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../core/utils/colors.dart';


const String apiKey = 'AIzaSyD-GqAOJ0TuoaukqZ3frSvjUvdthm56tRs';
class ChatbotItself extends StatefulWidget {
  const ChatbotItself({super.key});

  @override
  State<ChatbotItself> createState() => _ChatbotItselfState(
  );
}

class _ChatbotItselfState extends State<ChatbotItself> {


 late final GenerativeModel model;
 late final ChatSession chat ;
 final ScrollController scrollController = ScrollController();
 final TextEditingController textController = TextEditingController();
 final List< ChatMessages > messages = [];
 @override
  void initState() {

    super.initState();
    model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    chat = model.startChat();
  }
  void scrollDown(){
   WidgetsBinding.instance.addPostFrameCallback((_)=> scrollController
       .animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 750), curve: Curves.easeInOutCirc));
}

   Future <void> sendChatMessage(String message) async{
   setState(() {
     messages.add(ChatMessages(text: message, isUser: true));

   });
   try{
     final response = await chat.sendMessage(Content.text(message));
     final text = response.text;
     setState(() {
       messages.add(ChatMessages(text: text!, isUser : false));
       scrollDown();
     });

   }catch(e){
     setState(() {
       messages.add(ChatMessages(text: 'Error occured ', isUser: false));
     });

   }finally {
     textController.clear();
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset('Mask group'.assetPNG),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset('robot'.assetPNG),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 4.w),
            Text(
              "Interview Chat",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato'),
            ),
          ],
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
        child: Column(

          children: [

            Expanded(child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context,index){
              return ChatBubble(messages: messages[index]);

            },)),
            Padding(padding: EdgeInsets.all(20),child:
              Row(
                children: [
                  Expanded(child: Container(
                    width: 313,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'type here...',

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),

                        )
                      ),
                    ),
                  )),
                  IconButton(onPressed: ()=> sendChatMessage(textController.text), icon: Icon(Icons.send
                  ,color: AppColors.primary,size: 25,))

                ],
              ),)
          ],
        ),
      ),
    );
  }

}
class ChatMessages {
  final String text;
  final bool isUser;
  ChatMessages({required this.text, required this.isUser});


}
class ChatBubble extends StatelessWidget {
  final ChatMessages messages;

  const ChatBubble({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        alignment: messages.isUser ? Alignment.centerRight:Alignment.centerLeft,
        child: Container(
          width: 284,

          decoration: BoxDecoration(
              color: messages.isUser ?AppColors.white: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight:messages.isUser? Radius.circular(0):Radius.circular(20),
                bottomLeft: messages.isUser? Radius.circular(20):Radius.circular(0),

              )
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width /1.5,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(messages.text,style: TextStyle(
              color: AppColors.inputText,fontSize: 14,
              fontWeight: FontWeight.w400
            ),),
          ),
        ),
    );
  }
}
