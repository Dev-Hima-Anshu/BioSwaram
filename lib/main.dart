import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioSwaram',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
              child: Text('Continue as Demo User'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> mockCrops = [
    {
      'name': 'Tomato',
      'image': 'https://cdn-icons-png.flaticon.com/512/1998/1998610.png',
      'moisture': 35,
      'water_level': 60,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
    {
      'name': 'Chilli',
      'image': 'https://cdn-icons-png.flaticon.com/512/535/535183.png',
      'moisture': 45,
      'water_level': 70,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
    {
      'name': 'Cucumber',
      'image': 'https://cdn-icons-png.flaticon.com/512/2484/2484836.png',
      'moisture': 45,
      'water_level': 70,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
    {
      'name': 'Cabbage',
      'image': 'https://cdn-icons-png.flaticon.com/512/1147/1147806.png',
      'moisture': 45,
      'water_level': 70,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
    {
      'name': 'Eggplant',
      'image': 'https://cdn-icons-png.flaticon.com/512/1233/1233956.png',
      'moisture': 45,
      'water_level': 70,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
    {
      'name': 'Broccoli',
      'image': 'https://cdn-icons-png.flaticon.com/512/1239/1239717.png',
      'moisture': 45,
      'water_level': 70,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
    {
      'name': 'Corn',
      'image': 'https://cdn-icons-png.flaticon.com/512/135/135761.png',
      'moisture': 45,
      'water_level': 70,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
    {
      'name': 'Bean',
      'image': 'https://cdn-icons-png.flaticon.com/512/1233/1233965.png',
      'moisture': 45,
      'water_level': 70,
      'thresholds': {'min_moisture': 40, 'min_water': 50},
    },
  ];

  final Map<String, PlantFrequencyRanges> plantData = {
    'Tomato': PlantFrequencyRanges(
      normal: FrequencyRange(40, 80),
      stressed: FrequencyRange(80, 100),
    ),
    'Chilli': PlantFrequencyRanges(
      normal: FrequencyRange(40, 80),
      stressed: FrequencyRange(80, 100),
    ),
    'Cucumber': PlantFrequencyRanges(
      normal: FrequencyRange(50, 90),
      stressed: FrequencyRange(71, 100),
    ),
    'Cabbage': PlantFrequencyRanges(
      normal: FrequencyRange(40, 70),
      stressed: FrequencyRange(81, 100),
    ),
    'Eggplant': PlantFrequencyRanges(
      normal: FrequencyRange(50, 80),
      stressed: FrequencyRange(71, 100),
    ),
    'Broccoli': PlantFrequencyRanges(
      normal: FrequencyRange(60, 100),
      stressed: FrequencyRange(30, 50),
    ),
    'Corn': PlantFrequencyRanges(
      normal: FrequencyRange(30, 70),
      stressed: FrequencyRange(71, 100),
    ),
    'Bean': PlantFrequencyRanges(
      normal: FrequencyRange(40, 70),
      stressed: FrequencyRange(71, 100),
    ),
  };

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Crops'),
        actions: [
          IconButton(
            icon: Icon(Icons.analytics),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PlantAnalysisScreen(plantData: plantData),
                  ),
                ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Welcome, Demo User', style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: mockCrops.length,
              itemBuilder:
                  (context, index) => CropCard(
                    cropData: mockCrops[index],
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => CropDetailScreen(
                                  cropData: mockCrops[index],
                                ),
                          ),
                        ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  final Map<String, dynamic> cropData;
  final VoidCallback onTap;

  const CropCard({super.key, required this.cropData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(cropData['image'], height: 100),
            SizedBox(height: 10),
            Text(cropData['name'], style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class CropDetailScreen extends StatelessWidget {
  final Map<String, dynamic> cropData;

  const CropDetailScreen({super.key, required this.cropData});

  @override
  Widget build(BuildContext context) {
    final needsIrrigation =
        cropData['moisture'] < cropData['thresholds']['min_moisture'] ||
        cropData['water_level'] < cropData['thresholds']['min_water'];

    return Scaffold(
      appBar: AppBar(title: Text(cropData['name'])),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProgressIndicator(
              'Soil Moisture',
              cropData['moisture'].toDouble(),
              100,
            ),
            _buildProgressIndicator(
              'Water Level',
              cropData['water_level'].toDouble(),
              100,
            ),
            SizedBox(height: 30),
            Text(
              'Irrigation Suggestion:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              needsIrrigation ? 'Needs Irrigation!' : 'No Irrigation Needed',
              style: TextStyle(
                fontSize: 18,
                color: needsIrrigation ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(String label, double value, double max) {
    return Column(
      children: [
        Text('$label: ${value.toStringAsFixed(1)}%'),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: value / max,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class PlantAnalysisScreen extends StatefulWidget {
  final Map<String, PlantFrequencyRanges> plantData;

  const PlantAnalysisScreen({super.key, required this.plantData});

  @override
  _PlantAnalysisScreenState createState() => _PlantAnalysisScreenState();
}

class _PlantAnalysisScreenState extends State<PlantAnalysisScreen> {
  String? selectedPlant;
  double? inputFrequency;
  String analysisResult = '';

  void _analyzePlant() {
    if (selectedPlant == null || inputFrequency == null) return;

    final ranges = widget.plantData[selectedPlant]!;
    String result;

    if (inputFrequency! >= ranges.normal.min &&
        inputFrequency! <= ranges.normal.max) {
      result = 'Normal condition. No action needed.';
    } else if (inputFrequency! >= ranges.stressed.min &&
        inputFrequency! <= ranges.stressed.max) {
      result =
          'Plant is stressed! Recommended actions:\n'
          '- Check irrigation\n- Monitor soil health\n- Inspect for pests';
    } else {
      result = 'Abnormal reading! Verify sensors and environment.';
    }

    setState(() => analysisResult = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vibration Analysis')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedPlant,
              items:
                  widget.plantData.keys.map((plant) {
                    return DropdownMenuItem(value: plant, child: Text(plant));
                  }).toList(),
              onChanged: (value) => setState(() => selectedPlant = value),
              decoration: InputDecoration(labelText: 'Select Plant'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Vibration Frequency (kHz)',
                suffixText: 'kHz',
              ),
              onChanged:
                  (value) => setState(() {
                    inputFrequency = double.tryParse(value);
                  }),
            ),
            ElevatedButton(
              onPressed: _analyzePlant,
              child: Text('Analyze Plant Stress'),
            ),
            SizedBox(height: 20),
            Text(
              analysisResult,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFrequencyRanges {
  final FrequencyRange normal;
  final FrequencyRange stressed;

  PlantFrequencyRanges({required this.normal, required this.stressed});
}

class FrequencyRange {
  final double min;
  final double max;

  FrequencyRange(this.min, this.max);
}
