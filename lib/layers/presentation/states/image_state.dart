import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/img_pick_crop.dart';

part 'image_state.g.dart';

@riverpod
class InputImgCreateRecipe extends _$InputImgCreateRecipe {
  @override
  XFile? build() => null;

  void setImage(ImageSource source) async {
    CroppedFile? img = await ImagePickCrop.process(
        source: source, ratio: [CropAspectRatioPreset.square]);

    if (img != null) {
      state = XFile(img.path);
    }
  }
}

@riverpod
class InputImgCreateIng extends _$InputImgCreateIng {
  @override
  XFile? build() => null;

  void setImage(ImageSource source) async {
    CroppedFile? img = await ImagePickCrop.process(
        source: source, ratio: [CropAspectRatioPreset.square]);

    if (img != null) {
      state = XFile(img.path);
    }
  }
}
