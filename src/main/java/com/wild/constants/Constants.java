package com.wild.constants;

import org.springframework.stereotype.Component;

public class Constants {
	//database
		public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
		public static final String URL = "jdbc:mysql://localhost:3306/multichoice?useLegacyDatetimeCode=false&serverTimezone=UTC";
		public static final String USERNAME = "root";
		public static final String PASSWORD = "";
		
		//upload
		public static final String DIR_UPLOAD = "templates/images";
}
