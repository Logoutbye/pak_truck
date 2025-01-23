import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/view/full_screen_view_player.dart';
import 'package:testt/src/features/sell/view_model/sell_spare_parts_view_model.dart';

import 'package:video_player/video_player.dart';

Widget buildSparePartsMediaPicker(
    BuildContext context, String label, SellSparePartsViewModel viewModel) {
  Future<void> showMediaSourceActionSheet() async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context);
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    viewModel.addMedia(File(pickedFile.path), 'image');
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose Photo from Gallery'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context);
                  final picker = ImagePicker();
                  final pickedFiles = await picker.pickMultiImage();
                  if (pickedFiles.isNotEmpty) {
                    for (var file in pickedFiles) {
                      viewModel.addMedia(File(file.path), 'image');
                    }
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Record a Video'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context);
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickVideo(source: ImageSource.camera);
                  if (pickedFile != null) {
                    viewModel.addMedia(File(pickedFile.path), 'video');
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.video_library),
                title: Text('Choose Video from Gallery'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context);
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickVideo(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    viewModel.addMedia(File(pickedFile.path), 'video');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Themetext.headline.copyWith(fontSize: 16),
      ),
      SizedBox(height: context.mediaQueryHeight / 70),
      if (viewModel.media.isEmpty)
        GestureDetector(
          onTap: showMediaSourceActionSheet,
          child: DottedBorder(
            dashPattern: const <double>[10, 5],
            color: AppColors.primary,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(6),
            child: SizedBox(
              height: context.mediaQueryHeight / 6,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/upload.svg', height: 40),
                  SizedBox(height: 8),
                  Text(
                    'Select Images and Videos',
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Select maximum 8 photos and videos ( maximum file size is 4 MB)',
                    style: TextStyle(color: AppColors.grey, fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
      SizedBox(height: 16),
      Consumer<SellSparePartsViewModel>(
        builder: (_, vm, __) {
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(vm.media.length, (index) {
              final mediaItem = vm.media[index];
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                      image: mediaItem['type'] == 'image'
                          ? DecorationImage(
                              image: FileImage(mediaItem['file']),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    clipBehavior: Clip
                        .antiAlias, // Ensures child is clipped to borderRadius
                    child: mediaItem['type'] == 'video'
                        ? VideoPlayerWidget(
                            videoFile: mediaItem['file'],
                          )
                        : null,
                  ),
                  if (mediaItem['type'] == 'video')
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black54,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FullScreenVideoPlayer(
                                  videoFile: mediaItem['file'],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: GestureDetector(
                      onTap: () => vm.removeMedia(index),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.close, color: Colors.white, size: 14),
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
      if (viewModel.media.isNotEmpty)
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: context.mediaQueryWidth / 1.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('If you want you can add more'),
                TextButton.icon(
                  onPressed: showMediaSourceActionSheet,
                  icon: Icon(Icons.add_a_photo, color: AppColors.primary),
                  label: Text('Add more',
                      style: TextStyle(color: AppColors.primary)),
                ),
              ],
            ),
          ),
        ),
    ],
  );
}

// Updated VideoPlayerWidget (if needed for consistency)
class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;

  const VideoPlayerWidget({required this.videoFile});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container(
            color: Colors.grey[300],
            child: Center(child: CircularProgressIndicator()),
          );
  }
}
