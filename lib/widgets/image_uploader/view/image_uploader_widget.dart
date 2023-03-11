import 'package:cached_network_image/cached_network_image.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/animation/my_animated_switcher.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/models/uploaded_file_model.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/image_picker_helper.dart';
import 'package:rws_app/widgets/image_uploader/cubit/image_uploader_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

Future<void> _pickImage(BuildContext context) async {
  final cubit = context.read<ImageUploaderCubit>();
  final file = await ImagePickerHelper.pickImage(context, needCrop: false);
  if (file == null) return;
  cubit.startUploading(file);
}

class ImageUploaderWidget extends StatelessWidget {
  ImageUploaderWidget(XFile image, {super.key, this.id, this.onInitial})
      : _cubit = ImageUploaderCubit(id, image);

  late final ImageUploaderCubit _cubit;
  final String? id;
  final void Function(String? id)? onInitial;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..startUploading(),
      child: Builder(builder: (context) {
        return const _ImageItem();
      }),
    );
  }

  UploadedFileModel getUploadedFile() {
    return _cubit.state.uploadedFile;
  }
}

class _ImageItem extends StatelessWidget {
  const _ImageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploaderCubit, ImageUploaderState>(
      buildWhen: (previous, current) =>
          previous.uploadStatus != current.uploadStatus,
      builder: (context, state) {
        return MyAnimatedSwitcher(
          child: _buildChild(context, state.uploadStatus),
        );
      },
    );
  }

  Widget _buildChild(BuildContext context, BaseStatusEnum status) {
    switch (status) {
      case BaseStatusEnum.success:
        return const _SuccessView();
      case BaseStatusEnum.failure:
        return const _FailureView();
      case BaseStatusEnum.inprogress:
        return const _LoadingView();
      default:
        return const SizedBox();
      // return const _ChooseImageView();
    }
  }
}

// ==================
// Uploading View
// ==================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// ==================
// Failure View
// ==================
class _FailureView extends StatelessWidget {
  const _FailureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).dividerColor,
          ),
          CaptionWidget(S.of(context).upload_image_failure),
          const SizedBox(height: 16.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    context.read<ImageUploaderCubit>().cancelUploading(),
                icon: const Icon(Icons.delete_outline),
                iconSize: 20,
                splashRadius: 25,
                color: AppColor.danger,
              ),
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: () => _pickImage(context),
                icon: const Icon(Icons.camera_alt_outlined),
                iconSize: 20,
                splashRadius: 25,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: () =>
                    context.read<ImageUploaderCubit>().startUploading(),
                icon: const Icon(Icons.refresh_outlined),
                iconSize: 20,
                splashRadius: 25,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==================
// Success View
// ==================
class _SuccessView extends StatelessWidget {
  const _SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploaderCubit, ImageUploaderState>(
      buildWhen: (previous, current) =>
          previous.uploadedFile != current.uploadedFile,
      builder: (context, state) {
        return FlatCard(
          // onTap: () => context.read<ImageUploaderCubit>().openFile(),
          // onHover: (value) =>
          //     context.read<ImageUploaderCubit>().toggleActionButton(value),
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: state.uploadedFile.url,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () =>
                        context.read<ImageUploaderCubit>().cancelUploading(),
                    icon: const Icon(Icons.delete_outline),
                    iconSize: 20,
                    splashRadius: 25,
                    color: AppColor.danger,
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    onPressed: () => _pickImage(context),
                    icon: const Icon(Icons.camera_alt_outlined),
                    iconSize: 20,
                    splashRadius: 25,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// ==================
// Choose Image View
// ==================
// class _ChooseImageView extends StatelessWidget {
//   const _ChooseImageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FlatCard(
//       onTap: () => _pickImage(context),
//       borderRadius: 14.0,
//       color: Theme.of(context).dividerColor.withOpacity(.1),
//       child: Center(
//         child: Image.asset(
//           AssetPath.iconAddPhoto,
//           width: 60,
//           color: Theme.of(context).primaryColor,
//         ),
//       ),
//     );
//   }
// }
