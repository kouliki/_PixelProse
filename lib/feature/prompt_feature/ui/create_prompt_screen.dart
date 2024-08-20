import 'package:flutter/foundation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_generator/feature/prompt_feature/Theme/theme_provider.dart';
import 'package:image_generator/feature/prompt_feature/ui/NavBar.dart';
import 'package:provider/provider.dart';
import 'package:stability_image_generation/stability_image_generation.dart';
import 'package:http/http.dart' as http;


class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({Key? key}) : super(key: key);

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {

  // var apiKey="sk-proj-OBVelm98SIU52nWFSypmT3BlbkFJLN5b6Z2TcTugfBNkXRuv";
  var stability_apiKey = 'sk-4Cpm1amlYUNbF3z40BQwHa84zlhlZmi6zi4dLRN9XSwpYsOb';
  var imageUrl='';
  // var prompt='';
  // TextEditingController

  final StabilityAI _ai = StabilityAI();

  /// This is the api key from stability.ai or https://dreamstudio.ai/, Create yours and replace it here.
  // final String apiKey = 'sk-xxxxxx';

  /// This is the style [ImageAIStyle]
  final ImageAIStyle imageAIStyle = ImageAIStyle.christmas;

  /// The boolean value to run the function.
  bool run = false;

  /// The [_generate] function to generate image data.
  Future<Uint8List> _generate(String query) async {
    /// Call the generateImage method with the required parameters.
    Uint8List image = await _ai.generateImage(
      apiKey: stability_apiKey,
      imageAIStyle: imageAIStyle,
      prompt: query,
    );
    return image;
  }

  @override
  void dispose() {
    /// Dispose the [_queryController].
    controller.dispose();
    super.dispose();
  }

  // bool isLoading = false;


  // void generateImage(prompt) async {
  //   setState(() {
  //     isLoading = true; // Start loading
  //   });
  //   print('image is generating');
  //   final uri=Uri.parse("https://api.openai.com/v1/images/generations");
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $apiKey'
  //   };
  //   final body = jsonEncode({
  //     'model': 'dall-e-3',
  //     'prompt': '$prompt',
  //     'size': '1024x1024',
  //     'quality': 'standard',
  //     'n': 1,
  //   }
  //   );
  //
  //   try {
  //     final response = await http.post(uri, headers: headers, body: body);
  //
  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);
  //       final image_url = responseData['data'][0]['url'];
  //       print('Image URL: $image_url');
  //
  //       setState(() {
  //         imageUrl = image_url;
  //         isLoading = false;
  //       });
  //     } else {
  //       print('Failed to generate image: ${response.body}');
  //       setState(() {
  //         isLoading = false; // Stop loading even if there's an error
  //       });
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     setState(() {
  //       isLoading = false; // Stop loading on exception
  //     });
  //   }
  // }
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        toolbarHeight: 80,
          backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
              ? Colors.grey.shade800
              : Colors.indigo,
        title: Center(
          child: Text('Pixel-Prose 📌',style: GoogleFonts.arima(fontSize: 28,fontWeight: FontWeight.bold,
            color: Provider.of<ThemeProvider>(context).isDarkMode
                ? Colors.yellowAccent
                : Colors.yellow
          ),),
        ),
        actions: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dark Mode Text
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            // child: Text('Dark Mode'),
          ),
          // Switch Toggle
          CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          ),
        ],
      ),

      ]),
      body: Container(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Expanded(
                child: run
                    ? FutureBuilder<Uint8List>(
                  /// Call the [_generate] function to get the image data.
                  future: _generate(controller.text),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      /// While waiting for the image data, display a loading indicator.
                      return Center(
                        child: const CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      /// If an error occurred while getting the image data, display an error message.
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      /// If the image data is available, display the image using Image.memory().
                      run = false;
                      return ClipRRect(

                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(snapshot.data!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      /// If no data is available, display a placeholder or an empty container.
                      return Container(
                        color: Provider.of<ThemeProvider>(context).isDarkMode
                            ? Colors.grey[400]
                            : Colors.deepPurple[100],
                      );
                    }
                  },
                ):Container(
                  color: Provider.of<ThemeProvider>(context).isDarkMode
                                ? Colors.grey[400]
                                : Colors.deepPurple[100],
                )
            ),

            Container(
              height: 240,
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" Enter your prompt ",
                    style: TextStyle(
                      fontSize:24,
                      fontWeight: FontWeight.bold


                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: controller,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 48,
                    width: double.maxFinite,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode
                              ? Colors.blueAccent
                              : Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), // Curves the button edges
                          ),),
                        onPressed: (){
                          // if (!run) { // Prevent multiple presses
                          //   // generateImage(controller.text);
                          // }

                          String query = controller.text;
                          if (query.isNotEmpty) {
                            /// If the user input is not empty, set [run] to true to generate the image.
                            setState(() {
                              run = true;
                            });
                          } else {
                            /// If the user input is empty, print an error message.
                            if (kDebugMode) {
                              print('Query is empty !!');
                            }
                          }
                        }, child: Text(run ? "Generating..." : "Generate Image", style: TextStyle(
                        fontSize: 19,color: Provider.of<ThemeProvider>(context).isDarkMode
                        ? Colors.white
                        : Colors.white
                    ),)),
                  ),
                    // child: ElevatedButton.icon(
                    //   style: ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    //   ),
                    //
                    //     onPressed: (){
                    //       generateImage(controller.text);
                    //     },
                    //     icon: Icon(Icons.generating_tokens_outlined),
                    //     label: Text('Generator')),
                    // imageUrl!=''?
                  // ),

                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
