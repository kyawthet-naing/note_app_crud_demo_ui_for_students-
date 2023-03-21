import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_crud/data/api/note_api.dart';
import 'package:note_crud/data/models/note_model.dart';
import 'package:note_crud/provider/note_provider.dart';
import 'package:note_crud/utils/color_utils.dart';
import 'package:provider/provider.dart';
import 'form_layout.dart';

class NoteCard extends StatefulWidget {
  final NoteModel note;
  const NoteCard({super.key, required this.note});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (ctx, pd, child) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    var resp = await NoteApi.delete(id: widget.note.id!);
                    if (resp.status!) {
                      pd.removeNote(widget.note);
                      setState(() {});
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) => FormLayout(note: widget.note),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorUtils.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: const Offset(3, 2),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorUtils.bgColor,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.note.title ?? ''),
                    SizedBox(
                      width: 350,
                      child: Text(
                        widget.note.desc ?? '',
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          //
        ),
      ),
    );
  }
}

/*

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            minLeadingWidth: 10,
            onTap: () {},
            leading: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.bgColor,
              ),
            ),
            title: Text(note.title ?? ''),
            subtitle: Text(
              note.desc ?? '',
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  
  
  }

*/
