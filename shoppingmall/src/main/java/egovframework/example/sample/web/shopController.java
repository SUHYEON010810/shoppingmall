package egovframework.example.sample.web;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.sample.service.productService;
import egovframework.example.sample.service.productVO;

@Controller
public class shopController {

	@Resource(name="productService")
	private productService productservice;


	/* index 페이지 */
	@RequestMapping(value = "/index.do")
	public String index() throws Exception {
		return "shop/index";
	}

	/* 사용자 상의 페이지 */
	@RequestMapping(value = "/clothesTop.do")
	public String clothesTop() throws Exception {
		return "shop/clothesTop";
	}

	/* 관리자 상의 페이지 */
	@RequestMapping(value = "/managerClothesTop.do")
	public String managerclothesTop(productVO vo, ModelMap model) throws Exception {
		vo.setKind("상의");

		List<?> list = productservice.SelectproductList(vo);
		System.out.println(list);

		model.addAttribute("top", list);

		return "manager/managerClothesTop";
	}

	/* 관리자 상품 추가 페이지 */
	@RequestMapping(value = "/productinsert.do")
	public String productinsert() throws Exception {
		System.out.println("상품 추가 페이지 이동");
		return "manager/productinsert";
	}

	/* 상품 추가 */
	@RequestMapping(value = "/productinsertsave.do")
	public String productinsertsave(productVO vo) throws Exception {
		System.out.println("회원가입 저장 컨트롤러 실행");
		System.out.println(vo.toString());

		String fileName = null;
        MultipartFile uploadFile = vo.getUploadFile();
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            fileName = uuid + "." + ext;
            uploadFile.transferTo(new File("D:\\sh_file\\shoppingmall" + fileName));
        }
        vo.setImage(fileName);

		/* 날짜 세팅*/
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		vo.setRegdate(date);

		String result = productservice.InsertProduct(vo);

		if(result == null)
			System.out.println("저장 완료");
		else
			System.out.println("저장 실패");

		return "redirect:managerClothesTop.do";
	}


}
