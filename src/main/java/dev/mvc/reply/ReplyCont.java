package dev.mvc.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;

@Controller
public class ReplyCont {
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc") // �̸� ����
  private ReplyProcInter replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // �̸� ����
  private AdminProcInter adminProc;
  
  public ReplyCont(){
    System.out.println("--> ReplyCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/reply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReplyVO replyVO) {
    int count = replyProc.create(replyVO);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
  /**
   * ��� ��ü ���, �����ڸ� ��ȸ ����
   * @param session
   * @return
   */
  @RequestMapping(value="/reply/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<ReplyVO> list = replyProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/reply/list"); // /webapp/reply/list.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }

  /**
   <xmp>
   http://localhost:9090/ojt/reply/list_by_contentsno.do?contentsno=1
   ���� ���� ���: {"list":[]}
   ���� �ִ� ���
   {"list":[
            {"memberno":1,"rdate":"2019-12-18 16:46:43","passwd":"123","replyno":3,"content":"��� 3","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:39","passwd":"123","replyno":2,"content":"��� 2","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:35","passwd":"123","replyno":1,"content":"��� 1","contentsno":1}
            ] 
   }
   </xmp>  
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_contentsno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno(int contentsno) {
    List<ReplyVO> list = replyProc.list_by_contentsno(contentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString(); 

  }
  
  /**
   * {"list":[
          {"memberno":1,
        "rdate":"2019-12-18 16:46:35",
      "passwd":"123",
      "replyno":1,
      "id":"user1",
      "content":"��� 1",
      "contentsno":1}
    ,
        {"memberno":1,
       "rdate":"2019-12-18 16:46:35",
       "passwd":"123",
       "replyno":1,
       "id":"user1",
       "content":"��� 1",
       "contentsno":1}
    ]
}
   * http://localhost:9090/ojt/reply/list_by_contentsno_join.do?contentsno=1
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_contentsno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno_join(int contentsno) {
    // String msg="JSON ���";
    // return msg;
    
    List<ReplyMemberVO> list = replyProc.list_by_contentsno_join(contentsno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
  /**
   * ������ ��ư ����¡ ���
   * http://localhost:9090/resort/reply/list_by_contentsno_add_view.do?contentsno=31&replyPage=1
   * @param contentsno ��� �θ�� ��ȣ
   * @param replyPage ���������
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_contentsno_add_view.do",
  method = RequestMethod.GET,
  produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno_add_view(int contentsno, int replyPage) {
	  HashMap<String, Object> map = new HashMap<String, Object>();
	  map.put("contentsno", contentsno); // #{contentsno}
	  map.put("replyPage", replyPage);     // #{replyPage}
	    
	  List<ReplyMemberVO> list = replyProc.list_by_contentsno_add_view(map);

	  JSONObject obj = new JSONObject();
	  obj.put("list", list);

	  return obj.toString();     
  }
  
  /**
   * http://localhost:9090/resort/reply/delete.do?replyno=1&passwd=1234
   * {"delete_count":0,"count":0}
   * {"delete_count":1,"count":1}
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete(int replyno, String passwd) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("replyno", replyno);
    map.put("passwd", passwd);
    
    int count = replyProc.checkPasswd(map); // �н����� �˻�
    int delete_count = 0;
    if (count == 1) {
      delete_count = replyProc.delete(replyno); // ��� ����
    }
    
    JSONObject obj = new JSONObject();
    obj.put("count", count); //�н����� ��ġ ����
    obj.put("delete_count", delete_count);
    
    return obj.toString();
  }
}