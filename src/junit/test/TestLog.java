package junit.test;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

public class TestLog {

	public static void main( String[] args ) {
		Logger logger = Logger.getLogger("Log");              
		BasicConfigurator.configure ();

		logger.trace("this is trace message from java");
		logger.debug("this is debug message from java");
		logger.info("this is info message from java");
		logger.fatal("this is fatal message from java");
		logger.error("this is error message from java");
		
		
		try {
		    int a = 1/0;
		} catch (Exception e) {
		    logger.warn("exception occurred", e);
		}
	}
	
}
