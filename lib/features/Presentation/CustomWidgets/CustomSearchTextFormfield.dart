import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/usersearch_usecase.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/Suggestion/suggestion_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/searchyt_bloc/searchyt_bloc_bloc.dart';
import '../Blocs/Musicbloc/SearchSong_bloc/search_song_bloc.dart';
import 'package:norse/injection_container.dart' as di;
import '../pages/saavn/subscreens/SearchResultPage/SearchResultPage.dart';

class CustomSearchTextFormfield extends StatefulWidget {
  const CustomSearchTextFormfield({
    Key? key,
    required this.ontap,
    required this.searchController,
    required this.search,
    required this.enableFocusNode,
  });

  final VoidCallback ontap;
  final bool search;
  final TextEditingController searchController;
  final bool enableFocusNode;

  @override
  State<CustomSearchTextFormfield> createState() =>
      _CustomSearchTextFormfieldState();
}

class _CustomSearchTextFormfieldState extends State<CustomSearchTextFormfield> {
  final node = FocusNode();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        widget.enableFocusNode ? node.requestFocus() : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.zero,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7),
          child: TextFormField(
            onChanged: (value) {
              BlocProvider.of<SuggestionBloc>(
                context,
              ).add(SuggestionEvent.getSuggestion(value));
            },
            focusNode: node,
            onFieldSubmitted: (value) async {
              BlocProvider.of<SuggestionBloc>(
                context,
              ).add(const SuggestionEvent.started());
              BlocProvider.of<SearchytBlocBloc>(
                context,
              ).add(SearchytBlocEvent.getsearchdetails(value));
              if (widget.search) {
                BlocProvider.of<SearchSongBloc>(
                  context,
                ).add(GetSearchSong(Querydata: value));
                BlocProvider.of<SearchytBlocBloc>(
                  context,
                ).add(SearchytBlocEvent.getsearchdetails(value));
                Navigator.pushNamed(
                  context,
                  SearchResultscreen.searchscreen,
                  arguments: value,
                );
              }
              BlocProvider.of<SearchSongBloc>(
                context,
              ).add(GetSearchSong(Querydata: value));
              await di.di<Usersearchusecase>().call('insert', value);
            },
            style: GoogleFonts.aBeeZee(color: Colors.black),
            controller: widget.searchController,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: widget.ontap,
                icon: const Icon(Icons.search, color: Colors.black),
              ),

              contentPadding: EdgeInsets.only(top: 14),
              prefixIconColor: Colors.black,
              hintText: 'Search songs,movies,artist ..',
              hintStyle: GoogleFonts.aldrich(
                fontSize: 14,
                color: Colors.black.withValues(alpha: 0.4),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
