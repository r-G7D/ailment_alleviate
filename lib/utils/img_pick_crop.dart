import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickCrop {
  static Future<CroppedFile?> process(
      {required ImageSource source,
      required List<CropAspectRatioPreset> ratio}) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        aspectRatioPresets: ratio,
        sourcePath: pickedFile.path,
        maxWidth: 500,
        maxHeight: 500,
      );

      return Future.delayed(const Duration(seconds: 2), () => croppedImage);
    }
    return null;
  }
}
