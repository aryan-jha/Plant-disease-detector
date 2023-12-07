import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_flow/Screens/cure_screen.dart';
import 'package:sih_flow/sevices/services.dart';

class InterfaceScreen extends StatefulWidget {
  static const String id = 'interface_screen';
  const InterfaceScreen({super.key});

  @override
  State<InterfaceScreen> createState() => _InterfaceScreenState();
}

class _InterfaceScreenState extends State<InterfaceScreen> {
  var searchInput = TextEditingController();
  final OpenAIServices openAIServices = OpenAIServices();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text("Interface screen")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 65),
              child: Center(
                child: Text(
                  "Please Insert Your Query Related\n To Your Plant/Crops.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.concertOne(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 125, right: 15, bottom: 20),
              child: TextField(
                controller: searchInput,
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final result = await openAIServices
                        .solutionAPI(searchInput.text.toString());

                    setState(() {
                      _isLoading = false;
                    });

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CureScreen(
                          searchingInput: Future.value(result),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 2, 152, 79),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 50,
                    width: 125,
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const Center(
                            child: Text(
                              "FIND NORMAL SOLUTIONS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final result = await openAIServices
                        .organicsolutionAPI(searchInput.text.toString());

                    setState(() {
                      _isLoading = false;
                    });

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CureScreen(
                          searchingInput: Future.value(result),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 2, 152, 79),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 50,
                    width: 125,
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const Center(
                            child: Text(
                              "FIND ORGANIC SOLUTIONS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
