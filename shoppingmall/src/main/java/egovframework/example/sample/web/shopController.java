package egovframework.example.sample.web;

import java.io.File;
import java.nio.file.Files;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	/* 사용자 상품 페이지 */
	@RequestMapping(value = "/clothesTop.do")
	public String clothesTop(productVO vo, ModelMap model, @RequestParam(value = "clothes", required = false) String clothes ) throws Exception {
		vo.setKind(clothes);


		int kindint = vo.getKindint();

		if(clothes != null) {
			if(clothes.equals("상의")) {
				vo.setKindint(1);
				kindint = 1;
			}else if (clothes.equals("하의")) {
				vo.setKindint(2);
				kindint = 2;
			}else if(clothes.equals("원피스")) {
				vo.setKindint(3);
				kindint = 3;
			}
		}
		if(kindint != 0) {
			if(kindint == 1)
				vo.setKind("상의");
			else if (kindint == 2)
				vo.setKind("하의");
			else
				vo.setKind("원피스");
		}

		/* 페이징 처리를 위해 토탈 갯수 얻어오기 */
		int total = productservice.selectTotal(vo);
		int totalPage = (int) Math.ceil((double)total/6);
		int viewPage = vo.getViewPage();
		int startIndex = (viewPage-1)*6+1;
		int endIndex = startIndex + (6-1);

		if(viewPage > totalPage || viewPage <1) {
			viewPage = 1;
		}

		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);

		System.out.println(vo.toString());

		List<?> list = productservice.SelectproductList(vo);
		System.out.println(list);

		model.addAttribute("top", list);
		model.addAttribute("tota", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("kindint", kindint);

		return "shop/clothesTop";
	}

	/* 관리자 상품 페이지 */
	@RequestMapping(value = "/managerClothesTop.do")
	public String managerclothesTop(productVO vo, ModelMap model, @RequestParam(value = "clothes", required = false) String clothes ) throws Exception {
		vo.setKind(clothes);

		int kindint = vo.getKindint();

		if(clothes != null) {
			if(clothes.equals("상의")) {
				vo.setKindint(1);
				kindint = 1;
			}else if (clothes.equals("하의")) {
				vo.setKindint(2);
				kindint = 2;
			}else if(clothes.equals("원피스")) {
				vo.setKindint(3);
				kindint = 3;
			}
		}
		if(kindint != 0) {
			if(kindint == 1)
				vo.setKind("상의");
			else if (kindint == 2)
				vo.setKind("하의");
			else
				vo.setKind("원피스");
		}

		/* 페이징 처리를 위해 토탈 갯수 얻어오기 */
		int total = productservice.selectTotal(vo);
		System.out.println("총 갯수"+total);
		int totalPage = (int) Math.ceil((double)total/6);
		int viewPage = vo.getViewPage();
		int startIndex = (viewPage-1)*6+1;
		int endIndex = startIndex + (6-1);



		if(viewPage > totalPage || viewPage <1) {
			viewPage = 1;
		}

		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);

		System.out.println(vo.toString());

		List<?> list = productservice.SelectproductList(vo);
		System.out.println("최종 리스트"+list);

		model.addAttribute("top", list);
		model.addAttribute("tota", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("kindint", kindint);

		System.out.println("총 페이지 "+totalPage);

		return "manager/managerClothesTop";
	}

	/* 관리자 상품 추가 페이지 */
	@RequestMapping(value = "/productinsert.do")
	public String productinsert(int kindint,  ModelMap model) throws Exception {
		System.out.println("상품 추가 페이지 이동");

		System.out.println(kindint);
		model.addAttribute("kindint", kindint);

		return "manager/productinsert";
	}

	/* 관리자 상품 추가 저장 페이지 */
	@RequestMapping(value = "/productinsertsave.do")
	public String productinsertsave(productVO vo, RedirectAttributes redirect) throws Exception {
		System.out.println("회원가입 저장 컨트롤러 실행");
		System.out.println(vo.toString());

		String fileName = null;
        MultipartFile uploadFile = vo.getUploadFile();
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            fileName = uuid + "." + ext;
            System.out.println("1");
            String path = System.getProperty("user.dir");
            System.out.println("현재 작업 경로: " + path);
            uploadFile.transferTo(new File("D:\\sh_file\\shoppingmall\\" + fileName));
            System.out.println("2");
        }
        vo.setImage(fileName);

		/* 날짜 세팅*/
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		vo.setRegdate(date);

		if(vo.getKindint() != 0) {
			if(vo.getKindint() == 1) {
				vo.setKind("상의");
			 	redirect.addAttribute("clothes", "상의");
			}else if (vo.getKindint() == 2) {
				vo.setKind("하의");
				redirect.addAttribute("clothes", "하의");
			}else {
				vo.setKind("원피스");
				redirect.addAttribute("clothes", "원피스");
			}
		}

		String result = productservice.InsertProduct(vo);

		if(result == null)
			System.out.println("저장 완료");
		else
			System.out.println("저장 실패");

		return "redirect:managerClothesTop.do";
	}

	/* 상위 상세보기 */
	@RequestMapping(value = "/productDetail.do")
	public String productDetail(int prodnum, ModelMap model) throws Exception {
		System.out.println("상세보기 들어옴");

		productVO vo = productservice.seleteproductData(prodnum);
		System.out.println(vo.toString());

		model.addAttribute("topdetail", vo);

		return "manager/topproductDetail";

	}

	/* 이미지 출력 */
	@RequestMapping(value = "imgLoad.do")
	public void imgLoad(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String fileName = req.getParameter("fileName");
		String realFilename = "";

		realFilename = "D:\\sh_file\\shoppingmall\\" + fileName;
		File file = new File(realFilename);

		if (!file.exists()) { // 파일이 존재하는지 확인
			System.out.println("파일 존재 x");
			return;
		}

        res.setHeader("Content-Length", String.valueOf(file.length()));
        res.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
        Files.copy(file.toPath(), res.getOutputStream());
	}

	/* 상품 수정 */
	@RequestMapping(value = "productModify.do")
	public String productModify(int prodnum, int kindint, ModelMap model) throws Exception {
		System.out.println("수정 들어옴");

		productVO vo = productservice.seleteproductData(prodnum);
		System.out.println(vo.toString());

		model.addAttribute("kindint", kindint);
		model.addAttribute("topdetail", vo);

		return "manager/productModify";
	}

	/* 상품 수정 저장*/
	@RequestMapping(value = "productModifysave.do")
	public String productModifysave(productVO vo, RedirectAttributes redirect) throws Exception {
		System.out.println("수정 저장 들어옴");

		 String fileName = null;
	        MultipartFile uploadFile = vo.getUploadFile();
	        if (!uploadFile.isEmpty()) {
	            String originalFileName = uploadFile.getOriginalFilename();
	            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
	            UUID uuid = UUID.randomUUID(); // UUID 구하기
	            fileName = uuid + "." + ext;
	            System.out.println("1");
	            String path = System.getProperty("user.dir");
	            System.out.println("현재 작업 경로: " + path);
	            uploadFile.transferTo(new File("D:\\sh_file\\shoppingmall\\" + fileName));
	            System.out.println("2");
	        }
	    vo.setImage(fileName);

	    if(vo.getKindint() != 0) {
			if(vo.getKindint() == 1) {
				vo.setKind("상의");
			 	redirect.addAttribute("clothes", "상의");
			}else if (vo.getKindint() == 2) {
				vo.setKind("하의");
				redirect.addAttribute("clothes", "하의");
			}else {
				vo.setKind("원피스");
				redirect.addAttribute("clothes", "원피스");
			}
		}

	    int result = productservice.updateproduct(vo);
		if (result == 1) {
			System.out.println("수정 완료");
		} else {
			System.out.println("수정 실패");
		}

		System.out.println(result);

		return "redirect:managerClothesTop.do";
	}

	/* 상품 삭제 */
	@RequestMapping(value = "productDelect.do")
	public String productDelect(productVO vo, int prodnum, int kindint, RedirectAttributes redirect) throws Exception {
		int result = productservice.productDelect(prodnum);

		 if(vo.getKindint() != 0) {
				if(vo.getKindint() == 1) {
					vo.setKind("상의");
				 	redirect.addAttribute("clothes", "상의");
				}else if (vo.getKindint() == 2) {
					vo.setKind("하의");
					redirect.addAttribute("clothes", "하의");
				}else {
					vo.setKind("원피스");
					redirect.addAttribute("clothes", "원피스");
				}
			}

		System.out.println("kindint 값 : "+kindint);
		if (result == 1) {
			System.out.println("삭제 완료");
		} else {
			System.out.println("삭제 실패");
		}

		return "redirect:managerClothesTop.do";
	}



}
