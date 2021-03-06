package com.codeup.adlister.dao;

public class DaoFactory {
    private static Ads adsDao;
    private static Categories categoriesDao;
    private static Users usersDao;
    private static Images imagesDao;
    private static ValidationDao validationDao;
    private static Config config = new Config();

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Categories getCategoriesDao() {
        if (categoriesDao == null) {
            categoriesDao = new MySQLCategoriesDao(config);
        }
        return categoriesDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Images getImagesDao() {
        if (imagesDao == null) {
            imagesDao = new MySQLImagesDao(config);
        }
        return imagesDao;
    }

    public static ValidationDao getValidationDao() {
        if (validationDao == null) {
            validationDao = new ValidationDao(config);
        }
        return validationDao;
    }


}
