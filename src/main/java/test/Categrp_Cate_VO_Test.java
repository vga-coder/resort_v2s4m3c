package test;

import dev.mvc.cate.CateVO;
import dev.mvc.cate.Categrp_Cate_VO;
import dev.mvc.categrp.CategrpVO;

public class Categrp_Cate_VO_Test {

  public static void main(String[] args) {
    CategrpVO _categrpVO = new CategrpVO(1, "���", 1, "Y", "2020-05-13");
    CateVO _cateVO = new CateVO(1, 1, "����", 1, "Y", "2020-05-13", 1);
    
    Categrp_Cate_VO categrp_Cate_VO = new Categrp_Cate_VO();
    categrp_Cate_VO.setCategrpVO(_categrpVO);
    categrp_Cate_VO.setCateVO(_cateVO);
    
    CategrpVO categrpVO = categrp_Cate_VO.getCategrpVO();
    System.out.println("ī�װ� �׷�: " + categrpVO.getName());
    
    CateVO cateVO = categrp_Cate_VO.getCateVO();
    System.out.println("ī�װ�: " + cateVO.getName());
    
    
  }

}






