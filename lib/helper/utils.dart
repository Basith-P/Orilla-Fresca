import '../config/theme/colors.dart';
import '../models/category.dart';
import 'icon_helper.dart';

class Utils {
  static List<CategoryModel> getMockedCategories() {
    return [
      CategoryModel(
        color: AppColors.meats,
        name: "Carnes",
        imgName: "cat1",
        icon: IconFontHelper.meats,
        subCategories: [],
        // subCategories: [
        //   SubCategory(
        //       color: AppColors.meats, name: "Cerdo", imgName: "cat1_1", icon: IconFontHelper.meats),
        //   SubCategory(
        //     name: "Vaca",
        //     imgName: "cat1_2",
        //     icon: IconFontHelper.meats,
        //     color: AppColors.meats,
        //   ),
        //   SubCategory(
        //     name: "Gallina",
        //     imgName: "cat1_3",
        //     icon: IconFontHelper.meats,
        //     color: AppColors.meats,
        //   ),
        //   SubCategory(
        //     name: "Pavo",
        //     imgName: "cat1_4",
        //     icon: IconFontHelper.meats,
        //     color: AppColors.meats,
        //   ),
        //   SubCategory(
        //     name: "Chivo",
        //     imgName: "cat1_5",
        //     icon: IconFontHelper.meats,
        //     color: AppColors.meats,
        //   ),
        //   SubCategory(
        //     name: "Conejo",
        //     imgName: "cat1_6",
        //     icon: IconFontHelper.meats,
        //     color: AppColors.meats,
        //   )
        // ],
      ),
      CategoryModel(
          color: AppColors.fruits,
          name: "Frutas",
          imgName: "cat2",
          icon: IconFontHelper.fruits,
          subCategories: []),
      CategoryModel(
          color: AppColors.vegs,
          name: "Vegetales",
          imgName: "cat3",
          icon: IconFontHelper.vegs,
          subCategories: []),
      CategoryModel(
          color: AppColors.seeds,
          name: "Semillas",
          imgName: "cat4",
          icon: IconFontHelper.seeds,
          subCategories: []),
      CategoryModel(
          color: AppColors.pastries,
          name: "Dulces",
          imgName: "cat5",
          icon: IconFontHelper.pastries,
          subCategories: []),
      CategoryModel(
          color: AppColors.spices,
          name: "Especies",
          imgName: "cat6",
          icon: IconFontHelper.spices,
          subCategories: [])
    ];
  }
}
