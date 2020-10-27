package ua.hpi.architectura.lab3.aspect;

import java.sql.*;

public aspect DbLoggerAspect {

	String databaseURL = "jdbc:ucanaccess://E://Ðèñóíêè//ÑÂßÒÎÅ//ÎÎÏ//Year3_lab3//lab.accdb";
	String sql = "INSERT INTO Data (StrArg) VALUES (?)";

	// print and println
	pointcut DbLogger(Object obj):
		call(public void java.io.PrintStream.print*(..)) && args(obj) && !within(DbLoggerAspect);

	void around(Object obj):DbLogger(obj)
	{
		System.out.println("Argument: " + obj + "\n Aspect Check for print functions");

		try (Connection connection = DriverManager.getConnection(databaseURL)) {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, obj.toString());
			int row = preparedStatement.executeUpdate();

			if (row > 0) {
				System.out.println("A row has been inserted successfully.");
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		proceed(obj);
	}

	// printStackTracea
	pointcut ExLogger():
		call(public void printStackTrace(..)) && !within(DbLoggerAspect);

	void around():ExLogger()
	{
		System.out.println("Aspect Check for StackTrace");
		proceed();
	}

}