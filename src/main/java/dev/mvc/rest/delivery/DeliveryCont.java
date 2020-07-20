package dev.mvc.rest.delivery;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/*private long deliveryno;
private String title;
private String content;
private String writer;
private String rdate;
*/

@RestController
public class DeliveryCont {
  public DeliveryCont() {
    System.out.println("--> DeliveryCont created");
  }

  // http://localhost:9090/resort/delivery_rest/create
  /**
   * ���
   * @param vo
   * @return
   */
  @RequestMapping(value = "/delivery_rest/create", method = RequestMethod.POST)
  public ResponseEntity<Integer> create(@RequestBody DeliveryVO vo) {
    System.out.println("��� ��û��: " + vo.toString());
    int cnt =1;
    
    // ��üȭ�ؼ� ���: int --> new Integer(cnt)
    ResponseEntity<Integer> entity = new ResponseEntity<Integer>(new Integer(cnt), HttpStatus.OK);
    return entity;
  }
  
  // http://localhost:9090/resort/delivery_rest/list/A001/1/A001
  // http://localhost:9090/resort/delivery_rest/list/A002/1/A001
  // [{"deliveryno":1,"title":"����1","content":"����1","writer":"�ۼ���1","rdate":"2020-0715"},{"deliveryno":2,"title":"����2","content":"����2","writer":"�ۼ���2","rdate":"2020-0715"},{"deliveryno":3,"title":"����3","content":"����3","writer":"�ۼ���3","rdate":"2020-0715"}]
  /**
   * ���
   * @return
   */
  @RequestMapping(value="/delivery_rest/list/{key}/{page}/{code}", 
                              method=RequestMethod.GET)
  public ResponseEntity<List<DeliveryVO>> list(
                                                         @PathVariable("key") String key,
                                                         @PathVariable("page") int page,
                                                         @PathVariable("code") String code) {
    System.out.println("key: " + key + " / page: " + page + " / code: " + code);

    List<DeliveryVO> list = new ArrayList<DeliveryVO>();
    if (key.equals("A001")) {
      DeliveryVO vo = new DeliveryVO(1, "����1", "����1", "�ۼ���1", "2020-0715");
      list.add(vo);
      
      vo = new DeliveryVO(2, "����2", "����2", "�ۼ���2", "2020-0715");
      list.add(vo);
      
      vo = new DeliveryVO(3, "����3", "����3", "�ۼ���3", "2020-0715");
      list.add(vo);
    } else { // Ű�� ��ġ���� �ʴ� ���
      DeliveryVO vo = new DeliveryVO(-999, "", "", "", "");
      list.add(vo);
      
    }
    
    ResponseEntity<List<DeliveryVO>> entity = new ResponseEntity<List<DeliveryVO>>(list, HttpStatus.OK);
    return entity;
  }
  
  // http://localhost:9090/resort/delivery_rest/read/100
  // {"deliveryno":100,"title":"����1","content":"����1","writer":"�ۼ���1","rdate":"2020-0715"}
  /**
   * ��ȸ
   * @return
   */
  @RequestMapping(value="/delivery_rest/read/{deliveryno}", 
                              method=RequestMethod.GET)
  public ResponseEntity<DeliveryVO> read(@PathVariable("deliveryno") int deliveryno) {
    System.out.println("�б� ��û��.");
    DeliveryVO vo = new DeliveryVO(deliveryno, "����1", "����1", "�ۼ���1", "2020-0715");
    
    ResponseEntity<DeliveryVO> entity = new ResponseEntity<DeliveryVO>(vo, HttpStatus.OK);
    return entity;
  }
  
  // http://localhost:9090/resort/delivery_rest/update
  /**
   * ����
   * @param vo
   * @return
   */
  @RequestMapping(value = "/delivery_rest/update", 
                              method = RequestMethod.PUT)
  public ResponseEntity<Integer> update(@RequestBody DeliveryVO vo) {
    System.out.println("������ ��ü ����: " + vo.toString());
    int cnt =1;
    
    ResponseEntity<Integer> entity = new ResponseEntity<Integer>(new Integer(cnt), HttpStatus.OK);
    return entity;
  }
  
  // http://localhost:9090/resort/delivery_rest/delete/2022
  /**
   * ����
   * @param deliveryno
   * @return
   */
  @RequestMapping(value = "/delivery_rest/delete/{deliveryno}", 
                              method = RequestMethod.DELETE)
  public ResponseEntity<Integer> delete(@PathVariable("deliveryno") int deliveryno) {
    System.out.println("������ PK ��ȣ: " + deliveryno);
    int delete_pk =deliveryno;
    
    ResponseEntity<Integer> entity = new ResponseEntity<Integer>(new Integer(delete_pk), HttpStatus.OK);
    return entity;
  }
  
  /**
   * ���� ���ڿ�: delivery_list_jsonp({"list":[{"rdate":"2020-0715","deliveryno":1,"writer":"???1","title":"??1","content":"??1"},{"rdate":"2020-0715","deliveryno":2,"writer":"???2","title":"??2","content":"??2"},{"rdate":"2020-0715","deliveryno":3,"writer":"???3","title":"??3","content":"??3"}]})
   * ���, JSONP ��û
   * @return
   */
  @RequestMapping(value="/delivery_rest/list_jsonp/{callback}/{key}/{page}/{code}", 
                              method=RequestMethod.GET, produces = "application/text; charset=UTF-8")
  public ResponseEntity<String> list_jsonp(
                                                         @PathVariable("callback") String callback,
                                                         @PathVariable("key") String key,
                                                         @PathVariable("page") int page,
                                                         @PathVariable("code") String code) {
    System.out.println("callback: " + callback);
    System.out.println("key: " + key + " / page: " + page + " / code: " + code);

    List<DeliveryVO> list = new ArrayList<DeliveryVO>();
    if (key.equals("A001")) {
      DeliveryVO vo = new DeliveryVO(1, "����1", "����1", "�ۼ���1", "2020-0715");
      list.add(vo);
      
      vo = new DeliveryVO(2, "����2", "����2", "�ۼ���2", "2020-0715");
      list.add(vo);
      
      vo = new DeliveryVO(3, "����3", "����3", "�ۼ���3", "2020-0715");
      list.add(vo);
    } else { // Ű�� ��ġ���� �ʴ� ���
      DeliveryVO vo = new DeliveryVO(-999, "", "", "", "");
      list.add(vo);
      
    }
    JSONObject obj = new JSONObject();
    obj.put("list", list);    
    String rvalue = callback + "(" + obj.toString() + ")";    
    
    ResponseEntity<String> entity = new ResponseEntity<String>(rvalue, HttpStatus.OK);
    return entity;
  }
  
}