package tiger.api.test.data;


import java.util.Date;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;

public class DataGenerator {
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName()+ "@gmail.com";
	}
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();
		
	}
	public static String getfirstName() {
		Faker faker = new Faker();
      return faker.name().firstName();
}
	public static String getlastName() {
		Faker faker = new Faker();
		return faker.name().lastName();

	}
	public static String getDob() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
		return format.format(date);

	}

}

