package test;
 
import javax.inject.Inject;
 
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.context.WebApplicationContext;
 
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CategrpContTest {
  
  private static final Logger logger = LoggerFactory.getLogger(CategrpContTest.class);
 
  @Inject
    private WebApplicationContext wac;
 
    private MockMvc mockMvc;  // Tomcat ���������� ��û�ΰ����� �۵���.
    
    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
        logger.info("setup............");
    }
 
    // INSERT INTO categrp(categrpno, classification, name, seqno, visible, rdate)
    // VALUES(1, 1, '����', 1, 'Y', sysdate);
    
    // Controller GET ��� ��û �׽�Ʈ, jsp view �̵��� üũ ����.
    /*
     * @Test public void testCreateGet() throws Exception{
     * mockMvc.perform(MockMvcRequestBuilders.get("/categrp/create.do")); }
     */
 
    // Controller POST ��� ��û �׽�Ʈ
    /*
     * @Test public void testCreatePost() throws Exception{ // �Ķ���� ����
     * MultiValueMap<String, String> multiValueMap = new LinkedMultiValueMap<>();
     * multiValueMap.add("name", "���� ã�� ����"); multiValueMap.add("seqno", "30"); //
     * ���ڵ� ���ڿ��� ���� ���� multiValueMap.add("visible", "Y");
     * 
     * // <form> �±׿��� ������ ȿ�� �߻�
     * mockMvc.perform(MockMvcRequestBuilders.post("/categrp/create.do").params(
     * multiValueMap));
     * 
     * }
     */
    
    
}
  
 