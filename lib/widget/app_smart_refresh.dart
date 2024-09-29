import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppSmartRefresh extends StatefulWidget {
  final Widget child;
  final bool noData;
  final Future Function() onRefresh;
  final Future Function() onLoading;
  const AppSmartRefresh({
    super.key,
    required this.onLoading,
    required this.onRefresh,
    required this.child,
    required this.noData,
  });

  @override
  State<AppSmartRefresh> createState() => _AppSmartRefreshState();
}

class _AppSmartRefreshState extends State<AppSmartRefresh> {
  final controller = RefreshController(initialRefresh: false);

  onRefresh() async {
    await widget.onRefresh();
    controller.refreshCompleted();
  }

  onLoad() async {
    if (widget.noData == false) {
      await widget.onLoading();
      controller.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoad,
      footer: CustomFooter(
        height: widget.noData ? 0 : 60.0,
        builder: (context, mode) {
          List<Widget> body;
          if (mode == LoadStatus.idle) {
            body = [
              const Icon(CupertinoIcons.arrow_up, size: 18),
              const SizedBox(width: 8),
              const Text("Tarik untuk memuat data"),
            ];
          } else if (mode == LoadStatus.loading) {
            body = [
              const CupertinoActivityIndicator(),
              const SizedBox(width: 8),
              const Text("Loading..."),
            ];
          } else if (mode == LoadStatus.canLoading) {
            body = [
              const Icon(CupertinoIcons.arrow_up, size: 18),
              const SizedBox(width: 8),
              const Text("Lepas untuk memuat data"),
            ];
          } else {
            body = [];
          }
          return Visibility(
            visible: !widget.noData,
            child: SizedBox(
              height: 55.0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: body,
                ),
              ),
            ),
          );
        },
      ),
      child: widget.child,
    );
  }
}
