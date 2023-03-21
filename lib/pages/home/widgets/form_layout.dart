import 'package:flutter/material.dart';
import 'package:note_crud/data/api/note_api.dart';
import 'package:note_crud/data/models/note_model.dart';
import 'package:note_crud/provider/note_provider.dart';
import 'package:note_crud/utils/color_utils.dart';
import 'package:provider/provider.dart';

class FormLayout extends StatefulWidget {
  final NoteModel? note;

  const FormLayout({super.key, this.note});

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  TextEditingController textEditingControllerTitle = TextEditingController();
  TextEditingController textEditingControllerDesc = TextEditingController();

  @override
  void initState() {
    reassignOldData();
    super.initState();
  }

  reassignOldData() {
    if (widget.note != null) {
      textEditingControllerTitle.text = widget.note?.title ?? '';
      textEditingControllerDesc.text = widget.note?.desc ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (ctx, pd, child) => Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 20,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.note == null ? "Create New" : "Update"} Note :',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: textEditingControllerTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                minLines: 3,
                maxLines: null,
                controller: textEditingControllerDesc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  minWidth: 120,
                  height: 50,
                  color: ColorUtils.btnColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    var title = textEditingControllerTitle.text.trim();
                    var desc = textEditingControllerDesc.text.trim();

                    if (widget.note != null) {
                      NoteModel note = NoteModel(
                        title: title,
                        desc: desc,
                        id: widget.note!.id!,
                      );
                      var resp = await NoteApi.update(note: note);

                      if (resp.status!) {
                        pd.update(resp.data);
                        Navigator.pop(context);
                      }
                    } else {
                      NoteModel note = NoteModel(title: title, desc: desc);
                      var resp = await NoteApi.create(note: note);

                      if (resp.status!) {
                        pd.add(resp.data);
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
