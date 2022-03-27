import 'package:orilla_fresca/models/onboarding_content.dart';

import '../config/theme/colors.dart';
import '../models/category.dart';
import '../models/category_part.dart';
import '../models/sub_category.dart';
import 'icon_helper.dart';

class Utils {
  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
        msg: 'Fresh Products.\nFrom the Earth,\nto your table.',
        img: 'onboard1',
      ),
      OnboardingContent(
        msg: 'Meat and sausages\nfresh and healthy\nfor your delight',
        img: 'onboard2',
      ),
      OnboardingContent(
        msg: 'Get them from\nthe comfort of your\ndmobile device',
        img: 'onboard3',
      ),
    ];
  }

  static List<CategoryModel> getMockedCategories() {
    return [
      CategoryModel(
        color: AppColors.meats,
        name: "Carnes",
        imgName: "cat1",
        icon: IconFontHelper.meats,
        subCategories: [
          SubCategoryModel(
            color: AppColors.meats,
            price: 375,
            name: "Cerdo",
            imgName: "cat1_1",
            icon: IconFontHelper.meats,
            parts: [
              CategoryPart(name: 'Jamon', imgName: 'cat1_1_p1', isSelected: false),
              CategoryPart(name: 'Patas', imgName: 'cat1_1_p2', isSelected: false),
              CategoryPart(name: 'Tocineta', imgName: 'cat1_1_p3', isSelected: false),
              CategoryPart(name: 'Lomo', imgName: 'cat1_1_p4', isSelected: false),
              CategoryPart(name: 'Costillas', imgName: 'cat1_1_p5', isSelected: false),
              CategoryPart(name: 'Panza', imgName: 'cat1_1_p6', isSelected: false)
            ],
          ),
          SubCategoryModel(
            name: "Vaca",
            imgName: "cat1_2",
            icon: IconFontHelper.meats,
            color: AppColors.meats,
            price: 375,
            parts: [
              CategoryPart(name: 'Costilla', imgName: 'cat1_3_p1', isSelected: false),
              CategoryPart(name: 'Ribeye', imgName: 'cat1_3_p2', isSelected: false),
              CategoryPart(name: 'Sirloin', imgName: 'cat1_3_p3', isSelected: false),
              CategoryPart(name: 'Rabo', imgName: 'cat1_3_p4', isSelected: false),
            ],
          ),
          SubCategoryModel(
            name: "Gallina",
            imgName: "cat1_3",
            icon: IconFontHelper.meats,
            color: AppColors.meats,
            price: 375,
            parts: [
              CategoryPart(name: 'Alitas', imgName: 'cat1_2_p1', isSelected: false),
              CategoryPart(name: 'Pechuga', imgName: 'cat1_2_p2', isSelected: false),
              CategoryPart(name: 'Muslo', imgName: 'cat1_2_p3', isSelected: false),
              CategoryPart(name: 'Patas', imgName: 'cat1_2_p4', isSelected: false),
              CategoryPart(name: 'Corazones', imgName: 'cat1_2_p5', isSelected: false),
            ],
          ),
          SubCategoryModel(
            name: "Pavo",
            imgName: "cat1_4",
            icon: IconFontHelper.meats,
            color: AppColors.meats,
            price: 375,
            parts: [
              CategoryPart(name: 'Pechuga', imgName: 'cat1_4_p1', isSelected: false),
              CategoryPart(name: 'Muslo', imgName: 'cat1_4_p2', isSelected: false),
              CategoryPart(name: 'Alas', imgName: 'cat1_4_p3', isSelected: false)
            ],
          ),
          SubCategoryModel(
            name: "Chivo",
            imgName: "cat1_5",
            icon: IconFontHelper.meats,
            color: AppColors.meats,
            price: 375,
            parts: [
              CategoryPart(name: 'Chuletas', imgName: 'cat1_5_p1', isSelected: false),
              CategoryPart(name: 'Lomo', imgName: 'cat1_5_p2', isSelected: false),
              CategoryPart(name: 'Pierna', imgName: 'cat1_5_p3', isSelected: false)
            ],
          ),
          SubCategoryModel(
            name: "Conejo",
            imgName: "cat1_6",
            icon: IconFontHelper.meats,
            color: AppColors.meats,
            price: 375,
            parts: [
              CategoryPart(name: 'Lomo', imgName: 'cat1_6_p1', isSelected: false),
              CategoryPart(name: 'Pierna', imgName: 'cat1_6_p2', isSelected: false)
            ],
          ),
        ],
      ),
      CategoryModel(
        color: AppColors.fruits,
        name: "Frutas",
        imgName: "cat2",
        icon: IconFontHelper.fruits,
        subCategories: [
          SubCategoryModel(
            color: AppColors.fruits,
            name: "Kiwi",
            imgName: "cat2_1",
            icon: IconFontHelper.fruits,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.fruits,
            name: "Banana",
            imgName: "cat2_2",
            icon: IconFontHelper.fruits,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.fruits,
            name: "Toronja",
            imgName: "cat2_3",
            icon: IconFontHelper.fruits,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.fruits,
            name: "Naranja",
            imgName: "cat2_4",
            icon: IconFontHelper.fruits,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.fruits,
            name: "Aguacate",
            imgName: "cat2_5",
            icon: IconFontHelper.fruits,
            price: 375,
            parts: [],
          )
        ],
      ),
      CategoryModel(
        color: AppColors.vegs,
        name: "Vegetales",
        imgName: "cat3",
        icon: IconFontHelper.vegs,
        subCategories: [
          SubCategoryModel(
            color: AppColors.vegs,
            name: "Pimiento Rojo",
            imgName: "cat3_1",
            icon: IconFontHelper.vegs,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.vegs,
            name: "Zanahoria",
            imgName: "cat3_2",
            icon: IconFontHelper.vegs,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.vegs,
            name: "Espárrago",
            imgName: "cat3_3",
            icon: IconFontHelper.vegs,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.vegs,
            name: "Cebolla",
            imgName: "cat3_4",
            icon: IconFontHelper.vegs,
            price: 375,
            parts: [],
          )
        ],
      ),
      CategoryModel(
        color: AppColors.seeds,
        name: "Semillas",
        imgName: "cat4",
        icon: IconFontHelper.seeds,
        subCategories: [
          SubCategoryModel(
            color: AppColors.seeds,
            name: "Cajuil",
            imgName: "cat4_1",
            icon: IconFontHelper.seeds,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.seeds,
            name: "Maní",
            imgName: "cat4_2",
            icon: IconFontHelper.seeds,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.seeds,
            name: "Almendra",
            imgName: "cat4_3",
            icon: IconFontHelper.seeds,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.seeds,
            name: "Pistacho",
            imgName: "cat4_4",
            icon: IconFontHelper.seeds,
            price: 375,
            parts: [],
          )
        ],
      ),
      CategoryModel(
        color: AppColors.pastries,
        name: "Dulces",
        imgName: "cat5",
        icon: IconFontHelper.pastries,
        subCategories: [
          SubCategoryModel(
            color: AppColors.pastries,
            name: "Dulce de Leche",
            imgName: "cat5_1",
            icon: IconFontHelper.pastries,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.pastries,
            name: "Dulce de Naranja",
            imgName: "cat5_2",
            icon: IconFontHelper.pastries,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.pastries,
            name: "Dulce de Guayaba",
            imgName: "cat5_3",
            icon: IconFontHelper.pastries,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.pastries,
            name: "Dulce de Coco",
            imgName: "cat5_4",
            icon: IconFontHelper.pastries,
            price: 375,
            parts: [],
          )
        ],
      ),
      CategoryModel(
        color: AppColors.spices,
        name: "Especies",
        imgName: "cat6",
        icon: IconFontHelper.spices,
        subCategories: [
          SubCategoryModel(
            color: AppColors.spices,
            name: "Orégano",
            imgName: "cat6_1",
            icon: IconFontHelper.spices,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.spices,
            name: "Bija",
            imgName: "cat6_2",
            icon: IconFontHelper.spices,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.spices,
            name: "Pimienta",
            imgName: "cat6_3",
            icon: IconFontHelper.spices,
            price: 375,
            parts: [],
          ),
          SubCategoryModel(
            color: AppColors.spices,
            name: "Canela",
            imgName: "cat6_4",
            icon: IconFontHelper.spices,
            price: 375,
            parts: [],
          )
        ],
      )
    ];
  }
}
