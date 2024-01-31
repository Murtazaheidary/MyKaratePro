package insurance.api.tek.utility;


import net.datafaker.Faker;
import net.datafaker.providers.base.PhoneNumber;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

public class DataGenerator {
    public static String getEmail() {
        Faker faker = new Faker();
        return faker.name().firstName() + faker.name().lastName() + "@gmail.com";
    }

    public static String getFirstName() {
        Faker faker = new Faker();
        return faker.name().firstName();
    }

    public static String getLastName() {
        Faker faker = new Faker();
        return faker.name().lastName();
    }

    public static String getTitle() {
        Faker faker = new Faker();
        return faker.name().prefix().toUpperCase();
    }

    public static String getGender() {
        Faker faker = new Faker();
        return faker.dog().gender().toUpperCase();
    }

    public static String getEmploymentStatus() {
        Faker faker = new Faker();
        return faker.job().position();
    }

    public static String getMaritalStatus() {
        ArrayList<String> maritalStatus = new ArrayList<String>();
        maritalStatus.add("SINGLE");
        maritalStatus.add("MARRIED");
        maritalStatus.add("DIVORCED");
        maritalStatus.add("WIDOW");
        maritalStatus.add("WIDOWER");
        Collections.shuffle(maritalStatus);
        return maritalStatus.get(0);

    }

    public static String getDateOfBirth() {
        Faker faker = new Faker();
        Date date = faker.date().birthday();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }
    public static String getPhoneNumber(){
        Faker faker = new Faker();
        return faker.phoneNumber().subscriberNumber(10);
    }
    public static String getPhoneExtension(){
        Faker faker = new Faker();
        return faker.phoneNumber().extension();
    }
    public static String getPhoneType(){
        ArrayList<String> phoneType = new ArrayList<String>();
        phoneType.add("Home");
        phoneType.add("Work");
        phoneType.add("CellPhone");
        Collections.shuffle(phoneType);
        return phoneType.get(0);

    }
    public static String getPhoneTime(){
        ArrayList<String> phoneTime = new ArrayList<String>();
        phoneTime.add("Morning");
        phoneTime.add("Evening");
        phoneTime.add("Afternoon");
        Collections.shuffle(phoneTime);
        return phoneTime.get(0);
    }


}
