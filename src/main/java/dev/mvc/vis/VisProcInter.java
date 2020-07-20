package dev.mvc.vis;

public interface VisProcInter {
  /**
   * 코드에 해당하는 최상위 레코드 1건 선택 
   * @param code
   * @return
   */
  public VisVO read_top_code(String code);
  
  /**
   * 등록
   * @param visVO
   * @return
   */
  public int create(VisVO visVO);
  
}
