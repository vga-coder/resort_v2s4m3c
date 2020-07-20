package dev.mvc.attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.contents.ContentsDAOInter;

@Component("dev.mvc.attachfile.AttachfileProc")
public class AttachfileProc implements AttachfileProcInter {
  @Autowired  // DI, Spring framework�� �ڵ� ������ DAO�� �ڵ� �Ҵ��.
  private AttachfileDAOInter attachfileDAO;
  
  public AttachfileProc(){

  }

  @Override
  public int create(AttachfileVO attachfileVO) {
    int cnt = 0;
    cnt = this.attachfileDAO.create(attachfileVO);
    
    return cnt;
  }

  @Override
  public List<AttachfileVO> list() {
    List<AttachfileVO> list = null;
    list= this.attachfileDAO.list();
    return list;
  }

  @Override
  public int delete(int attachfileno) {
    int cnt = 0;
    cnt = this.attachfileDAO.delete(attachfileno);
    return cnt;
    
  }

  @Override
  public AttachfileVO read(int attachfileno) {
    AttachfileVO attachfileVO =  null;
    attachfileVO = this.attachfileDAO.read(attachfileno);
    
    return attachfileVO;
  }

  @Override
  public List<AttachfileVO> list_by_contentsno(int contentsno) {
    List<AttachfileVO> list = this.attachfileDAO.list_by_contentsno(contentsno);
    return list;
  }
  
}





