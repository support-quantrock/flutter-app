import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class NanoBananaService {
  final String apiKey;
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';
  static const String _model = 'gemini-2.0-flash-exp-image-generation';
  static const String defaultApiKey = ''; // Add your Gemini API key here

  NanoBananaService({String? apiKey}) : apiKey = apiKey ?? defaultApiKey;

  Future<NanoBananaResult> generateImage(String prompt) async {
    try {
      final url = Uri.parse('$_baseUrl/$_model:generateContent?key=$apiKey');

      final requestBody = {
        'contents': [
          {
            'parts': [
              {'text': prompt}
            ]
          }
        ],
        'generationConfig': {
          'responseModalities': ['TEXT', 'IMAGE'],
        }
      };

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode != 200) {
        return NanoBananaResult(
          success: false,
          error: 'API Error: ${response.statusCode} - ${response.body}',
        );
      }

      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      String? textResponse;
      Uint8List? imageData;
      String? mimeType;

      final candidates = jsonResponse['candidates'] as List?;
      if (candidates != null && candidates.isNotEmpty) {
        final content = candidates[0]['content'] as Map<String, dynamic>?;
        final parts = content?['parts'] as List?;

        if (parts != null) {
          for (final part in parts) {
            if (part['text'] != null) {
              textResponse = part['text'] as String;
            } else if (part['inlineData'] != null) {
              final inlineData = part['inlineData'] as Map<String, dynamic>;
              mimeType = inlineData['mimeType'] as String?;
              final base64Data = inlineData['data'] as String?;
              if (base64Data != null) {
                imageData = base64Decode(base64Data);
              }
            }
          }
        }
      }

      if (imageData != null) {
        return NanoBananaResult(
          success: true,
          imageData: imageData,
          mimeType: mimeType ?? 'image/png',
          textResponse: textResponse,
        );
      } else {
        return NanoBananaResult(
          success: false,
          error: textResponse ?? 'No image generated',
        );
      }
    } catch (e) {
      return NanoBananaResult(
        success: false,
        error: e.toString(),
      );
    }
  }
}

class NanoBananaResult {
  final bool success;
  final Uint8List? imageData;
  final String? mimeType;
  final String? textResponse;
  final String? error;

  NanoBananaResult({
    required this.success,
    this.imageData,
    this.mimeType,
    this.textResponse,
    this.error,
  });

  String? get base64Image {
    if (imageData == null) return null;
    return base64Encode(imageData!);
  }
}
