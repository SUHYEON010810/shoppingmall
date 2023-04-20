package egovframework.example.sample.web;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.memberVO;

@Controller
public class memberController {

	@Resource(name="MemberService")
	private MemberService memberService;

	/* 로그인 폼 */
	@RequestMapping(value="/login.do")
	public String login() {
		return "member/login";
	}

	/* 로그인 저장 */
	/* 동적 이동 ajax를 사용하기 때문에 responsbody사용 */
	@ResponseBody
	@RequestMapping(value="/logincheck.do")
	public String logincheck(memberVO vo, HttpSession session) throws Exception{
		System.out.println("로그인 저장 시작");

		String mesage = "";
		int result = memberService.selectlogin(vo);
		int divide = memberService.selectmem_div(vo.getU_id());

		if(result == 1) {
			session.setAttribute("SessionUserID", vo.getU_id());
			session.setAttribute("Sessiondiv", divide);

			mesage="y";
		}else {
			mesage="n";
		}
		return mesage;
	}

	/* 로그아웃 */
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("SessionUserID");
		session.removeAttribute("Sessiondiv");

		return "shop/index";
	}

	/* 회원가입 폼 */
	@RequestMapping(value = "/signup.do")
	public String signup() throws Exception {
		return "member/signup";
	}

	/* 회원가입 저장 */
	@RequestMapping(value = "/signupsave.do")
	public String signupsave(memberVO vo) throws Exception {
		System.out.println("회원가입 저장 컨트롤러 실행");

		/* 이메일 + 도메인*/
		String email = vo.getEmail()+vo.getDomain();
		vo.setEmail(email);

		/* 도로명 주소 + 상세주소 */
		String address = vo.getAddress()+" / "+vo.getdAddress();
		vo.setAddress(address);

		/* 날짜 세팅 */
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		vo.setRegdate(date);

		System.out.println(vo.toString());

		String result = memberService.InsertMember(vo);

		if(result == null)
			System.out.println("저장 완료");
		else
			System.out.println("저장 실패");

		return "redirect:login.do";
	}

	/* id 중복 검사 */
	@ResponseBody
	@RequestMapping(value="/idcheck.do")
	public String idcheck(String u_id) throws Exception{
		String message = "";

		int count = memberService.idcheck(u_id);
		if(count == 0)
			message = "ok";

		return message;
	}



}
