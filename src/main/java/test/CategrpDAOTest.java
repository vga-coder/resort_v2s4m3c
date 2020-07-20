package test;
 
import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 
import dev.mvc.categrp.CategrpDAOInter;
import dev.mvc.categrp.CategrpVO;
 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
    "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class CategrpDAOTest {
 
  @Autowired
  private CategrpDAOInter categrpDAO = null;
 
    // ��� ��������� Test ������ �ּ� ó��
  @Test
  public void testCreate() throws Exception {
 
    CategrpVO categrpVO = new CategrpVO();
 
//    INSERT INTO categrp(categrpno, name, seqno, visible, rdate, cnt)
//    VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM categrp),
//                '�ؿ� ����', 1, 'Y', sysdate, 0);
 
    categrpVO.setName("���� ����");
    categrpVO.setSeqno(10);
    categrpVO.setVisible("Y");
 
    System.out.println(categrpDAO.create(categrpVO));
 
  }
  
  // ��ϵ� �ڷ�� ���� �׽�Ʈ, increaseCnt() update sql�� ���������� 1�� ������.
//  @Test
//  public void testIncreaseCnt() {
//    assertEquals(1, categrpDAO.increaseCnt(6));
//  }
 
}
