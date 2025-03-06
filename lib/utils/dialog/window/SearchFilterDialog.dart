import 'package:ems_app/define.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../../data/fakeData/FakeData.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_texts.dart';
import '../widget/DialogTitleBar.dart';

class SearchFilterDialog extends StatefulWidget {
  const SearchFilterDialog(
      {super.key,
      required this.keyword,
        required this.timeFilterIndex,
        required this.pageLabelIndex,
      required this.filterNotifications});

  final String keyword;
  final int timeFilterIndex;
  final int pageLabelIndex;
  final Function(String, int, int) filterNotifications;

  @override
  _SearchFilterDialog createState() => _SearchFilterDialog();
}

class _SearchFilterDialog extends State<SearchFilterDialog> {
  bool isAllowSearch = true;
  late TextEditingController _searchController;
  late double screenWidth;
  late int currentTimeFilterIndex;
  late int currentPageLabelIndex;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.keyword);
    currentTimeFilterIndex = widget.timeFilterIndex;
    currentPageLabelIndex = widget.pageLabelIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
      child: Container(
      padding: EdgeInsets.fromLTRB(24.sp, 20.sp, 24.sp, 24.sp),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: AppColors.white,
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DialogTitleBar(
              title: AppTexts.searchAndFilter,
              rightWidget: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: getImage(
                  "dialog_cancel.png",
                  height: 32.sp,
                  width: 32.sp,
                ),
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            getText(AppTexts.keywordSearch,
                fontSize: 14.sp, color: AppColors.primaryBlack),
            SizedBox(
              height: 8.sp,
            ),
            keywordSearchBar(),
            SizedBox(
              height: 16.sp,
            ),
            getText(AppTexts.timeRange,
                fontSize: 14.sp, color: AppColors.primaryBlack),
            SizedBox(
              height: 8.sp,
            ),
            timeSearchBar(),
            SizedBox(
              height: 16.sp,
            ),
            getText(AppTexts.pageLabel,
                fontSize: 14.sp, color: AppColors.primaryBlack),
            SizedBox(
              height: 8.sp,
            ),
            pageLabelList(departmentDataList),
            SizedBox(
              height: 36.sp,
            ),
            GestureDetector(
              onTap: () {
                widget.filterNotifications(
                    _searchController.text, currentTimeFilterIndex, currentPageLabelIndex);
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 8.sp, 0, 8.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isAllowSearch
                      ? AppColors.appPrimaryBlue
                      : AppColors.disableGrey,
                ),
                child: getText(
                  AppTexts.search,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  bool isShowClean = false;
  Widget keywordSearchBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.sp, 0.sp, 16.sp, 0.sp),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 1.sp, color: AppColors.borderGrey),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          getImageIcon("search.png",
              height: 16.sp, width: 16.sp, color: AppColors.grey),
          SizedBox(
            width: 8.sp,
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: AppTexts.search,
                hintStyle: TextStyle(color: AppColors.grey),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  isShowClean = value != '';
                });
              },
            ),
          ),
          if (isShowClean)
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowClean = false;
                });
                _searchController.clear();
              },
              child: getImage(
                "clean.png",
                height: 20.sp,
                width: 20.sp,
              ),
            ),
        ],
      ),
    );
  }

  Widget timeSearchBar() {
    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      color: AppColors.bgColor,
      elevation: 0,
      offset: Offset(-1, kToolbarHeight),
      itemBuilder: (context) => menuItemList(timeFilterList),
      child: Container(
        padding: EdgeInsets.fromLTRB(16.sp, 12.sp, 16.sp, 12.sp),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1.sp, color: AppColors.borderGrey),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: getText(
                timeFilterList[currentTimeFilterIndex].keys.first,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryBlack,
              ),
            ),
            getImage(
              "arrow_down.png",
              height: 20.sp,
              width: 20.sp,
            ),
          ],
        ),
      ),
      onSelected: (index) {
        setState(() {
          currentTimeFilterIndex = index;
        });
      },
    );
  }

  List<PopupMenuItem<int>> menuItemList(List<Map<String, int>> timeFilterList) {
    List<PopupMenuItem<int>> list = [];
    for (var i = 0; i < timeFilterList.length; i++) {
      list.add(PopupMenuItem<int>(
          padding: EdgeInsets.zero,
          height: 0,
          value: i,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: (i != timeFilterList.length - 1)
                      ? AppColors.borderGrey
                      : AppColors.bgColor,
                  width: 1,
                ),
              ),
              color: AppColors.bgColor,
            ),
            padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
            width: screenWidth,
            child: getText(
              timeFilterList[i].keys.first,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryBlack,
            ),
          )));
    }
    return list;
  }

  Widget pageLabelList(List<String> pageLabels) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 12.sp,
      runSpacing: 12.sp,
      children: List.generate(pageLabels.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentPageLabelIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: index == currentPageLabelIndex
                  ? AppColors.appPrimaryBlue
                  : AppColors.bgColor,
            ),
            child: getText(
              pageLabels[index],
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: index == currentPageLabelIndex
                  ? AppColors.white
                  : AppColors.primaryBlack,
            ),
          ),
        );
      }),
    );
  }
}
