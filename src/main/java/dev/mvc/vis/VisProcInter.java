package dev.mvc.vis;

public interface VisProcInter {
  /**
   * �ڵ忡 �ش��ϴ� �ֻ��� ���ڵ� 1�� ���� 
   * @param code
   * @return
   */
  public VisVO read_top_code(String code);
  
  /**
   * ���
   * @param visVO
   * @return
   */
  public int create(VisVO visVO);
  
}
