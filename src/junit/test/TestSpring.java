package junit.test;

import net.pkusoft.service.DatagridService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestSpring {
	ApplicationContext context;

	@Before
	public void sprintInit() {
		context = new ClassPathXmlApplicationContext( "config/spring-common.xml" );
	}

	@Test
	public void testSprintInit() {
		DatagridService datagridService = context.getBean( DatagridService.class );
		System.out.println( datagridService.getTotalNum() );
	}

}
