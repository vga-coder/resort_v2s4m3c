package dev.mvc.vis;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class VisCont {
  @Autowired
  @Qualifier("dev.mvc.vis.VisProc")
  private VisProcInter visProc;
  
  // http://localhost:9090/resort/vis/read_top_code.do?code=METER
  /**
   * �ڵ忡 �ش��ϴ� �ֻ��� ���ڵ� 1�� ���� JSON ���
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/vis/read_top_code.do", method=RequestMethod.GET ,
                              produces = "text/plain;charset=UTF-8" )
  public String checkID(String code) {
    VisVO visVO = this.visProc.read_top_code(code);
    
    JSONObject json = new JSONObject();
    json.put("data", visVO.getData());
    
    return json.toString(); 
  }
  
}


