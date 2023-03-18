import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/img_pick_crop.dart';

part 'image_state.g.dart';

@riverpod
class InputImgRecipe extends _$InputImgRecipe {
  @override
  File? build() => null;

  void setImage(ImageSource source) async {
    CroppedFile? img = await ImagePickCrop.process(
        source: source, ratio: [CropAspectRatioPreset.square]);

    if (img != null) {
      state = File(img.path);
    }
  }
}

@riverpod
class InputImgCreateIng extends _$InputImgCreateIng {
  @override
  File? build() => null;

  void setImage(ImageSource source) async {
    CroppedFile? img = await ImagePickCrop.process(
        source: source, ratio: [CropAspectRatioPreset.square]);

    if (img != null) {
      state = File(img.path);
    }
  }
}
