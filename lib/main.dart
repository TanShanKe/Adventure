import 'package:adventuregame/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    //'Story text will go here',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by user
                    setState(() {
                      storyBrain.nextStory(1);
                      storyBrain.getStory();
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.redAccent),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                            (states) => BeveledRectangleBorder()),
                  ),
                  child: Text(
                    storyBrain.getChoice1(),
                    //'Choice 1',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      // Choice 2 made by user
                      setState(() {
                        storyBrain.nextStory(2);
                        storyBrain.getStory();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blueAccent),
                      foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                              (states) => BeveledRectangleBorder()),
                    ),
                    child: Text(
                      storyBrain.getChoice2(),

                      //'Choice 2',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}