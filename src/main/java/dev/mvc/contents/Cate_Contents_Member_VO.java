package dev.mvc.contents;

import java.util.List;

import dev.mvc.cate.CateVO;
import dev.mvc.member.MemberVO;

public class Cate_Contents_Member_VO {
  /** ȸ�� ���� */
  private MemberVO memberVO;
  
  /** ī�װ� + ������ ��� */
  private List<Cate_Contents_VO> cate_contents_memberno_list;

  public MemberVO getMemberVO() {
    return memberVO;
  }

  public void setMemberVO(MemberVO memberVO) {
    this.memberVO = memberVO;
  }

  public List<Cate_Contents_VO> getCate_contents_memberno_list() {
    return cate_contents_memberno_list;
  }

  public void setCate_contents_memberno_list(List<Cate_Contents_VO> cate_contents_memberno_list) {
    this.cate_contents_memberno_list = cate_contents_memberno_list;
  }  

  
}








