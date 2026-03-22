import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_app/models/task.dart';
import 'package:hive_app/services/get_it.dart';
import 'package:hive_app/services/service_manager.dart';
import 'package:hive_app/widgets/custom_listview.dart';
import 'package:hive_app/widgets/customer_search_delegate.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Task> _allTasks;
  late final ServiceManager _serviceManager;

  @override
  void initState() {
    super.initState();
    _serviceManager = GetItService.locator<ServiceManager>();
    _allTasks = _serviceManager.getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            _showBottomSheetTask();
          },
          child: Text(
            "appbar_title".tr(),
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showSearch();
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              _showBottomSheetTask();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: CustomListView(allTasks:_allTasks),
    );
  }

  void _showBottomSheetTask() {
    showModalBottomSheet(
      context: context,
      builder: (yeniContext) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          width: MediaQuery.of(context).size.width,
          child: ListTile( 
            title: TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "add_task".tr(),
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) async {
                var date = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  helpText: 'choose_a_date'.tr(),
                  cancelText: "date_cancellation".tr(),
                );
                if(date==null){
                  return ;
                }
                var dateTime=DateTime.now().copyWith(
                  hour: date.hour,
                  minute: date.minute
                );
                Task currentTask = Task.create(
                  value,
                  dateTime,
                );
                _allTasks.insert(0, currentTask);
                var serviceManager = GetItService.locator<ServiceManager>();
                await serviceManager.addTask(currentTask);
                if (!context.mounted) return;
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  void _showSearch() async {
    await showSearch(
      context: context,
      delegate: CustomSearchDelegate(allTasks: _allTasks),
    );
    setState(() {});
  }
}
