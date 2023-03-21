import 'package:flutter/material.dart';
import 'package:note_crud/data/api/note_api.dart';
import 'package:note_crud/pages/home/widgets/form_layout.dart';
import 'package:note_crud/pages/home/widgets/home_menu_row_widget.dart';
import 'package:note_crud/pages/home/widgets/note_card.dart';
import 'package:note_crud/pages/home/widgets/title_widget.dart';
import 'package:note_crud/provider/note_provider.dart';
import 'package:note_crud/utils/color_utils.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const String route = "/";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late NoteProvider provider;

  @override
  void initState() {
    provider = Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getNotes();
    });

    super.initState();
  }

  getNotes() async {
    var resp = await NoteApi.getAll();
    if (resp.status!) {
      provider.changeNoteList(resp.data);
    } else {
      //error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.bgColor,
      body: Column(
        children: [
          const TitleWidget(),
          const HomeMenuRowWidget(),
          Expanded(
            child: Consumer<NoteProvider>(
              builder: (context, pd, child) {
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: pd.notesLength,
                  itemBuilder: (ctx, idx) => NoteCard(
                    note: pd.notes[idx],
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: ColorUtils.btnColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) =>const FormLayout(),
          );
        },
      ),
    );
  }
}
