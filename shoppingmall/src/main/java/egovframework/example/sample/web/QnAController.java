package egovframework.example.sample.web;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.QnAService;
import egovframework.example.sample.service.QnAVO;

@Controller
public class QnAController {
	@Resource(name="QnAService")
	private QnAService QnAservice;

	/* 문의 로그인 안했을 때 오류오류 처리 해야함.*/


	/* 문의 페이지 이동*/
	@RequestMapping(value = "/QnA.do")
	public String QnA(QnAVO vo, ModelMap model) throws Exception {
		// 상품 이름 리스트 가지고 오기
		// 매개변수 vo는 qna에 vo이기 때문에 product의 vo로 수정 해야함.
		// 지금은 sql에서 vo를 사용하지 않기 때문에 오류가 안남.
		List<?> list = QnAservice.SelectproductList(vo);
		model.addAttribute("product", list);

		//문의 리스트 가지고 오기
		List<?> qnalist = QnAservice.SelectQnAList(vo);
		System.out.println("문의 리스트 "+ qnalist);
		model.addAttribute("qnalist", qnalist);


		return "shop/QnA";
	}

	/* 문의 등록 */
	@ResponseBody
	@RequestMapping(value = "/QnAsave.do")
	public void QnAsave(QnAVO vo) throws Exception {
		System.out.println("qna 저장 들어옴");

		/* 날짜 세팅 */
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		vo.setIndate(date);

		System.out.println("vo 데이터"+vo.toString());
		System.out.println();

		String result = QnAservice.InsertQnA(vo);

		if(result == null)
			System.out.println("저장 완료");
		else
			System.out.println("저장 실패");

	}

	/* 문의 상세 보기 */
	@RequestMapping(value = "/QnADetail.do")
	public void QnADetail(QnAVO vo, @RequestParam("qseq") int qseq, HttpServletResponse response) throws Exception {
		System.out.println("문의 상세보기 들어옴");

		/* 한글 인코딩 설정 */
		response.setCharacterEncoding("utf-8");
		String personJson ;

		vo = QnAservice.seleteQnAData(qseq);
		System.out.println("상세보기 들어온 데이터 : "+vo.toString());

		personJson = "{\"qseq\":\"" + vo.getQseq() + "\",\"prodnum\":\"" + vo.getProdnum() +"\",\"u_id\":\"" + vo.getU_id() + "\",\"title\":\"" + vo.getTitle() + "\",\"content\":\"" + vo.getContent()+ "\",\"rep\":\"" + vo.getRep()+"\",\"indate\":\"" + vo.getIndate()+"\",\"name\":\"" + vo.getName() +"\",\"password\":\"\"}";

		try {
			response.getWriter().print(personJson);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


	/* 문의 수정 */
	@RequestMapping(value = "/QnAModify.do")
	public void QnAModify(QnAVO vo, @RequestParam("qseq") int qseq, HttpServletResponse response) throws Exception {
		System.out.println("문의 수정 들어옴");
		/* 한글 인코딩 설정 */
		response.setCharacterEncoding("utf-8");
		String personJson ;

		vo = QnAservice.seleteQnAData(qseq);
		System.out.println("수정 들어온 데이터 : "+vo.toString());

		personJson = "{\"qseq\":\"" + vo.getQseq() + "\",\"prodnum\":\"" + vo.getProdnum() +"\",\"u_id\":\"" + vo.getU_id() + "\",\"title\":\"" + vo.getTitle() + "\",\"content\":\"" + vo.getContent()+ "\",\"rep\":\"" + vo.getRep()+"\",\"indate\":\"" + vo.getIndate()+"\",\"name\":\"" + vo.getName() +"\",\"password\":\"\"}";

		try {
			response.getWriter().print(personJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* 수정 데이터 저장 */
	@RequestMapping(value = "/QnAModifysave.do")
	public void QnAModifysave(QnAVO vo, HttpServletResponse response) throws Exception {
		System.out.println("수정 저장 들어옴 ");
		System.out.println(vo.toString());
		int result = QnAservice.updateQnA(vo);
		if (result == 1) {
			System.out.println("수정 완료");
		} else {
			System.out.println("수정 실패");
		}

		System.out.println(result);
	}

	/* 문의 삭제 */
	@RequestMapping(value = "/QnADelect.do")
	public void QnADelect( @RequestParam("qseq") int qseq, QnAVO vo, HttpServletResponse response) throws Exception {
		System.out.println("문의 삭제 들어옴");

		int result = QnAservice.deleteQnA(qseq);

		if (result == 1) {
			System.out.println("삭제 완료");
		} else {
			System.out.println("삭제 실패");
		}
		System.out.println("redirect 사용 전 ==========");

	}

}
