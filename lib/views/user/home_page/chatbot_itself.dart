// chatbot_itself.dart
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chatbot_result.dart';

const String apiKey = 'AIzaSyD-GqAOJ0TuoaukqZ3frSvjUvdthm56tRs';

class ChatbotItself extends StatefulWidget {
  final String selectedField;
  final String selectedLevel;

  const ChatbotItself({
    super.key,
    required this.selectedField,
    required this.selectedLevel,
  });

  @override
  State<ChatbotItself> createState() => _ChatbotItselfState();
}

class _ChatbotItselfState extends State<ChatbotItself> {
  late final GenerativeModel model;
  late final ChatSession chat;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  final List<String> questions = [];
  final List<String> userAnswers = [];
  final List<ChatMessages> messages = [];

  int currentQuestionIndex = 0;
  bool showFeedbackButtons = false;

  @override
  void initState() {
    super.initState();
    model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    chat = model.startChat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      generateQuestions();
    });
  }

  Future<void> generateQuestions() async {
    final prompt = '''
Generate 10 interview questions for a ${widget.selectedField} role at ${widget.selectedLevel} level.
Include technical, problem-solving, and behavioral questions.
Only return the list of 10 questions, numbered from 1 to 10.
''';

    final response = await chat.sendMessage(Content.text(prompt));
    final text = response.text;

    if (text != null) {
      final lines = text.split('\n').where((line) => line.trim().isNotEmpty).toList();
      for (var line in lines) {
        final question = line.replaceFirst(RegExp(r'^\d+\.\s*'), '').trim();
        questions.add(question);
      }
      showNextQuestion();
    }
  }

  void showNextQuestion() {
    if (currentQuestionIndex < questions.length) {
      setState(() {
        messages.add(ChatMessages(text: questions[currentQuestionIndex], isUser: false));
      });
    } else {
      setState(() {
        showFeedbackButtons = true;
        messages.add(ChatMessages(
            text: "Thanks for sharing! Would you like feedback on any specific area?",
            isUser: false));
      });
    }
  }

  void handleUserMessage(String input) {
    if (input.trim().isEmpty) return;
    setState(() {
      messages.add(ChatMessages(text: input, isUser: true));
      userAnswers.add(input);
      textController.clear();
    });

    currentQuestionIndex++;
    Future.delayed(Duration(milliseconds: 500), () {
      showNextQuestion();
    });
  }

  Future<void> generateEvaluation() async {
    final prompt = '''
Evaluate the following answers for a ${widget.selectedField} interview at ${widget.selectedLevel} level.

${List.generate(userAnswers.length, (i) => "Q${i + 1}: ${questions[i]}\nA: ${userAnswers[i]}").join("\n\n")}

Give overall feedback and constructive suggestions.
''';

    final response = await chat.sendMessage(Content.text(prompt));
    final evaluation = response.text ?? "Could not generate evaluation.";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatbotResult(feedback: evaluation),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryLight,
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
                Image.asset('Mask group'.assetPNG, width: 60, height: 60),
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
                    child: ClipOval(child: Image.asset('robot'.assetPNG)),
                  ),
                ),
              ],
            ),
            SizedBox(width: 4.w),
            Text("Interview Chat",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato')),
          ],
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(messages: messages[index]);
                },
              ),
            ),
            showFeedbackButtons
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      messages.add(ChatMessages(text: "Yes, please!", isUser: true));
                      showFeedbackButtons = false;
                    });
                    generateEvaluation();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    fixedSize: Size(165, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text("Yes, please!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(165, 40),
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text("Ignore",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )
                : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: textController,
                        onSubmitted: handleUserMessage,
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => handleUserMessage(textController.text),
                    icon: Icon(Icons.send, color: AppColors.primary, size: 25),
                  )
                ],
              ),
            ),
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
      alignment: messages.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: messages.isUser ? AppColors.white : AppColors.lightGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: messages.isUser ? Radius.circular(0) : Radius.circular(20),
            bottomLeft: messages.isUser ? Radius.circular(20) : Radius.circular(0),
          ),
        ),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5),
        padding: const EdgeInsets.all(12),
        child: Text(
          messages.text,
          style: TextStyle(
            color: AppColors.inputText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
