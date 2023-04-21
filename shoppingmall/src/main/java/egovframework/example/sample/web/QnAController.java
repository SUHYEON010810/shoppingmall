package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {

	@RequestMapping(value = "/QnA.do")
	public String QnA() throws Exception {
		return "shop/QnA";
	}
}
