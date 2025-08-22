import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../controllers/settings_controller.dart';
import '../models/resume_model.dart';
import '../services/resume_servicer.dart' show ResumeService;
import '../widgets/color_picker_dialog.dart';

final resumeProvider = FutureProvider<ResumeModel>((ref) async {
  return ResumeService().fetchResume("Harsh");
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String location = "Fetching location...";

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => location = "Location services are disabled");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => location = "Location permissions are denied");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => location = "Permissions permanently denied");
      return;
    }

    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() => location = "Lat: ${pos.latitude}, Lng: ${pos.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = ref.watch(fontSizeProvider);
    final fontColor = ref.watch(fontColorProvider);
    final bgColor = ref.watch(bgColorProvider);
    final resumeAsync = ref.watch(resumeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customizable Resume"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(location, style: const TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
      body: Container(
        color: bgColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text("Font Size"),
                      Slider(
                        value: fontSize,
                        min: 10,
                        max: 30,
                        onChanged: (val) {
                          ref.read(fontSizeProvider.notifier).state = val;
                          saveSettings(val, fontColor, bgColor);
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Color? picked = await pickColor(context, fontColor);
                    if (picked != null) {
                      ref.read(fontColorProvider.notifier).state = picked;
                      saveSettings(fontSize, picked, bgColor);
                    }
                  },
                  child: const Text("Font Color"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Color? picked = await pickColor(context, bgColor);
                    if (picked != null) {
                      ref.read(bgColorProvider.notifier).state = picked;
                      saveSettings(fontSize, fontColor, picked);
                    }
                  },
                  child: const Text("Background Color"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: resumeAsync.when(
                data: (resume) {
                  return SingleChildScrollView(
                    child: Text(
                      "Name: ${resume.name}\n\nSkills: ${resume.skills}\n\nProjects: ${resume.projects}",
                      style: TextStyle(fontSize: fontSize, color: fontColor),
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text("Error: $e")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
