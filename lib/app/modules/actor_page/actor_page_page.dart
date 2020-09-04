import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:yshare/app/modules/actor_page/widgets/actor_info_widget.dart';
import 'package:yshare/app/modules/actor_page/widgets/actor_movie_list_widget.dart';
import 'package:yshare/app/modules/actor_page/widgets/actor_page_app_bar.dart';
import 'package:yshare/app/modules/actor_page/widgets/actor_participation_widget.dart';
import 'package:yshare/app/modules/actor_page/widgets/actor_tv_participation_widget.dart';
import 'package:yshare/domain/entities/actor_details.dart';
import 'package:yshare/domain/usecases/actor_details/get_actor_details_usecase.dart';

import 'actor_page_controller.dart';

class ActorPagePage extends StatefulWidget {
  final String title;
  final dynamic id;

  const ActorPagePage({
    Key key,
    this.title = 'ActorPage',
    this.id,
  }) : super(key: key);

  @override
  _ActorPagePageState createState() => _ActorPagePageState();
}

class _ActorPagePageState
    extends ModularState<ActorPagePage, ActorPageController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ActorDetails>(
      future: GetActorDetailsUsecase(
          actorId: widget.id, repository: controller.actorDetailsRepository)(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Container();
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.done:
            if (snapshot.data is ActorDetails) {
              return CustomScrollView(
                slivers: [
                  ActorPageAppBar(
                    controller: controller,
                    actorDetails: snapshot.data,
                    id: widget.id,
                  ),
                  ActorInfoWidget(
                    controller: controller,
                    actorDetails: snapshot.data,
                  ),
                  ActorMovieListWidget(
                      controller: controller,
                      id: snapshot.data.id.toString(),
                      color: Colors.blue[300]),
                  ActorParticipationWidget(
                      controller: controller,
                      id: snapshot.data.id.toString(),
                      color: Colors.teal[300]),
                  ActorTvParticipationWidget(
                    controller: controller,
                    id: snapshot.data.id.toString(),
                    color: Colors.deepOrange,
                  ),
                  SliverToBoxAdapter(
                    child: Container(padding: const EdgeInsets.only(top: 10)),
                  )
                ],
                physics: BouncingScrollPhysics(),
              );
            } else {
              return Container();
            }
            break;
          default:
            return Container();
            break;
        }
      },
    ));
  }
}
