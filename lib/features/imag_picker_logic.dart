import 'package:image_picker/image_picker.dart';
final ImagePicker picker = ImagePicker();

Future<XFile?>pickImageFromGallery() async {
  final XFile? _image = await picker.pickImage(source: ImageSource.gallery);
  if (_image != null) {
    return  _image;
  }
  return null;
}

Future<XFile?> pickImageFromCamera() async {
// Pick an image.
  final XFile? _image = await picker.pickImage(source: ImageSource.camera);
  if (_image != null) {
    return  _image;
  }
  return null;
}
