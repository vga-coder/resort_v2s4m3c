package test;
 
import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MyBatisTest {
 
  @Inject 
  private SqlSessionFactory sqlSessionFactory;
  
  @Test
  public void testFactory(){
    System.out.println("������ MyBatis ó�� ��ü: " + sqlSessionFactory.hashCode());
   
  }
  
  @Test
  public void testSession() throws Exception{
    
    try {
      SqlSession session = sqlSessionFactory.openSession();
      System.out.println("MyBatis SQL session ���� Ȯ��: " + session.hashCode());
      
    }catch(Exception e){
      e.printStackTrace();
    }
    
  }
}
 
 