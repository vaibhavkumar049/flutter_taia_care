import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:flutter_taia_care/src/resources/styles.dart';
import 'package:flutter_taia_care/src/ui/chat_message.dart';
import 'package:flutter_taia_care/src/ui/widgets/custom_appBar.dart';

class TaiaChat extends StatefulWidget {
  @override
  _TaiaChatState createState() => _TaiaChatState();
}

class _TaiaChatState extends State<TaiaChat> {
  final List<ChatMessage> messageList = <ChatMessage>[];
  List<String> quickreplies=[];
  final TextEditingController _textController = new TextEditingController();
  bool isQuickReplies=false;

  Widget _queryInputWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Styles.chatBubbleGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration: InputDecoration.collapsed(hintText: "Write here..."),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send, color: Colors.grey,),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void agentResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/json/credentials.json").build();
    Dialogflow dialogFlow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    int length = response.getListMessage().length;
    List<String> replies=[];
    response.getListMessage().forEach((k){
      print(k);
      if(k["text"]!=null){
        replies.add(k["text"]["text"][0].toString());
      }
      if(k["quickReplies"]!=null){
        k["quickReplies"]["quickReplies"].forEach((l){
          quickreplies.add(l);
        });
      }

    });
    int repliesLength = replies.length;
    for(int i=0;i<repliesLength;i++){
      ChatMessage message = new ChatMessage(
        text:  replies[i]??
            new CardDialogflow(response.getListMessage()[0]).title,
        name: "Bot",
        type: false,
      );
      setState(() {
        messageList.insert(0, message);
      });
    }
    /*for(int i=0;i<length;i++){
      print("Agent reponse: ${response.getListMessage()[i]}");
      ChatMessage message = new ChatMessage(
        text: response.getListMessage()[i]["text"]["text"][0] ??
            new CardDialogflow(response.getListMessage()[0]).title,
        name: "Taia",
        type: false,
      );
      setState(() {
        messageList.insert(0, message);
      });

      if(response.getListMessage()[i]=='quickReplies'){
        print("Quick replies");
      }


    }*/
   /* ChatMessage message = ChatMessage(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      name: "Taia",
      type: false,
    );
    setState(() {
      messageList.insert(0, message);
    });*/

   // print("Agent reponse: ${response.getMessage()}");

  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Promise",
      type: true,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  Widget suggestionChips(String text){
    return  Padding(
      padding: const EdgeInsets.only(left:8.0, right: 8, bottom: 8),
      child: InputChip(
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(color: Styles.taiaGreen)
        ),
        backgroundColor: Styles.whiteColor,
        labelStyle: TextStyle(color: Styles.taiaGreen),
        label: Text(text),
        onPressed:(){
          quickreplies.clear();
          return _handleSubmitted(text);} ,
      ),
    );
  }

  void _submitQuery(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.buildAppBar(context: context,title: "Taia"),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => messageList[index],
              itemCount: messageList.length,
            )),
         Divider(height: 1.0),
        for (String text in  quickreplies)
          suggestionChips(text),
         Divider(height: 1.0),
        quickreplies!=null && quickreplies.length>0?SizedBox():_queryInputWidget(context),
      ]),
    );
  }
}
