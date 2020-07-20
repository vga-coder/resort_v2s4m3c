package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberProcInter {
  /**
   * ���̵� �ߺ� üũ 
   * @param id
   * @return 0: �ߺ� �ƴ�, 1: �ߺ�
   */
  public int checkID(String id);
  
  /**
   * ȸ�� ����
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * ȸ�� ��ü ���
   * @return
   */
  public List<MemberVO> list();

  /**
   * ȸ�� ��ȸ
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * ���� ó��
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * ȸ�� ���� ó��
   * @param memberno
   * @return
   */
  public int delete(int memberno);

  /**
   * �н����� �˻�
   * @param map
   * @return 0: ��ġ���� ����, 1: ��ġ��
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * �н����� ����
   * @param map
   * @return ����� �н����� ����
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * �α��� ó��
   * <xmp>
   * <select id="login" resultType="int" parameterType="Map">
   * </xmp>
   * */
  public int login(Map<Object, Object> map);
  
  /**
   * ȸ�� ���� ��ȸ
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  /**
   * �α��ε� ȸ�� �������� �˻��մϴ�.
   * @param session
   * @return true: ������
   */
  public boolean isMember(HttpSession session);  
  
}




