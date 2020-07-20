package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ReplyDAOInter {
  /**
   * ��� ���
   * @param replyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  /**
   * 
   * @return
   */
  public List<ReplyVO> list();
  
  public List<ReplyVO> list_by_contentsno(int contentsno);
  
  public List<ReplyMemberVO> list_by_contentsno_join(int contentsno);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int replyno);
  
  /**
   * ������ ��ư
   * @param map
   * @return
   */
  public List<ReplyMemberVO> list_by_contentsno_add_view(HashMap<String, Object> map);
  
  /**
   * 
   * <xmp>
   * <select id="read" resultType="ReplyMemberVO" parameterType="int">
   * </xmp>
   */
  public ReplyMemberVO read(int replyno);

}