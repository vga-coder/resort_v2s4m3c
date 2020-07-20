package dev.mvc.member;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
  @Autowired
  private MemberDAOInter memberDAO;
  
  public MemberProc(){

  }

  @Override
  public int checkID(String id) {
   int cnt = 0;
   cnt = this.memberDAO.checkID(id);
   return cnt;
  }

  @Override
  public int create(MemberVO memberVO) {
    int cnt = 0;
    cnt = this.memberDAO.create(memberVO);
    return cnt;
  }

  @Override
  public List<MemberVO> list() {
    List<MemberVO> list = null;
    list = this.memberDAO.list();
    return list;
  }

  @Override
  public MemberVO read(int memberno) {
    MemberVO memberVO = null;
    memberVO = this.memberDAO.read(memberno);
    return memberVO;
  }

  @Override
  public int update(MemberVO memberVO) {
    int cnt = 0;
    cnt = this.memberDAO.update(memberVO);
    return cnt;
  }

  @Override
  public int delete(int memberno) {
    int cnt = 0;
    cnt = this.memberDAO.delete(memberno);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = 0;
    cnt = this.memberDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = 0;
    cnt = this.memberDAO.passwd_update(map);
    return cnt;
  }

  @Override
  public int login(Map<Object, Object> map) {
    int cnt = this.memberDAO.login(map);
    return cnt;
  }

  @Override
  public MemberVO readById(String id) {
    MemberVO memberVO = this.memberDAO.readById(id);
    return memberVO;
  }
  
  public boolean isMember(HttpSession session){
    boolean sw = false; // �α������� ���� ������ �ʱ�ȭ
    
    String id = (String)session.getAttribute("id");
    
    if (id != null){
      sw = true;  // �α��� �� ���
    }
    return sw;
  }
  
}









