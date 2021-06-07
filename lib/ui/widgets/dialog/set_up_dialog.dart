import 'package:flutter_boiler_plate/app/app.locator.dart';
import 'package:flutter_boiler_plate/ui/widgets/dialog/details_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { basic, details }

void setUpDialogUi() {
  final dialogService = locator<DialogService>();
  final builders = {
    DialogType.details: (context, sheetRequest, completer) => DetailsDialog(
          request: sheetRequest,
          completer: completer,
        ),
  };
  dialogService.registerCustomDialogBuilders(builders);
}
